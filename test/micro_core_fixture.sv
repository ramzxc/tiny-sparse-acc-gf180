`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
`include "defs/micro_defs.vh"

// Simulation-only wiring; not a production core or Tiny Tapeout top.
module micro_core_fixture (
    input clk,
    input rst_n,
    input [`HOST_INST_WIDTH-1:0] host_inst,
    input host_inst_val,
    output host_rdy,
    output done,
    output error,

    input mem_itf_rdy,
    output read_en,
    output write_en,
    output copy_en,
    output [`MEM_ADDR_WIDTH-1:0] src_addr,
    output [`MEM_ADDR_WIDTH-1:0] dst_addr,
    output [`DATA_WIDTH-1:0] write_data,
    input [`DATA_WIDTH-1:0] read_data,
    input read_data_val
);
    wire [`INST_WIDTH-1:0] inst;
    wire inst_val, core_rdy, mem_rdy;
    wire [`MEM_INST_WIDTH-1:0] mem_inst;
    wire mem_inst_val;
    wire [`EXE_INST_WIDTH-1:0] exe_inst;
    wire exe_inst_val;
    wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weight_data, input_data, vpu_result, act_result;
    wire weight_data_val, input_data_val, vpu_result_val, act_result_val;
    wire [2:0] act_op;
    reg exe_active;
    wire exe_rdy = !exe_active;

    // Ready means the complete VPU -> activation operation has finished.
    always @(posedge clk) begin
        if (!rst_n)
            exe_active <= 0;
        else if (exe_inst_val)
            exe_active <= 1;
        else if (act_result_val)
            exe_active <= 0;
    end

    micro_ctrl sequencer (
        .clk(clk), .rst_n(rst_n), .inst_in(host_inst),
        .inst_in_val(host_inst_val), .inst_in_rdy(host_rdy),
        .done(done), .error(error),
        .inst_out(inst), .inst_out_val(inst_val), .inst_out_rdy(core_rdy),
        .input_is_zero(input_data == 0), .input_data_val(input_data_val)
    );

    decoder decode (
        .rst_n(rst_n), .inst_in(inst), .inst_in_val(inst_val), .core_rdy(core_rdy),
        .mem_rdy(mem_rdy), .exe_rdy(exe_rdy),
        .mem_inst_out(mem_inst), .mem_inst_out_val(mem_inst_val),
        .exe_inst_out(exe_inst), .exe_inst_out_val(exe_inst_val)
    );

    mem_ctrl memory (
        .clk(clk), .rst_n(rst_n), .mem_inst_in(mem_inst), .mem_inst_in_val(mem_inst_val),
        .mem_rdy(mem_rdy), .mem_itf_rdy(mem_itf_rdy),
        .read_en(read_en), .write_en(write_en), .copy_en(copy_en),
        .src_addr(src_addr), .dst_addr(dst_addr), .write_data(write_data),
        .read_data(read_data), .read_data_val(read_data_val),
        .weight_data(weight_data), .weight_data_val(weight_data_val),
        .input_data(input_data), .input_data_val(input_data_val), .act_res_in(act_result)
    );

    vpu compute (
        .clk(clk), .rst_n(rst_n), .exe_inst_in(exe_inst), .exe_inst_in_val(exe_inst_val),
        .weight_data(weight_data), .weight_data_val(weight_data_val),
        .input_data(input_data), .input_data_val(input_data_val),
        .vpu_res_out(vpu_result), .act_op_out(act_op), .vpu_res_out_val(vpu_result_val)
    );

    act activation (
        .clk(clk), .rst_n(rst_n), .vpu_res_in(vpu_result), .act_op_in(act_op),
        .vpu_res_in_val(vpu_result_val), .act_res_out(act_result), .act_res_out_val(act_result_val)
    );
endmodule
