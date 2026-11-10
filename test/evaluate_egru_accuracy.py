"""Quick software accuracy check: current FP8 arithmetic versus float export.

Uses real recurrent state and FC readout. This is not an RTL network simulation.
Results use velocity labels, undoing target normalization before scoring.
"""
import argparse
import json
from pathlib import Path
import numpy as np
from generate_matvec_vectors import decode8, encode8, add8, mul8, sigmoid, tanh

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--data-dir', default='/docker/projects/egru/sim/data/maze/fixed16')
p.add_argument('--trials', type=int, default=3)
p.add_argument('--output', default='/tmp/egru-accuracy.json')
a = p.parse_args()
values = np.array([float(decode8(i)) if decode8(i) is not None else np.nan for i in range(256)])
add = np.array([add8(i, j) for i in range(256) for j in range(256)], dtype=np.uint8).reshape(256, 256)
mul = np.array([mul8(i, j) for i in range(256) for j in range(256)], dtype=np.uint8).reshape(256, 256)
sig = np.array([sigmoid(i) for i in range(256)], dtype=np.uint8)
tan = np.array([tanh(i) for i in range(256)], dtype=np.uint8)
def quantize(x):
    unique, inverse = np.unique(x, return_inverse=True)
    return np.array([encode8(float(v)) for v in unique], dtype=np.uint8)[inverse].reshape(x.shape)
def gemv(x, weights, bias):
    result = np.zeros(weights.shape[1], np.uint8)
    for k in np.flatnonzero(x & 127):
        result = add[mul[weights[k], x[k]], result]
    return add[result, bias]
def score(pred, target):
    error = pred - target
    r2 = 1 - (error**2).sum(axis=0) / ((target-target.mean(axis=0))**2).sum(axis=0)
    return dict(samples=len(target), r2_xy=r2.tolist(), r2_mean=float(r2.mean()),
                mae=float(np.abs(error).mean()), rmse=float(np.sqrt((error**2).mean())))
fields = dict(kernel='weight', recurrent_kernel='weight', bias='bias', recurrent_bias='bias',
              threshold='hidden', head_weight='head_weight', head_bias='head_bias')
wfile = np.load(Path(a.data_dir)/'fixed16_export.npz')
w = {k: wfile[k].astype(float)/2**int(wfile[f'fixed_{v}_fractional_bits']) for k,v in fields.items()}
q = {k: quantize(v) for k,v in w.items()}
d = np.load(Path(a.data_dir)/'test.npz')
fp_predictions, float_predictions, targets = [], [], []
for trial in range(min(a.trials, len(d['trial_offsets'])-1)):
    begin, end = map(int, d['trial_offsets'][trial:trial+2])
    inputs = d['input_q412'][begin:end].astype(float)/2**int(d['input_fractional_bits'])
    quantized = quantize(inputs)
    h = np.zeros(256, np.uint8); y = h.copy()
    hf = np.zeros(256); yf = hf.copy()
    for t, x in enumerate(inputs):
        vx = gemv(quantized[t], q['kernel'], q['bias'])
        vh = gemv(y, q['recurrent_kernel'], q['recurrent_bias'])
        ax, ar, ag = np.split(vx, 3); bx, br, bg = np.split(vh, 3)
        z, r = sig[add[ax,bx]], sig[add[ar,br]]
        g = tan[add[ag,mul[r,bg]]]
        cur = add[mul[z,h],mul[add[0x38,z ^ 128],g]]
        event = np.where(values[add[cur,q['threshold'] ^ 128]] > 0, 0x38, 0).astype(np.uint8)
        h = add[cur,mul[event,q['threshold']] ^ 128]
        y = mul[event,cur]
        prediction = values[gemv(y, q['head_weight'], q['head_bias'])]
        ax, ar, ag = np.split(x @ w['kernel'] + w['bias'], 3)
        bx, br, bg = np.split(yf @ w['recurrent_kernel'] + w['recurrent_bias'], 3)
        zf = 1/(1+np.exp(-np.clip(ax+bx,-80,80)))
        rf = 1/(1+np.exp(-np.clip(ar+br,-80,80)))
        cf = zf*hf + (1-zf)*np.tanh(ag+rf*bg)
        ef = cf > w['threshold']
        hf, yf = cf-ef*w['threshold'], ef*cf
        if d['target_valid'][begin+t] and np.isfinite(d['target_velocity'][begin+t]).all():
            fp_predictions.append(prediction*d['target_scale']+d['target_mean'])
            float_predictions.append((yf @ w['head_weight']+w['head_bias'])*d['target_scale']+d['target_mean'])
            targets.append(d['target_velocity'][begin+t])
    print(f'Trial {trial}: {end-begin} steps completed', flush=True)
fp, fl, target = map(np.asarray, (fp_predictions,float_predictions,targets))
report = dict(trials=min(a.trials,len(d['trial_offsets'])-1), fp8_vs_label=score(fp,target),
              float_vs_label=score(fl,target), fp8_vs_float=score(fp,fl),
              note='First consecutive test trials, zero state per trial; FP8 products/sums/readout, hard activations; float export uses sigmoid/tanh. Not full test-set or RTL execution.')
Path(a.output).write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(report, indent=2))
