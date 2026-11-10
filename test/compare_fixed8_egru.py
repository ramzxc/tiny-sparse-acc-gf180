"""First EGRU timestep: compare numeric formats, not full-network label accuracy.

Uses real exported weights/input and the existing hard sigmoid/tanh definitions.
Float reference uses unquantized arithmetic on the fixed16-exported source values.
Initial hidden/output state is zero, so recurrent matrices contribute zero.
"""
import argparse
import json
from pathlib import Path
import numpy as np
import fp8_reference as fp

p=argparse.ArgumentParser()
p.add_argument('--data-dir', default='/docker/projects/egru/sim/data/maze/fixed16')
p.add_argument('--output', required=True)
a=p.parse_args()
w=np.load(Path(a.data_dir)/'fixed16_export.npz')
d=np.load(Path(a.data_dir)/'test.npz')
x=d['input_q412'][int(d['trial_offsets'][0])].astype(float)/2**int(d['input_fractional_bits'])
k=w['kernel'].astype(float)/2**int(w['fixed_weight_fractional_bits'])
b=w['bias'].astype(float)/2**int(w['fixed_bias_fractional_bits'])
rb=w['recurrent_bias'].astype(float)/2**int(w['fixed_bias_fractional_bits'])
th=w['threshold'].astype(float).reshape(-1)/2**int(w['fixed_hidden_fractional_bits'])

def run(kind, frac=4):
    scale=2**frac
    clips=0
    def sat(v):
        nonlocal clips
        v=np.asarray(v); clips+=int(np.count_nonzero((v < -128)|(v>127)))
        return np.clip(v,-128,127).astype(np.int64)
    def apply(fn,*args): return np.vectorize(fn,otypes=[np.int64])(*args)
    def quant(v):
        if kind=='float': return np.asarray(v,dtype=float)
        if kind=='fixed': return sat(np.floor(np.asarray(v)*scale+0.5))
        return apply(lambda t: fp.encode8(fp.F(float(t))),v)
    def decode(v):
        if kind=='float': return v
        if kind=='fixed': return v/scale
        return np.vectorize(lambda t:float(fp.decode8(int(t))))(v)
    def add(x,y):
        if kind=='float':return x+y
        if kind=='fixed':return sat(x+y)
        return apply(lambda a,b:fp.add8(int(a),int(b)),x,y)
    def sub(x,y):
        if kind=='float':return x-y
        if kind=='fixed':return sat(x-y)
        return apply(lambda a,b:fp.add8(int(a),int(b)^128),x,y)
    def mul(x,y):
        if kind=='float':return x*y
        if kind=='fixed':return sat((x*y+scale//2)//scale)
        return apply(lambda a,b:fp.mul8(int(a),int(b)),x,y)
    def sig(x):
        if kind=='float':return np.clip(x/4+0.5,0,1)
        if kind=='fixed':return np.clip((x+2)//4+scale//2,0,scale)
        return apply(lambda a:fp.sigmoid(int(a)),x)
    def tanh(x):
        if kind=='float':return np.clip(x,-1,1)
        if kind=='fixed':return np.clip(x,-scale,scale)
        return apply(lambda a:fp.tanh(int(a)),x)
    qx,qk,qb,qrb,qt=map(quant,(x,k,b,rb,th))
    affine=quant(np.zeros(k.shape[1]))
    for i in range(len(x)):
        if qx[i]==0:continue
        if kind=='fixed':affine=sat((qk[i]*qx[i]+scale//2)//scale+affine)
        else:affine=add(mul(qk[i],qx[i]),affine)
    vx=add(affine,qb)
    z=sig(add(vx[:256],qrb[:256]))
    r=sig(add(vx[256:512],qrb[256:512]))
    candidate=tanh(add(vx[512:],mul(r,qrb[512:])))
    cur=mul(sub(quant(1),z),candidate)
    event=quant((decode(sub(cur,qt))>0).astype(float))
    h=sub(cur,mul(event,qt)); y=mul(event,cur)
    return dict(affine=decode(affine),cur=decode(cur),h=decode(h),y=decode(y),
                event=decode(event),saturations=clips)

reference=run('float')
results={}
for name,kind,frac in [('fp8','fp8',4)]+[(f'fixed8_F{f}','fixed',f) for f in range(1,7)]:
    out=run(kind,frac);metrics={}
    for key in ['affine','cur','h','y']:
        err=out[key]-reference[key]
        denominator=np.sum((reference[key]-np.mean(reference[key]))**2)
        metrics[key]={'mae':float(np.mean(abs(err))), 'rmse':float(np.sqrt(np.mean(err**2))),
                      'r2_percent':float(100*(1-np.sum(err**2)/denominator)) if denominator else None}
    metrics['event_agreement_percent']=float(np.mean(out['event']==reference['event'])*100)
    metrics['saturations_including_input_quantization']=out['saturations']
    results[name]=metrics
    print(name, json.dumps(metrics))
Path(a.output).write_text(json.dumps({'scope':'first timestep, 256 hidden units, no FC/label accuracy',
    'source':a.data_dir,'reference':'float arithmetic, fixed16 exported values, hard activations',
    'results':results},indent=2)+'\n')
