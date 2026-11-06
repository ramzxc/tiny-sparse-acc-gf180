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
PROJECT_SOURCES = tpu_pkg.sv inst_fifo.sv dma.sv weight_buffer.sv weight_load_ctrl.sv sparsity_ctrl.sv unified_buffer.sv accumulation_buffer.sv activation.sv activation_ctrl.sv vpu.sv vpu_ctrl.sv inst_decoder.sv tpu_core.sv tpu.sv psram_buffer_ctrl.sv psram_ctrl.sv qspi_memory_bus.sv qspi_flash_phy.sv qspi_flash_adapter.sv uart_byte.sv tt_um_tiny_sparse_acc_ramzxc.sv


ifneq ($(GATES),yes)

# RTL simulation:
COMPILE_ARGS += --timing --assert -Wno-fatal
VERILATOR_TRACE = 1
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog/gf180mcu_fd_sc_mcu7t5v0.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(CURDIR)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(CURDIR)/tb.v
TOPLEVEL = tb

# List test modules to run, separated by commas and without the .py suffix:
COCOTB_TEST_MODULES = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
