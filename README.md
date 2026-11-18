# Tiny sparse accelerator

현재 main은 rebuild RTL을 Synopsys로 합성·PnR한 GDS 코어를 wrapper에 통합합니다. FP8 E4M3FN, 기본 1 lane이며 micro controller와 내부 SRAM 매크로는 사용하지 않습니다. UART로 16비트 명령을 받아 외부 Flash/PSRAM에 접근합니다.

- [현재 구조와 명령어](docs/architecture.md)
- [핀과 사용 방법](docs/info.md)
- RTL: `src/rtl/`, 소스 목록: `src/sources.f`
- 생성 Verilog: `python3 scripts/generate_verilog.py`
- RTL 검증: `bash test/check_import.sh`
- Actions: GDS 코어와 wrapper 통합·배치·배선, precheck 및 GL 테스트

현재 rebuild 코어 GDS·LEF·넷리스트는 `macro/tiny_sparse_acc_core/`에 있습니다. 이전 구현은 Git 이력에서 확인할 수 있습니다.
