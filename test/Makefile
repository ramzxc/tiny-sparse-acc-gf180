# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
ifeq ($(GATES),yes)
SIM ?= icarus
else
SIM ?= verilator
endif
FST ?= -fst # Use more efficient FST format
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(CURDIR)/../src
PROJECT_SOURCES = $(shell cat $(SRC_DIR)/sources.f)


ifneq ($(GATES),yes)

# RTL simulation:
ifeq ($(shell cat $(SRC_DIR)/build_mode.txt),direct)
COMPILE_ARGS += -DTT_DIRECT_UCODE
endif
COMPILE_ARGS += --timing --assert -Wno-fatal
VERILATOR_TRACE = 1
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST -DTT_ICC2_HARDMACRO
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog/gf180mcu_fd_sc_mcu7t5v0.v

VERILOG_SOURCES += $(SRC_DIR)/physical/macros/tiny_sparse_acc_core/core.pg.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(CURDIR)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)/rtl -I$(SRC_DIR)/rtl/core

# Include the testbench sources:
VERILOG_SOURCES += $(CURDIR)/tb.v
TOPLEVEL = tb

# List test modules to run, separated by commas and without the .py suffix:
COCOTB_TEST_MODULES = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

ifeq ($(GATES),yes)
.PHONY: check-icc2-reset
check-icc2-reset:
	python3 $(CURDIR)/check_icc2_reset.py
$(SIM_BUILD)/sim.vvp: check-icc2-reset
endif
