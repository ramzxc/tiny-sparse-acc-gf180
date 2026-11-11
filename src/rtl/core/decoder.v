`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"

// Combinational dispatch of the FIFO head. No local instruction storage.
module decoder (
    input rst_n,

    input [`INST_WIDTH-1:0] inst_in,
    input inst_in_val,
    output reg core_rdy,

    // LOW throughout the operation, HIGH only when completed/idle.
    // SYNC relies on these being completion status, not queue space.
    input mem_rdy,
    input exe_rdy,

    output [`MEM_INST_WIDTH-1:0] mem_inst_out,
    output reg mem_inst_out_val,
    output [`EXE_INST_WIDTH-1:0] exe_inst_out,
    output reg exe_inst_out_val
);

    wire [`INST_OP_WIDTH-1:0] opcode =
        inst_in[`INST_WIDTH-1:`INST_PAYLOAD_WIDTH];

    // Address commands pass through; normal memory commands are repacked.
    assign mem_inst_out = inst_in[15] ? inst_in :
        {opcode[2:0], 4'b0, inst_in[8:0]};
    assign exe_inst_out = (opcode == `ACC_CLEAR)
        ? {`EXE_MODE_CLEAR, 7'b0}
        : (opcode == `ACTIVATE)
            ? {`EXE_MODE_ACTIVATE, 1'b0, inst_in[5:3], 3'b0}
            : (opcode == `VECTOR_PASS)
                ? {`EXE_MODE_INPUT, 1'b0, inst_in[5:3], 3'b0}
                : {`EXE_MODE_COMPUTE, inst_in[6:0]};

    always @(*) begin
        core_rdy = 0;
        mem_inst_out_val = 0;
        exe_inst_out_val = 0;

        if (rst_n && inst_in[15]) begin
            core_rdy = mem_rdy;
            mem_inst_out_val = inst_in_val && mem_rdy;
        end else if (rst_n) begin
            case (opcode)
                `FLASH_TO_SRAM, `SRAM_TO_VPU,
                `ACT_TO_SRAM, `SRAM_TO_FLASH: begin
                    core_rdy = mem_rdy;
                    mem_inst_out_val = inst_in_val && mem_rdy;
                end

                `EXECUTE, `ACC_CLEAR, `ACTIVATE, `VECTOR_PASS: begin
                    core_rdy = exe_rdy;
                    exe_inst_out_val = inst_in_val && exe_rdy;
                end

                // Retire the barrier when its resource is idle. No dispatch.
                `EXE_SYNC: core_rdy = exe_rdy;
                `MEM_SYNC: core_rdy = mem_rdy;
                `INST_NOP: core_rdy = 1;

                // As before, unsupported instructions retire without effects.
                default: core_rdy = 1;
            endcase
        end
    end

endmodule
