// Simulation-only X-pessimism correction for the packaged ICC2 netlist.
// check_icc2_reset.py proves these D inputs are zero for every binary
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

// SCK uses reconvergent Q / ~Q feedback after physical optimization.
// Reset D=0 is proved for SCK (32 combinations) and cycles_left[3] (8192).
always @(user_project.core.serial_memory.rst_n or
         user_project.core.serial_memory.HFSNET_0) begin
    if (user_project.core.serial_memory.rst_n === 1'b1 &&
        user_project.core.serial_memory.HFSNET_0 === 1'b0) begin
        force user_project.core.serial_memory.n222 = 1'b0;
        force user_project.core.serial_memory.n217 = 1'b0;
    end else begin
        release user_project.core.serial_memory.n222;
        release user_project.core.serial_memory.n217;
    end
end

// Rebuild data-controller state reset has the same reconvergent X pessimism.
always @(user_project.core.data.rst_n or user_project.core.data.HFSNET_0) begin
    if (user_project.core.data.rst_n === 1'b1 &&
        user_project.core.data.HFSNET_0 === 1'b0)
        force user_project.core.data.n140 = 1'b0;
    else
        release user_project.core.data.n140;
end
