// Simulation-only X-pessimism correction for the packaged ICC2 netlist.
// check_icc2_reset.py proves these six D inputs are zero for every binary
// combination during reset. Never force Q or initialize other registers.
// Release also on unknown reset, so reset faults still propagate.
always @(user_project.core.transmitter.rst_n or
         user_project.core.transmitter.HFSNET_0) begin
    if (user_project.core.transmitter.rst_n === 1'b1 &&
        user_project.core.transmitter.HFSNET_0 === 1'b0) begin
        force user_project.core.transmitter.n42 = 1'b0; // clk_cnt[6]
        force user_project.core.transmitter.n50 = 1'b0; // bit_idx[2]
    end else begin
        release user_project.core.transmitter.n42;
        release user_project.core.transmitter.n50;
    end
end

always @(user_project.core.receiver.rst_n or
         user_project.core.receiver.HFSNET_2) begin
    if (user_project.core.receiver.rst_n === 1'b1 &&
        user_project.core.receiver.HFSNET_2 === 1'b0) begin
        force user_project.core.receiver.n98 = 1'b0;  // clk_cnt[0]
        force user_project.core.receiver.n92 = 1'b0;  // clk_cnt[6]
        force user_project.core.receiver.n101 = 1'b0; // bit_idx[1]
        force user_project.core.receiver.n100 = 1'b0; // bit_idx[2]
    end else begin
        release user_project.core.receiver.n98;
        release user_project.core.receiver.n92;
        release user_project.core.receiver.n101;
        release user_project.core.receiver.n100;
    end
end
