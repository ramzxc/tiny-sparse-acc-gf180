# RTL architecture

현재 main은 micro controller 없이 16비트 명령을 UART로 직접 받습니다. 아래 `rtl/` 경로는 `src/rtl/`을 뜻합니다.

## 구조

```text
UART RX → inst_fifo → inst_decoder → exec_unit
                               └─→ data_ctrl → mem_itf → qspi_ctrl
                                      ↕
                                  exec_unit
```

- `exec_unit`: FP8 피연산자 보관, ADD/SUB/MUL, MUL 누산, activation.
  이전 `act.v`는 여기로 통합했습니다. 결과와 누산값은 다음 EXEC까지 유지합니다.
- `data_ctrl`: ADDR/MEM/DATA 해석, 주소 설정, 피연산자 읽기, 결과 스냅샷과 저장,
  sparse 읽기 생략. 별도 `mem_ctrl`은 없습니다.
- `mem_itf`: 명령어 해석 없이 QSPI 요청과 완료를 연결합니다.
- `inst_decoder`: FIFO 맨 앞 명령을 수락 가능한 유닛으로 보냅니다. pending 저장은 없습니다.
- `sources.f`: 실제 컴파일 소스 목록. generated/design.v는 이 목록에서 자동 생성한 Yosys용 파일입니다.

## 폭과 수치 형식

`rtl/defs/defs.vh`의 `COMPUTE_WIDTH`를 변경하거나 컴파일할 때
`-DCOMPUTE_WIDTH=4`처럼 지정할 수 있습니다.

- `COMPUTE_WIDTH`는 lane 수입니다. input/weight/누산값/결과 폭은 `8 * COMPUTE_WIDTH`입니다.
- EXEC는 lane별 연산기를 생성합니다. lane 수가 늘면 연산기 면적도 증가합니다.
- MEM 하나는 base 주소부터 `COMPUTE_WIDTH`바이트를 순차 전송합니다.
  lane 0이 가장 낮은 주소이자 데이터 벡터의 최하위 바이트입니다.
- 마지막 바이트까지 모은 뒤에만 exec 쪽 valid가 올라갑니다.
- base 주소는 자동 갱신하지 않습니다. 다음 벡터 주소는 ADDR로 설정합니다.
- FP8 형식은 E4M3FN(원소당 8비트)입니다. `DATA_WIDTH`만 바꿔 FP16이 되지는 않습니다.
  QSPI 전송 단위도 실제 프로토콜의 8비트 바이트입니다.
- 반올림은 nearest-even, 유한수 overflow는 ±448로 포화합니다.
- MUL 결과를 FP8로 반올림한 뒤 누산합니다. fused MAC은 아닙니다.
- 누산 옵션은 MUL에서만 지원합니다. ADD/SUB는 덮어쓰기입니다.
- SIGMOID/TANH는 기존 hard approximation입니다:
  `clamp(x/4+0.5, 0, 1)`, `clamp(x, -1, 1)`.

## 명령 형식

UART는 16비트 명령을 하위 바이트부터 두 바이트로 받습니다.
TX의 READY(0x01) 하나당 명령 하나를 보내면 됩니다.

| 명령 | 비트 배치 |
|---|---|
| ADDR | `[15:13]=001`, `[12]=low/high`, `[11:0]=주소 조각` |
| MEM | `[15:13]=010`, `[12]=read/write`, `[11:10]=device`, 나머지 reserved |
| EXEC | `[15:13]=011`, `[12]=accumulate`, `[11:10]=ADD/SUB/MUL`, `[9:7]=activation` |
| DATA | `[15:13]=100`, `[12]=load/store`, `[11]=dense/sparse`, `[10]=input/weight` |
| SYNC | opcode `111`: data와 exec가 모두 끝날 때까지 대기 |
| NOP | opcode `000` |

DATA_D/S opcode는 제거했습니다. DATA STORE에서는 sparse/target 비트를 사용하지 않습니다.
장치 선택은 `00=Flash`, `10=PSRAM A`, `11=PSRAM B`입니다.
컨트롤러 포트는 **24비트 byte address + 별도 2비트 device**입니다.
PSRAM의 실제 주소 범위는 23비트이며 Flash는 24비트입니다.

## 기본 사용 순서

1. `INST_DATA_LOAD_INPUT_DENSE` 또는 `..._SPARSE`로 다음 읽기 대상을 설정합니다.
2. `INST_ADDR_LOW(12'h...)`, `INST_ADDR_HIGH(12'h...)`로 base 주소를 설정합니다.
3. `INST_MEM_READ_DEVICE(MEM_PSRAM_A)`로 input 벡터를 읽습니다.
4. DATA LOAD WEIGHT로 대상과 sparse 여부를 바꾸고, 주소 설정 → MEM READ를 보냅니다.
5. `INST_SYNC` 후 `INST_EXEC_MUL_NOP` 등의 EXEC를 보냅니다.
6. `INST_SYNC` 후 `INST_DATA_STORE`로 현재 activation 결과 전체를 저장용 레지스터에 잡습니다.
7. 저장 주소를 설정하고 `INST_MEM_WRITE_DEVICE(MEM_PSRAM_B)`를 보냅니다.
8. 저장 완료가 필요하면 `INST_SYNC`로 기다립니다.

여기서 매크로 호출은 Verilog의 backtick 매크로입니다. 정확한 preset 이름과
호출 형태는 `rtl/defs/inst_defs.vh`를 참고하세요.

DATA LOAD는 설정 명령이며, 실제 읽기는 MEM READ가 수행합니다.
DATA STORE는 스냅샷 명령이며, 실제 쓰기는 MEM WRITE가 수행합니다.
STORE 이후 새 EXEC가 결과를 바꿔도 이전 스냅샷은 유지됩니다.
MEM WRITE 전에 DATA STORE를 보내세요. 초기 저장용 레지스터 값은 0입니다.

새 input을 읽으면 lane별 0 여부를 마스크에 기록합니다(+0/-0 모두 포함).
다음 input 읽기까지 유지되며 weight 읽기로는 바뀌지 않습니다.

- `INST_DATA_WEIGHT_SCALAR_SPARSE(cur)`: 저장된 input의 `cur` 원소를 모든
  연산 lane에 broadcast합니다. 그 원소가 0이면 weight 벡터 읽기를 생략하고
  zero weight를 전달합니다. 다른 input 원소가 비0이어도 생략합니다.
- `INST_DATA_WEIGHT_SCALAR(cur)`: 같은 broadcast 연산을 읽기 생략 없이 수행합니다.
- 기존 vector DATA preset은 lane별 원소 연산을 유지합니다. vector sparse는
  안전하게 모든 input이 0일 때만 읽기를 생략합니다.

`cur` 폭은 `max(1, clog2(COMPUTE_WIDTH))`이며 DATA의 bit 9부터 내려갑니다.
바로 다음 비트는 scalar 선택, 나머지 하위 비트는 reserved입니다.
1/2 lane에서는 not-so-tiny와 동일하게 bit 9=cur, bit 8=scalar입니다.
유효 범위는 `0 <= cur < COMPUTE_WIDTH`이며 잘못된 cur는 시뮬레이션 오류입니다.
압축된 sparse 저장 형식은 사용하지 않습니다.

EXEC와 DATA 유닛은 독립적입니다. 새로운 피연산자가 필요한 EXEC 앞에는 SYNC를
넣어야 합니다. 같은 클럭의 operand 갱신과 EXEC는 이전 operand로 연산합니다.

## 검증

프로젝트 루트에서:

```bash
bash test/check_import.sh
```

- 독립 유리수 기준값과 FP8/activation 7,280개 케이스 비교
- QSPI Flash/두 PSRAM 읽기·쓰기 및 reset, 지연 모델 테스트
- 실제 UART → FIFO → decoder → data/exec → QSPI 핀 통합 테스트
- COMPUTE_WIDTH=1, 2, 3, 4, 8: 연속 바이트 조립·저장, 누산, sparse 읽기 횟수 검증

테스트는 `test/`의 FP8 기준 모델과 메모리 모델을 재사용합니다.
Flash QE=1, PSRAM QPI 설정은 기존처럼 외부 초기화가 되어 있다고 가정합니다.
이 테스트는 기능 검증이며, 합성/PnR·타이밍 signoff 결과는 아닙니다.


## EGRU 및 FC 회귀 검사

`python3 test/test_sparse_egru.py`는 로컬 `/docker/projects/egru/sim/data/maze/fixed16`의 실제 maze 데이터를 이용해 첫 EGRU step과 FC를 실행합니다. 입력 182개, hidden 256개, FC 출력 2개를 FP8 기준 모델과 비교합니다. `--small --widths 1 2 3 4 8`로 축소 검사를 실행할 수 있습니다. 데이터 파일은 저장소에 포함하지 않습니다. UART/QSPI 대신 지연이 있는 vector 메모리를 연결한 기능 검사이며 정확도 또는 물리 타이밍 검사는 아닙니다.
