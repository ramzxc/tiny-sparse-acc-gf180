// Blackbox interface only. Physical implementation is the GF180 SRAM macro.
(* blackbox *) module gf180mcu_fd_ip_sram__sram512x8m8wm1 (
    input CLK, CEN, GWEN,
    input [7:0] WEN,
    input [8:0] A,
    input [7:0] D,
    output [7:0] Q
`ifdef USE_POWER_PINS
    , inout VDD, VSS
`endif
);
endmodule
