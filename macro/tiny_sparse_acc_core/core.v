// IC Compiler II Version Y-2026.03 Verilog Writer
// Generated on 11/17/2026 at 17:55:37
// Library Name: core.ndm
// Block Name: tt_um_tiny_sparse_acc_ramzxc
// User Label: finished
// Write Command: write_verilog -exclude { all_physical_cells } /docker/projects/tapeout/tiny-sparse-acc-gf180/test/output/fp8_experiment/pnr/exports/20261117_175536_1794905736922050/core.v
module qspi_ctrl ( clk , rst_n , req_val , req_rdy , req_write , req_addr , 
    req_data , read_data , read_data_val , sck , flash_sc_n , psram_a_sc_n , 
    psram_b_sc_n , dq_in , dq_out , dq_oe , VPWR , VGND , HFSNET_2 , 
    ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  req_val ;
output req_rdy ;
input  req_write ;
input  [24:0] req_addr ;
input  [7:0] req_data ;
output [7:0] read_data ;
output read_data_val ;
output sck ;
output flash_sc_n ;
output psram_a_sc_n ;
output psram_b_sc_n ;
input  [3:0] dq_in ;
output [3:0] dq_out ;
output [3:0] dq_oe ;
input  VPWR ;
input  VGND ;
input  HFSNET_2 ;
input  ZCTSNET_0 ;

wire write_reg ;
wire N318 ;
wire n194 ;
wire n195 ;
wire n196 ;
wire n197 ;
wire n198 ;
wire n199 ;
wire n200 ;
wire n201 ;
wire n202 ;
wire n203 ;
wire n204 ;
wire n205 ;
wire n206 ;
wire n207 ;
wire n208 ;
wire n209 ;
wire n210 ;
wire n211 ;
wire n212 ;
wire n213 ;
wire n214 ;
wire n215 ;
wire n216 ;
wire n217 ;
wire n218 ;
wire n219 ;
wire n220 ;
wire n221 ;
wire n222 ;
wire n1 ;
wire n2 ;
wire n3 ;
wire n4 ;
wire n5 ;
wire n6 ;
wire n7 ;
wire n8 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n25 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n32 ;
wire n33 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire tmp_net45 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire tmp_net47 ;
wire tmp_net50 ;
wire n61 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire n70 ;
wire n71 ;
wire n72 ;
wire n73 ;
wire n74 ;
wire n75 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81 ;
wire n82 ;
wire n83 ;
wire n84 ;
wire n85 ;
wire n86 ;
wire n87 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n94 ;
wire n95 ;
wire n96 ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n100 ;
wire n101 ;
wire n102 ;
wire n103 ;
wire n104 ;
wire n105 ;
wire n106 ;
wire n107 ;
wire n108 ;
wire n109 ;
wire n110 ;
wire n111 ;
wire n112 ;
wire n113 ;
wire n114 ;
wire n115 ;
wire n116 ;
wire n117 ;
wire n118 ;
wire n119 ;
wire n120 ;
wire n121 ;
wire n122 ;
wire n123 ;
wire n124 ;
wire n125 ;
wire n126 ;
wire n128 ;
wire n129 ;
wire n130 ;
wire n131 ;
wire n132 ;
wire n133 ;
wire n134 ;
wire n135 ;
wire n137 ;
wire n138 ;
wire n139 ;
wire n140 ;
wire n141 ;
wire n142 ;
wire n143 ;
wire n144 ;
wire n145 ;
wire n146 ;
wire n147 ;
wire n148 ;
wire n149 ;
wire n150 ;
wire n151 ;
wire n152 ;
wire n154 ;
wire n155 ;
wire n156 ;
wire n157 ;
wire n158 ;
wire n159 ;
wire n160 ;
wire n161 ;
wire n162 ;
wire n163 ;
wire n164 ;
wire n165 ;
wire n166 ;
wire n167 ;
wire n168 ;
wire n169 ;
wire n170 ;
wire n171 ;
wire n172 ;
wire n173 ;
wire n174 ;
wire n175 ;
wire n176 ;
wire n177 ;
wire n178 ;
wire n179 ;
wire n180 ;
wire n181 ;
wire n182 ;
wire n183 ;
wire n184 ;
wire n185 ;
wire n186 ;
wire n187 ;
wire n189 ;
wire n190 ;
wire n191 ;
wire n192 ;
wire n193 ;
wire n223 ;
wire tmp_net33 ;
wire n226 ;
wire n227 ;
wire n228 ;
wire n229 ;
wire n230 ;
wire n231 ;
wire n232 ;
wire n233 ;
wire n234 ;
wire n235 ;
wire [1:0] chip ;
wire [4:0] cycles_left ;
wire [2:0] operation ;
wire [3:0] state ;
wire [1:0] status_shift ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net51 ;
wire tmp_net52 ;
wire tmp_net54 ;
wire tmp_net55 ;
wire tmp_net56 ;
wire tmp_net72 ;
wire tmp_net73 ;
wire tmp_net74 ;
wire tmp_net75 ;
wire tmp_net79 ;
wire tmp_net82 ;
wire tmp_net83 ;
wire tmp_net84 ;
wire tmp_net85 ;
wire tmp_net94 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n196 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_0_ ( .D ( n205 ) , .CLK ( clk ) , 
    .Q ( chip[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_reg_reg ( .D ( n204 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( write_reg ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_1_ ( .D ( n200 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( operation[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_2_ ( .D ( n197 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n199 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_2_ ( .D ( n201 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( operation[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_0_ ( .D ( n215 ) , 
    .CLK ( clk ) , .Q ( status_shift[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N318 ) , 
    .CLK ( clk ) , .Q ( read_data_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_1_ ( .D ( n214 ) , 
    .CLK ( clk ) , .Q ( status_shift[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_0_ ( .D ( n202 ) , 
    .CLK ( clk ) , .Q ( operation[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_0_ ( .D ( n213 ) , 
    .CLK ( clk ) , .Q ( read_data[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_1_ ( .D ( n212 ) , 
    .CLK ( clk ) , .Q ( read_data[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_2_ ( .D ( n211 ) , 
    .CLK ( clk ) , .Q ( read_data[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_3_ ( .D ( n210 ) , 
    .CLK ( clk ) , .Q ( read_data[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_4_ ( .D ( n209 ) , 
    .CLK ( clk ) , .Q ( read_data[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_5_ ( .D ( n208 ) , 
    .CLK ( clk ) , .Q ( read_data[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_6_ ( .D ( n207 ) , 
    .CLK ( clk ) , .Q ( read_data[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_7_ ( .D ( n206 ) , 
    .CLK ( clk ) , .Q ( read_data[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_3_ ( .D ( n217 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( cycles_left[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_0_ ( .D ( n220 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( cycles_left[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_1_ ( .D ( n219 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( cycles_left[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_4_ ( .D ( n216 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( cycles_left[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_2_ ( .D ( n218 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( cycles_left[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 flash_sc_n_reg ( .D ( n195 ) , .CLK ( clk ) , 
    .Q ( flash_sc_n ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 psram_b_sc_n_reg ( .D ( n221 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( psram_b_sc_n ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 psram_a_sc_n_reg ( .D ( n194 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( psram_a_sc_n ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 sck_reg ( .D ( n222 ) , .CLK ( clk ) , 
    .Q ( sck ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_3_ ( .D ( n198 ) , .CLK ( clk ) , 
    .Q ( state[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_1_ ( .D ( n203 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( chip[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I ( chip[1] ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_2 U4 ( .A1 ( n75 ) , .A2 ( n145 ) , 
    .B ( n123 ) , .ZN ( dq_oe[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_2 U5 ( .A1 ( n74 ) , .A2 ( n1 ) , 
    .B1 ( n123 ) , .B2 ( n137 ) , .ZN ( dq_out[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_208 ( .A1 ( n158 ) , 
    .A2 ( tmp_net94 ) , .ZN ( n201 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U7 ( .I ( dq_oe[2] ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U8 ( .I ( n3 ) , .ZN ( dq_oe[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( n3 ) , .ZN ( dq_oe[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( state[2] ) , .ZN ( n193 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( state[3] ) , .ZN ( n76 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U12 ( .A1 ( n193 ) , .A2 ( n76 ) , 
    .A3 ( state[1] ) , .ZN ( n75 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( state[0] ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U14 ( .A1 ( n76 ) , .A2 ( state[2] ) , 
    .ZN ( n2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U15 ( .A1 ( n11 ) , .A2 ( n2 ) , 
    .A3 ( state[1] ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U16 ( .A1 ( write_reg ) , .A2 ( n17 ) , 
    .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( n2 ) , .ZN ( n82 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U18 ( .A1 ( n11 ) , .A2 ( state[1] ) , 
    .A3 ( n82 ) , .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U19 ( .A1 ( n75 ) , .A2 ( n123 ) , 
    .A3 ( n4 ) , .ZN ( dq_oe[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_48 ( .A1 ( req_addr[4] ) , 
    .A2 ( n56 ) , .B1 ( req_addr[12] ) , .B2 ( n55 ) , .C1 ( n57 ) , 
    .C2 ( req_addr[20] ) , .ZN ( tmp_net33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U21 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n88 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U22 ( .A1 ( n88 ) , .A2 ( n193 ) , 
    .ZN ( n78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U23 ( .A1 ( state[3] ) , .A2 ( rst_n ) , 
    .A3 ( n78 ) , .ZN ( req_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n186 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U25 ( .I ( n75 ) , .ZN ( n16 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U26 ( .A1 ( n82 ) , .A2 ( n186 ) , 
    .B ( n16 ) , .ZN ( n80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U27 ( .I ( write_reg ) , .ZN ( n185 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U28 ( .A1 ( n185 ) , .A2 ( n17 ) , 
    .ZN ( n128 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U29 ( .I ( n128 ) , .ZN ( n126 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( n4 ) , .ZN ( n118 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U31 ( .A1 ( n80 ) , .A2 ( n88 ) , 
    .A3 ( n126 ) , .A4 ( n118 ) , .ZN ( n25 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U32 ( .I ( chip[1] ) , .ZN ( n145 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U33 ( .A1 ( read_data[7] ) , .A2 ( n17 ) , 
    .B1 ( n16 ) , .B2 ( n1 ) , .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U34 ( .A1 ( n11 ) , .A2 ( n75 ) , 
    .ZN ( n89 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U35 ( .A1 ( chip[1] ) , 
    .A2 ( cycles_left[2] ) , .B1 ( cycles_left[4] ) , .B2 ( n1 ) , 
    .ZN ( n57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U36 ( .A1 ( chip[1] ) , 
    .A2 ( cycles_left[0] ) , .B1 ( cycles_left[2] ) , .B2 ( n145 ) , 
    .ZN ( n54 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U37 ( .I ( cycles_left[1] ) , .ZN ( n100 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( cycles_left[3] ) , .ZN ( n114 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U39 ( .A1 ( chip[1] ) , .A2 ( n100 ) , 
    .B1 ( n114 ) , .B2 ( n1 ) , .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U40 ( .A1 ( n54 ) , .A2 ( n51 ) , 
    .ZN ( n37 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( n51 ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U42 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( n37 ) , .A2 ( req_addr[7] ) , 
    .B1 ( n36 ) , .B2 ( req_addr[15] ) , .ZN ( n6 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( n54 ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U45 ( .A1 ( n51 ) , .A2 ( n58 ) , 
    .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U46 ( .A1 ( n55 ) , .A2 ( n58 ) , 
    .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U47 ( .A1 ( n39 ) , .A2 ( req_addr[3] ) , 
    .B1 ( n38 ) , .B2 ( req_addr[11] ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U48 ( .A1 ( n6 ) , .A2 ( n5 ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n57 ) , .A2 ( n51 ) , 
    .ZN ( n43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U50 ( .A1 ( n1 ) , .A2 ( cycles_left[2] ) , 
    .ZN ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U51 ( .I ( n65 ) , .ZN ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U52 ( .A1 ( n7 ) , .A2 ( req_addr[23] ) , 
    .B1 ( n54 ) , .B2 ( req_addr[19] ) , .ZN ( n8 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( n8 ) , .ZN ( n9 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U54 ( .A1 ( n57 ) , .A2 ( n10 ) , 
    .B1 ( n43 ) , .B2 ( n9 ) , .ZN ( n46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U55 ( .I ( n46 ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U56 ( .A1 ( n193 ) , .A2 ( n11 ) , 
    .A3 ( state[1] ) , .ZN ( n95 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U57 ( .A1 ( cycles_left[0] ) , 
    .A2 ( state[3] ) , .A3 ( n95 ) , .ZN ( n73 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( operation[2] ) , .ZN ( n175 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( operation[0] ) , .ZN ( n160 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U60 ( .A1 ( n175 ) , .A2 ( n160 ) , 
    .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n29 ) , .ZN ( n178 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U62 ( .I ( operation[1] ) , .ZN ( n165 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U63 ( .A1 ( n178 ) , .A2 ( n165 ) , 
    .ZN ( n189 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U64 ( .I ( n189 ) , .ZN ( n157 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U65 ( .A1 ( n157 ) , .A2 ( n185 ) , 
    .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U66 ( .I ( n64 ) , .ZN ( n12 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U67 ( .A1 ( n89 ) , .A2 ( n13 ) , 
    .B1 ( n73 ) , .B2 ( n12 ) , .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U68 ( .A1 ( n25 ) , .A2 ( n15 ) , 
    .A3 ( n14 ) , .ZN ( dq_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( read_data[6] ) , .A2 ( n17 ) , 
    .B1 ( n16 ) , .B2 ( n145 ) , .ZN ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U70 ( .A1 ( n37 ) , .A2 ( req_addr[6] ) , 
    .B1 ( n36 ) , .B2 ( req_addr[14] ) , .ZN ( n19 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U71 ( .A1 ( n39 ) , .A2 ( req_addr[2] ) , 
    .B1 ( n38 ) , .B2 ( req_addr[10] ) , .ZN ( n18 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U72 ( .A1 ( n19 ) , .A2 ( n18 ) , 
    .ZN ( n21 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U73 ( .I0 ( req_addr[22] ) , 
    .I1 ( req_addr[18] ) , .S ( n54 ) , .Z ( n20 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U74 ( .A1 ( n57 ) , .A2 ( n21 ) , 
    .B1 ( n43 ) , .B2 ( n20 ) , .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n45 ) , .ZN ( n22 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U76 ( .A1 ( n89 ) , .A2 ( n22 ) , 
    .B1 ( n73 ) , .B2 ( n189 ) , .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U77 ( .A1 ( n25 ) , .A2 ( n24 ) , 
    .A3 ( n23 ) , .ZN ( dq_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U78 ( .I ( n123 ) , .ZN ( n35 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( cycles_left[1] ) , 
    .A2 ( cycles_left[0] ) , .ZN ( n28 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U80 ( .I ( n28 ) , .ZN ( n26 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U81 ( .A1 ( cycles_left[2] ) , .A2 ( n26 ) , 
    .B ( state[3] ) , .C ( n95 ) , .ZN ( n34 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U82 ( .I ( cycles_left[0] ) , .ZN ( n94 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U83 ( .A1 ( n100 ) , .A2 ( n94 ) , 
    .ZN ( n85 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n85 ) , .ZN ( n102 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U85 ( .I ( cycles_left[2] ) , .ZN ( n27 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U86 ( .A1 ( cycles_left[1] ) , 
    .A2 ( write_reg ) , .B1 ( n94 ) , .B2 ( n27 ) , .ZN ( n31 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U87 ( .A1 ( n85 ) , .A2 ( n28 ) , 
    .ZN ( n97 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U88 ( .A1 ( n29 ) , .A2 ( n100 ) , 
    .B ( cycles_left[2] ) , .C ( n97 ) , .ZN ( n30 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U89 ( .A1 ( n157 ) , .A2 ( n31 ) , 
    .B1 ( n30 ) , .B2 ( n189 ) , .ZN ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U90 ( .A1 ( n102 ) , .A2 ( n185 ) , 
    .B ( chip[1] ) , .C ( n32 ) , .ZN ( n33 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( n35 ) , .A2 ( read_data[4] ) , 
    .B1 ( n34 ) , .B2 ( n33 ) , .ZN ( n70 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U92 ( .A1 ( n37 ) , .A2 ( req_addr[5] ) , 
    .B1 ( n36 ) , .B2 ( req_addr[13] ) , .ZN ( n41 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( n39 ) , .A2 ( req_addr[1] ) , 
    .B1 ( n38 ) , .B2 ( req_addr[9] ) , .ZN ( n40 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U94 ( .A1 ( n41 ) , .A2 ( n40 ) , 
    .ZN ( n44 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U95 ( .I0 ( req_addr[21] ) , 
    .I1 ( req_addr[17] ) , .S ( n54 ) , .Z ( n42 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U96 ( .A1 ( n57 ) , .A2 ( n44 ) , 
    .B1 ( n43 ) , .B2 ( n42 ) , .ZN ( n71 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U97 ( .A1 ( cycles_left[1] ) , .A2 ( n71 ) , 
    .A3 ( n94 ) , .ZN ( n48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U98 ( .A1 ( cycles_left[0] ) , .A2 ( n46 ) , 
    .B1 ( n94 ) , .B2 ( n45 ) , .C ( n100 ) , .ZN ( n47 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U99 ( .A1 ( n48 ) , .A2 ( n47 ) , 
    .B ( n89 ) , .C ( n145 ) , .ZN ( n69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U100 ( .A1 ( n57 ) , .A2 ( n55 ) , 
    .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_132 ( .A1 ( tmp_net45 ) , 
    .A2 ( n168 ) , .A3 ( n169 ) , .ZN ( n223 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_133 ( .A1 ( n171 ) , .A2 ( n170 ) , 
    .Z ( tmp_net45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_136 ( .A1 ( n144 ) , 
    .A2 ( tmp_net47 ) , .ZN ( n204 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n57 ) , .ZN ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( n54 ) , .A2 ( n53 ) , 
    .B1 ( n52 ) , .B2 ( n51 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U106 ( .A1 ( n1 ) , .A2 ( n85 ) , 
    .ZN ( n62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_51 ( .A1 ( req_addr[8] ) , 
    .A2 ( n55 ) , .B1 ( n57 ) , .B2 ( req_addr[16] ) , .C1 ( req_addr[0] ) , 
    .C2 ( n56 ) , .ZN ( n53 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_137 ( .A1 ( n159 ) , .A2 ( n185 ) , 
    .Z ( tmp_net47 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_147 ( .A1 ( n135 ) , 
    .A2 ( tmp_net51 ) , .ZN ( n208 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U110 ( .A1 ( n89 ) , .A2 ( n63 ) , 
    .A3 ( n62 ) , .A4 ( n61 ) , .ZN ( n68 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( n178 ) , .A2 ( n64 ) , 
    .B1 ( cycles_left[1] ) , .B2 ( n145 ) , .ZN ( n66 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U112 ( .A1 ( n73 ) , .A2 ( n66 ) , 
    .A3 ( n65 ) , .ZN ( n67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_2 U113 ( .A1 ( n70 ) , .A2 ( n69 ) , 
    .A3 ( n68 ) , .A4 ( n67 ) , .ZN ( dq_out[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n71 ) , .ZN ( n72 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( n178 ) , .A2 ( n73 ) , 
    .B1 ( n89 ) , .B2 ( n72 ) , .ZN ( n74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( read_data[5] ) , .ZN ( n137 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U117 ( .A1 ( write_reg ) , .A2 ( n1 ) , 
    .ZN ( n172 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n172 ) , .ZN ( n147 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U119 ( .I ( status_shift[0] ) , .ZN ( n151 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U120 ( .A1 ( n175 ) , .A2 ( n151 ) , 
    .ZN ( n174 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U121 ( .A1 ( operation[1] ) , 
    .A2 ( operation[0] ) , .ZN ( n173 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_49 ( .A1 ( tmp_net33 ) , 
    .A2 ( n58 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U123 ( .A1 ( n76 ) , .A2 ( n78 ) , 
    .ZN ( n167 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U124 ( .A1 ( HFSNET_2 ) , .A2 ( n167 ) , 
    .ZN ( n180 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( n180 ) , .ZN ( n162 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1 ( n173 ) , .A2 ( n162 ) , 
    .ZN ( n77 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U127 ( .A1 ( n147 ) , .A2 ( n175 ) , 
    .B ( n174 ) , .C ( n77 ) , .ZN ( N318 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U128 ( .A1 ( state[3] ) , .A2 ( n78 ) , 
    .B ( rst_n ) , .ZN ( n83 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U129 ( .A1 ( state[2] ) , .A2 ( state[3] ) , 
    .ZN ( n79 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U130 ( .I ( state[1] ) , .ZN ( n227 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U131 ( .A1 ( state[0] ) , .A2 ( n79 ) , 
    .A3 ( n227 ) , .ZN ( n233 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U132 ( .A1 ( n80 ) , .A2 ( n83 ) , 
    .A3 ( n233 ) , .ZN ( n81 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U133 ( .I ( n80 ) , .ZN ( n90 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U134 ( .A1 ( n90 ) , .A2 ( HFSNET_2 ) , 
    .ZN ( n191 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U135 ( .I ( sck ) , .ZN ( n125 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U136 ( .A1 ( sck ) , .A2 ( n81 ) , 
    .B1 ( n191 ) , .B2 ( n125 ) , .ZN ( n222 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U137 ( .A1 ( n233 ) , .A2 ( psram_b_sc_n ) , 
    .ZN ( n84 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U138 ( .A1 ( chip[1] ) , .A2 ( n233 ) , 
    .ZN ( n231 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U139 ( .I ( n186 ) , .ZN ( n190 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U140 ( .A1 ( n82 ) , .A2 ( n190 ) , 
    .ZN ( n187 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U141 ( .A1 ( n83 ) , .A2 ( n187 ) , 
    .ZN ( n228 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U142 ( .A1 ( n228 ) , .A2 ( n231 ) , 
    .ZN ( n234 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U143 ( .A1 ( chip[0] ) , .A2 ( n233 ) , 
    .B ( n84 ) , .C ( n234 ) , .ZN ( n221 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U144 ( .A1 ( operation[1] ) , .A2 ( n178 ) , 
    .B ( n95 ) , .ZN ( n87 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U145 ( .A1 ( cycles_left[2] ) , .A2 ( n85 ) , 
    .ZN ( n107 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U146 ( .I ( cycles_left[4] ) , .ZN ( n86 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U147 ( .A1 ( n107 ) , .A2 ( n86 ) , 
    .A3 ( n114 ) , .ZN ( n170 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U148 ( .A1 ( n89 ) , .A2 ( n88 ) , 
    .A3 ( n87 ) , .A4 ( n170 ) , .ZN ( n91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U149 ( .A1 ( sck ) , .A2 ( n90 ) , 
    .ZN ( n171 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U150 ( .A1 ( n91 ) , .A2 ( n171 ) , 
    .B ( HFSNET_2 ) , .C ( n233 ) , .ZN ( n101 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U151 ( .I ( n233 ) , .ZN ( n232 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U152 ( .A1 ( HFSNET_2 ) , .A2 ( n232 ) , 
    .ZN ( n104 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U153 ( .I ( n191 ) , .ZN ( n92 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U154 ( .A1 ( n92 ) , .A2 ( n101 ) , 
    .ZN ( n113 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U155 ( .I ( n113 ) , .ZN ( n110 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U156 ( .A1 ( n110 ) , .A2 ( n94 ) , 
    .ZN ( n93 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U157 ( .A1 ( n101 ) , .A2 ( n94 ) , 
    .B ( n104 ) , .C ( n93 ) , .ZN ( n220 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U158 ( .I ( n170 ) , .ZN ( n124 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U159 ( .A1 ( n124 ) , .A2 ( n113 ) , 
    .ZN ( n106 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U160 ( .I ( n95 ) , .ZN ( n177 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U161 ( .A1 ( n170 ) , .A2 ( n113 ) , 
    .ZN ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U162 ( .A1 ( n177 ) , .A2 ( n98 ) , 
    .ZN ( n117 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U163 ( .A1 ( chip[1] ) , .A2 ( n117 ) , 
    .B1 ( chip[1] ) , .B2 ( n178 ) , .C1 ( n117 ) , .C2 ( n104 ) , 
    .ZN ( n96 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U164 ( .A1 ( n106 ) , .A2 ( n97 ) , 
    .B ( n96 ) , .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U165 ( .A1 ( n98 ) , .A2 ( n190 ) , 
    .A3 ( n185 ) , .ZN ( n103 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U166 ( .A1 ( n101 ) , .A2 ( n100 ) , 
    .B ( n99 ) , .C ( n103 ) , .ZN ( n219 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U167 ( .A1 ( n102 ) , .A2 ( n191 ) , 
    .B ( n101 ) , .ZN ( n109 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U168 ( .A1 ( n104 ) , .A2 ( n103 ) , 
    .ZN ( n105 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U169 ( .A1 ( cycles_left[2] ) , 
    .A2 ( n109 ) , .B1 ( n145 ) , .B2 ( n105 ) , .ZN ( n108 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U170 ( .A1 ( n107 ) , .A2 ( n106 ) , 
    .ZN ( n111 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U171 ( .A1 ( n108 ) , .A2 ( n117 ) , 
    .A3 ( n111 ) , .ZN ( n218 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U172 ( .A1 ( cycles_left[2] ) , 
    .A2 ( n110 ) , .B ( n109 ) , .ZN ( n112 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U173 ( .A1 ( n112 ) , 
    .A2 ( cycles_left[3] ) , .B1 ( n111 ) , .B2 ( n114 ) , .ZN ( n217 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 ctmTdsLR_1_192 ( .A1 ( n159 ) , 
    .A2 ( tmp_net85 ) , .ZN ( n140 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U175 ( .A1 ( n115 ) , 
    .A2 ( cycles_left[4] ) , .ZN ( n116 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U176 ( .A1 ( chip[1] ) , .A2 ( n189 ) , 
    .A3 ( n117 ) , .B ( n116 ) , .ZN ( n216 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U177 ( .A1 ( n125 ) , .A2 ( n118 ) , 
    .ZN ( n121 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U178 ( .I ( n121 ) , .ZN ( n122 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U179 ( .I ( dq_in[1] ) , .ZN ( n119 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U180 ( .A1 ( n119 ) , .A2 ( n122 ) , 
    .B1 ( n121 ) , .B2 ( n151 ) , .C ( rst_n ) , .ZN ( n215 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U181 ( .I ( status_shift[1] ) , .ZN ( n120 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U182 ( .A1 ( n121 ) , .A2 ( n120 ) , 
    .B1 ( n122 ) , .B2 ( n151 ) , .C ( rst_n ) , .ZN ( n214 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_209 ( .A1 ( n159 ) , .A2 ( n175 ) , 
    .Z ( tmp_net94 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U184 ( .A1 ( req_val ) , .A2 ( req_rdy ) , 
    .ZN ( n168 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U185 ( .A1 ( HFSNET_2 ) , .A2 ( n168 ) , 
    .ZN ( n159 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( n168 ) , .ZN ( n143 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U187 ( .A1 ( sck ) , .A2 ( n191 ) , 
    .A3 ( n128 ) , .ZN ( n132 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U188 ( .A1 ( n140 ) , .A2 ( read_data[0] ) , 
    .B1 ( n143 ) , .B2 ( req_data[0] ) , .C1 ( n132 ) , .C2 ( dq_in[0] ) , 
    .ZN ( n129 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U189 ( .I ( n129 ) , .ZN ( n213 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U190 ( .A1 ( n140 ) , .A2 ( read_data[1] ) , 
    .B1 ( n143 ) , .B2 ( req_data[1] ) , .C1 ( n132 ) , .C2 ( dq_in[1] ) , 
    .ZN ( n130 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U191 ( .I ( n130 ) , .ZN ( n212 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U192 ( .A1 ( n140 ) , .A2 ( read_data[2] ) , 
    .B1 ( n143 ) , .B2 ( req_data[2] ) , .C1 ( n132 ) , .C2 ( dq_in[2] ) , 
    .ZN ( n131 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U193 ( .I ( n131 ) , .ZN ( n211 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U194 ( .A1 ( n140 ) , .A2 ( read_data[3] ) , 
    .B1 ( n143 ) , .B2 ( req_data[3] ) , .C1 ( n132 ) , .C2 ( dq_in[3] ) , 
    .ZN ( n133 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U195 ( .I ( n133 ) , .ZN ( n210 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U196 ( .A1 ( n140 ) , .A2 ( n191 ) , 
    .ZN ( n139 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U197 ( .A1 ( read_data[4] ) , .A2 ( n140 ) , 
    .B1 ( n143 ) , .B2 ( req_data[4] ) , .C1 ( n139 ) , .C2 ( read_data[0] ) , 
    .ZN ( n134 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U198 ( .I ( n134 ) , .ZN ( n209 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_177 ( .A1 ( n148 ) , 
    .A2 ( tmp_net72 ) , .ZN ( n163 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U200 ( .A1 ( n143 ) , .A2 ( req_data[5] ) , 
    .B1 ( n139 ) , .B2 ( read_data[1] ) , .ZN ( n135 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_178 ( .A1 ( n150 ) , .A2 ( n149 ) , 
    .Z ( tmp_net72 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U202 ( .A1 ( n140 ) , .A2 ( read_data[6] ) , 
    .B1 ( n143 ) , .B2 ( req_data[6] ) , .C1 ( n139 ) , .C2 ( read_data[2] ) , 
    .ZN ( n138 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U203 ( .I ( n138 ) , .ZN ( n207 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U204 ( .A1 ( n140 ) , .A2 ( read_data[7] ) , 
    .B1 ( n143 ) , .B2 ( req_data[7] ) , .C1 ( n139 ) , .C2 ( read_data[3] ) , 
    .ZN ( n141 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U205 ( .I ( n141 ) , .ZN ( n206 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U206 ( .I ( n159 ) , .ZN ( n148 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U207 ( .A1 ( req_addr[23] ) , .A2 ( n143 ) , 
    .B1 ( n148 ) , .B2 ( chip[0] ) , .ZN ( n142 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U208 ( .I ( n142 ) , .ZN ( n205 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U209 ( .A1 ( n143 ) , .A2 ( req_write ) , 
    .ZN ( n144 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_148 ( .A1 ( n140 ) , 
    .A2 ( tmp_net50 ) , .ZN ( tmp_net51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U211 ( .I ( req_addr[24] ) , .ZN ( n154 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U212 ( .A1 ( n1 ) , .A2 ( n159 ) , 
    .B1 ( n168 ) , .B2 ( n154 ) , .ZN ( n203 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U213 ( .A1 ( status_shift[0] ) , 
    .A2 ( n165 ) , .B ( n173 ) , .ZN ( n146 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U214 ( .A1 ( n147 ) , .A2 ( n178 ) , 
    .B1 ( n146 ) , .B2 ( n175 ) , .ZN ( n150 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U215 ( .I ( n167 ) , .ZN ( n149 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_179 ( .A1 ( req_rdy ) , 
    .A2 ( n154 ) , .B ( tmp_net75 ) , .ZN ( n155 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U217 ( .I ( n163 ) , .ZN ( n156 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_2_193 ( .A1 ( tmp_net83 ) , 
    .A2 ( n123 ) , .B ( tmp_net84 ) , .ZN ( tmp_net85 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U219 ( .A1 ( operation[0] ) , 
    .A2 ( status_shift[1] ) , .A3 ( n151 ) , .ZN ( n152 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_194 ( .A1 ( tmp_net82 ) , 
    .A2 ( sck ) , .ZN ( tmp_net83 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U221 ( .A1 ( n156 ) , .A2 ( n160 ) , 
    .B1 ( n155 ) , .B2 ( n163 ) , .ZN ( n202 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U222 ( .A1 ( n162 ) , .A2 ( n157 ) , 
    .A3 ( n163 ) , .ZN ( n158 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 ctmTdsLR_3_152_roptpi_221 ( .A1 ( n226 ) , 
    .A2 ( n227 ) , .Z ( tmp_net52 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U224 ( .A1 ( n160 ) , .A2 ( n185 ) , 
    .ZN ( n161 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U225 ( .A1 ( n163 ) , .A2 ( n161 ) , 
    .ZN ( n166 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U226 ( .A1 ( n178 ) , .A2 ( n165 ) , 
    .B ( n162 ) , .ZN ( n164 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U227 ( .A1 ( n166 ) , .A2 ( n165 ) , 
    .B1 ( n164 ) , .B2 ( n163 ) , .ZN ( n200 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U228 ( .A1 ( n232 ) , .A2 ( n167 ) , 
    .A3 ( n228 ) , .ZN ( n169 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_149 ( .I ( n137 ) , 
    .ZN ( tmp_net50 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U230 ( .I ( n223 ) , .ZN ( n183 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U231 ( .A1 ( n173 ) , .A2 ( n172 ) , 
    .ZN ( n176 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U232 ( .A1 ( n176 ) , .A2 ( n175 ) , 
    .B1 ( n174 ) , .B2 ( n173 ) , .ZN ( n181 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U233 ( .A1 ( n178 ) , .A2 ( n177 ) , 
    .B ( state[2] ) , .ZN ( n179 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U234 ( .A1 ( n181 ) , .A2 ( n180 ) , 
    .B1 ( n179 ) , .B2 ( n191 ) , .ZN ( n182 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U235 ( .A1 ( n183 ) , .A2 ( req_rdy ) , 
    .A3 ( n182 ) , .B1 ( state[0] ) , .B2 ( n223 ) , .ZN ( n184 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U236 ( .A1 ( n186 ) , .A2 ( n191 ) , 
    .A3 ( n185 ) , .B ( n184 ) , .ZN ( n199 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U237 ( .A1 ( n187 ) , .A2 ( rst_n ) , 
    .ZN ( n198 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U238 ( .A1 ( n190 ) , .A2 ( n189 ) , 
    .B ( n223 ) , .ZN ( n192 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U239 ( .A1 ( n193 ) , .A2 ( n192 ) , 
    .B ( n191 ) , .ZN ( n197 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U240 ( .A1 ( state[0] ) , .A2 ( n223 ) , 
    .ZN ( n226 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_180 ( .A1 ( n180 ) , 
    .A2 ( tmp_net74 ) , .ZN ( tmp_net75 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_181 ( .A1 ( tmp_net73 ) , 
    .A2 ( n152 ) , .ZN ( tmp_net74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U243 ( .A1 ( n232 ) , .A2 ( flash_sc_n ) , 
    .ZN ( n230 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U244 ( .I ( n228 ) , .ZN ( n229 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U245 ( .A1 ( n231 ) , .A2 ( n230 ) , 
    .B ( n229 ) , .ZN ( n195 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U246 ( .A1 ( psram_a_sc_n ) , .A2 ( n233 ) , 
    .B1 ( chip[0] ) , .B2 ( n232 ) , .ZN ( n235 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U247 ( .A1 ( n235 ) , .A2 ( n234 ) , 
    .ZN ( n194 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 ctmTdsLR_1_150 ( .A1 ( tmp_net52 ) , 
    .A2 ( tmp_net54 ) , .A3 ( tmp_net56 ) , .ZN ( n196 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_4_153 ( .A1 ( n226 ) , .A2 ( n227 ) , 
    .ZN ( tmp_net54 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_5_154 ( .A1 ( HFSNET_2 ) , 
    .A2 ( tmp_net55 ) , .ZN ( tmp_net56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_6_155 ( .I ( state[3] ) , 
    .ZN ( tmp_net55 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_182 ( .I ( n165 ) , 
    .ZN ( tmp_net73 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_187 ( .A1 ( n112 ) , 
    .A2 ( tmp_net79 ) , .ZN ( n115 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_188 ( .A1 ( n113 ) , .A2 ( n114 ) , 
    .Z ( tmp_net79 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_195 ( .I ( n124 ) , 
    .ZN ( tmp_net82 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_5_196 ( .A1 ( n126 ) , 
    .A2 ( n125 ) , .ZN ( tmp_net84 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module mem_itf ( clk , rst_n , read_en , write_en , copy_en , rdy , src_addr , 
    dst_addr , write_data , read_data , read_data_val , qspi_req_val , 
    qspi_req_rdy , qspi_req_write , qspi_req_addr , qspi_req_data , 
    qspi_read_data , qspi_read_data_val , VPWR , VGND , HFSNET_0 ) ;
input  clk ;
input  rst_n ;
input  read_en ;
input  write_en ;
input  copy_en ;
output rdy ;
input  [24:0] src_addr ;
input  [24:0] dst_addr ;
input  [7:0] write_data ;
output [7:0] read_data ;
output read_data_val ;
output qspi_req_val ;
input  qspi_req_rdy ;
output qspi_req_write ;
output [24:0] qspi_req_addr ;
output [7:0] qspi_req_data ;
input  [7:0] qspi_read_data ;
input  qspi_read_data_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_0 ;

wire tmp_net34 ;
wire tmp_net61 ;
wire tmp_net62 ;
wire tmp_net63 ;
wire tmp_net76 ;
wire tmp_net77 ;
wire tmp_net78 ;
wire copy_pending ;
wire N56 ;
wire n32 ;
wire n33 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n3 ;
wire n5 ;
wire n6 ;
wire n7 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n22 ;
wire n23 ;
wire n25 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire n49 ;
wire [1:0] state ;
supply1 VPWR ;
supply0 VGND ;

assign read_data[7] = qspi_read_data[7] ;
assign read_data[6] = qspi_read_data[6] ;
assign read_data[5] = qspi_read_data[5] ;
assign read_data[4] = qspi_read_data[4] ;
assign read_data[3] = qspi_read_data[3] ;
assign read_data[2] = qspi_read_data[2] ;
assign read_data[1] = qspi_read_data[1] ;
assign read_data[0] = qspi_read_data[0] ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 copy_pending_reg ( .D ( n42 ) , .CLK ( clk ) , 
    .Q ( copy_pending ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n41 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n40 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_write_reg ( .D ( n43 ) , 
    .CLK ( clk ) , .Q ( qspi_req_write ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N56 ) , 
    .CLK ( clk ) , .Q ( read_data_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_7_ ( .D ( n39 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_6_ ( .D ( n38 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_5_ ( .D ( n37 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_4_ ( .D ( n36 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_3_ ( .D ( n35 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_2_ ( .D ( n34 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_1_ ( .D ( n33 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_0_ ( .D ( n32 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 ctmTdsLR_1_52 ( .A1 ( n17 ) , .A2 ( n23 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n16 ) , .ZN ( tmp_net34 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_53 ( .A1 ( n17 ) , .A2 ( n18 ) , 
    .B ( tmp_net34 ) , .ZN ( n41 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U5 ( .A1 ( n48 ) , .A2 ( rst_n ) , 
    .A3 ( n14 ) , .ZN ( n46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 ctmTdsLR_1_56 ( .A1 ( n25 ) , 
    .A2 ( qspi_read_data_val ) , .A3 ( state[0] ) , .B1 ( n23 ) , 
    .B2 ( n26 ) , .ZN ( n40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 ctmTdsLR_1_162 ( .A1 ( tmp_net61 ) , 
    .A2 ( tmp_net63 ) , .Z ( n48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_163 ( .I ( n13 ) , 
    .ZN ( tmp_net61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_5_166 ( .I ( qspi_read_data_val ) , 
    .ZN ( tmp_net62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_183 ( .A1 ( n13 ) , 
    .A2 ( tmp_net78 ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_184 ( .A1 ( tmp_net76 ) , 
    .A2 ( tmp_net77 ) , .ZN ( tmp_net78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_185 ( .A1 ( state[0] ) , 
    .A2 ( state[1] ) , .ZN ( tmp_net76 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_186 ( .A1 ( state[1] ) , 
    .A2 ( qspi_read_data_val ) , .ZN ( tmp_net77 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U16 ( .A1 ( state[1] ) , .A2 ( HFSNET_0 ) , 
    .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( qspi_req_write ) , .ZN ( n6 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_2 U18 ( .I ( n6 ) , .Z ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or3_1 ctmTdsLR_4_165_roptpi_222 ( .A1 ( n15 ) , 
    .A2 ( n22 ) , .A3 ( tmp_net62 ) , .Z ( tmp_net63 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U20 ( .A1 ( qspi_read_data_val ) , 
    .A2 ( n5 ) , .ZN ( n3 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U21 ( .A1 ( state[0] ) , 
    .A2 ( copy_pending ) , .A3 ( n25 ) , .A4 ( n3 ) , .ZN ( N56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U22 ( .I0 ( dst_addr[0] ) , 
    .I1 ( src_addr[0] ) , .S ( n5 ) , .Z ( qspi_req_addr[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U23 ( .I0 ( dst_addr[1] ) , 
    .I1 ( src_addr[1] ) , .S ( n5 ) , .Z ( qspi_req_addr[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U24 ( .I0 ( dst_addr[2] ) , 
    .I1 ( src_addr[2] ) , .S ( n5 ) , .Z ( qspi_req_addr[2] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U25 ( .I0 ( dst_addr[3] ) , 
    .I1 ( src_addr[3] ) , .S ( n5 ) , .Z ( qspi_req_addr[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U26 ( .I0 ( dst_addr[4] ) , 
    .I1 ( src_addr[4] ) , .S ( n5 ) , .Z ( qspi_req_addr[4] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0 ( dst_addr[5] ) , 
    .I1 ( src_addr[5] ) , .S ( n5 ) , .Z ( qspi_req_addr[5] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0 ( dst_addr[6] ) , 
    .I1 ( src_addr[6] ) , .S ( n5 ) , .Z ( qspi_req_addr[6] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U29 ( .I0 ( dst_addr[7] ) , 
    .I1 ( src_addr[7] ) , .S ( n5 ) , .Z ( qspi_req_addr[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U30 ( .I0 ( dst_addr[8] ) , 
    .I1 ( src_addr[8] ) , .S ( n5 ) , .Z ( qspi_req_addr[8] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U31 ( .I0 ( dst_addr[9] ) , 
    .I1 ( src_addr[9] ) , .S ( n5 ) , .Z ( qspi_req_addr[9] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U32 ( .I0 ( dst_addr[10] ) , 
    .I1 ( src_addr[10] ) , .S ( n6 ) , .Z ( qspi_req_addr[10] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U33 ( .I0 ( dst_addr[11] ) , 
    .I1 ( src_addr[11] ) , .S ( n5 ) , .Z ( qspi_req_addr[11] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U34 ( .I0 ( dst_addr[12] ) , 
    .I1 ( src_addr[12] ) , .S ( n5 ) , .Z ( qspi_req_addr[12] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U35 ( .I0 ( dst_addr[13] ) , 
    .I1 ( src_addr[13] ) , .S ( n5 ) , .Z ( qspi_req_addr[13] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U36 ( .I0 ( dst_addr[14] ) , 
    .I1 ( src_addr[14] ) , .S ( n5 ) , .Z ( qspi_req_addr[14] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U37 ( .I0 ( dst_addr[15] ) , 
    .I1 ( src_addr[15] ) , .S ( n6 ) , .Z ( qspi_req_addr[15] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U38 ( .I0 ( dst_addr[16] ) , 
    .I1 ( src_addr[16] ) , .S ( n6 ) , .Z ( qspi_req_addr[16] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U39 ( .I0 ( dst_addr[17] ) , 
    .I1 ( src_addr[17] ) , .S ( n6 ) , .Z ( qspi_req_addr[17] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U40 ( .I0 ( dst_addr[18] ) , 
    .I1 ( src_addr[18] ) , .S ( n5 ) , .Z ( qspi_req_addr[18] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U41 ( .I0 ( dst_addr[19] ) , 
    .I1 ( src_addr[19] ) , .S ( n6 ) , .Z ( qspi_req_addr[19] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U42 ( .I0 ( dst_addr[20] ) , 
    .I1 ( src_addr[20] ) , .S ( n6 ) , .Z ( qspi_req_addr[20] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U43 ( .I0 ( dst_addr[21] ) , 
    .I1 ( src_addr[21] ) , .S ( n6 ) , .Z ( qspi_req_addr[21] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U44 ( .I0 ( dst_addr[22] ) , 
    .I1 ( src_addr[22] ) , .S ( n5 ) , .Z ( qspi_req_addr[22] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U45 ( .I0 ( dst_addr[23] ) , 
    .I1 ( src_addr[23] ) , .S ( n6 ) , .Z ( qspi_req_addr[23] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U46 ( .I0 ( dst_addr[24] ) , 
    .I1 ( src_addr[24] ) , .S ( n6 ) , .Z ( qspi_req_addr[24] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U47 ( .I ( state[0] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( state[1] ) , .ZN ( n22 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U49 ( .A1 ( n18 ) , .A2 ( n22 ) , 
    .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U50 ( .I ( n14 ) , .ZN ( rdy ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( copy_pending ) , .A2 ( n18 ) , 
    .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U53 ( .A1 ( write_en ) , .A2 ( read_en ) , 
    .A3 ( copy_en ) , .B ( rdy ) , .ZN ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U54 ( .A1 ( HFSNET_0 ) , .A2 ( n7 ) , 
    .ZN ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U56 ( .A1 ( write_en ) , .A2 ( n46 ) , 
    .B1 ( n48 ) , .B2 ( qspi_req_write ) , .ZN ( n11 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U57 ( .A1 ( n48 ) , .A2 ( n25 ) , 
    .ZN ( n47 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( n47 ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U59 ( .A1 ( n11 ) , .A2 ( n10 ) , 
    .ZN ( n43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U60 ( .A1 ( copy_pending ) , .A2 ( n48 ) , 
    .B1 ( copy_en ) , .B2 ( n46 ) , .ZN ( n12 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n12 ) , .ZN ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U63 ( .I ( qspi_req_rdy ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U65 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .ZN ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U69 ( .A1 ( n22 ) , .A2 ( state[0] ) , 
    .A3 ( HFSNET_0 ) , .ZN ( n26 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U71 ( .I ( n26 ) , .ZN ( qspi_req_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U72 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[7] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[7] ) , 
    .C1 ( n46 ) , .C2 ( write_data[7] ) , .ZN ( n27 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U73 ( .I ( n27 ) , .ZN ( n39 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U74 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[6] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[6] ) , 
    .C1 ( n46 ) , .C2 ( write_data[6] ) , .ZN ( n28 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n28 ) , .ZN ( n38 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U76 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[5] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[5] ) , 
    .C1 ( n46 ) , .C2 ( write_data[5] ) , .ZN ( n29 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U77 ( .I ( n29 ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U78 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[4] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[4] ) , 
    .C1 ( n46 ) , .C2 ( write_data[4] ) , .ZN ( n30 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U79 ( .I ( n30 ) , .ZN ( n36 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U80 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[3] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[3] ) , 
    .C1 ( n46 ) , .C2 ( write_data[3] ) , .ZN ( n31 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( n31 ) , .ZN ( n35 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U82 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[2] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[2] ) , 
    .C1 ( n46 ) , .C2 ( write_data[2] ) , .ZN ( n44 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U83 ( .I ( n44 ) , .ZN ( n34 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U84 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[1] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[1] ) , 
    .C1 ( n46 ) , .C2 ( write_data[1] ) , .ZN ( n45 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U85 ( .I ( n45 ) , .ZN ( n33 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U86 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[0] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[0] ) , 
    .C1 ( n46 ) , .C2 ( write_data[0] ) , .ZN ( n49 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U87 ( .I ( n49 ) , .ZN ( n32 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module act ( clk , rst_n , vpu_res_in , act_op_in , vpu_res_in_val , 
    act_res_out , act_res_out_val , VPWR , VGND , ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
input  [7:0] vpu_res_in ;
input  [2:0] act_op_in ;
input  vpu_res_in_val ;
output [7:0] act_res_out ;
output act_res_out_val ;
input  VPWR ;
input  VGND ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;

wire N701 ;
wire n224 ;
wire n226 ;
wire n227 ;
wire n228 ;
wire n229 ;
wire n230 ;
wire n231 ;
wire n232 ;
wire n1 ;
wire n2 ;
wire n3 ;
wire n4 ;
wire n5 ;
wire n6 ;
wire n7 ;
wire n8 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n25 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire n60 ;
wire n61 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire n70 ;
wire n71 ;
wire n72 ;
wire n73 ;
wire n74 ;
wire n75 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81 ;
wire n82 ;
wire n83 ;
wire n84 ;
wire n85 ;
wire n86 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n94 ;
wire n95 ;
wire n96 ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n101 ;
wire n102 ;
wire n103 ;
wire n104 ;
wire n105 ;
wire n106 ;
wire n107 ;
wire n108 ;
wire n109 ;
wire n110 ;
wire n111 ;
wire n112 ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net35 ;
wire tmp_net57 ;
wire tmp_net58 ;
wire tmp_net59 ;
wire tmp_net60 ;
wire tmp_net89 ;
wire tmp_net90 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_val_reg ( .D ( N701 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_res_out_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_7_ ( .D ( n232 ) , 
    .CLK ( clk ) , .Q ( act_res_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_6_ ( .D ( n231 ) , 
    .CLK ( clk ) , .Q ( act_res_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_5_ ( .D ( n230 ) , 
    .CLK ( clk ) , .Q ( act_res_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_4_ ( .D ( n229 ) , 
    .CLK ( clk ) , .Q ( act_res_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_3_ ( .D ( n228 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( act_res_out[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_2_ ( .D ( n227 ) , 
    .CLK ( clk ) , .Q ( act_res_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_1_ ( .D ( n226 ) , 
    .CLK ( clk ) , .Q ( act_res_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_0_ ( .D ( n224 ) , 
    .CLK ( clk ) , .Q ( act_res_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U3 ( .A1 ( rst_n ) , .A2 ( vpu_res_in_val ) , 
    .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( n15 ) , .ZN ( N701 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( act_op_in[0] ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U6 ( .I ( act_op_in[1] ) , .ZN ( n2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U7 ( .A1 ( act_op_in[0] ) , 
    .A2 ( act_op_in[1] ) , .B1 ( n21 ) , .B2 ( n2 ) , .C ( act_op_in[2] ) , 
    .ZN ( n6 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U8 ( .A1 ( vpu_res_in[5] ) , 
    .A2 ( vpu_res_in[4] ) , .A3 ( vpu_res_in[3] ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( vpu_res_in[1] ) , .ZN ( n31 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U10 ( .A1 ( n28 ) , .A2 ( n31 ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U11 ( .A1 ( vpu_res_in[2] ) , 
    .A2 ( vpu_res_in[0] ) , .A3 ( vpu_res_in[6] ) , .A4 ( n1 ) , .ZN ( n14 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U12 ( .A1 ( n21 ) , .A2 ( n2 ) , 
    .A3 ( act_op_in[2] ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U13 ( .A1 ( N701 ) , .A2 ( vpu_res_in[7] ) , 
    .A3 ( n14 ) , .A4 ( n17 ) , .ZN ( n5 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( vpu_res_in_val ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1 ( rst_n ) , .A2 ( n3 ) , 
    .ZN ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( act_res_out[7] ) , .ZN ( n4 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U17 ( .A1 ( n6 ) , .A2 ( n5 ) , .B1 ( n13 ) , 
    .B2 ( n4 ) , .ZN ( n232 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( act_op_in[2] ) , .ZN ( n7 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U19 ( .A1 ( n7 ) , .A2 ( vpu_res_in[7] ) , 
    .ZN ( n8 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U20 ( .A1 ( act_op_in[1] ) , .A2 ( n7 ) , 
    .ZN ( n46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U21 ( .A1 ( n21 ) , .A2 ( n8 ) , 
    .B ( n46 ) , .C ( n17 ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( n9 ) , .ZN ( n12 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U23 ( .I ( n28 ) , .ZN ( n25 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U24 ( .A1 ( n25 ) , .A2 ( vpu_res_in[6] ) , 
    .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( n21 ) , .A2 ( n46 ) , 
    .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U26 ( .A1 ( n10 ) , .A2 ( n12 ) , 
    .B ( N701 ) , .ZN ( n82 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U27 ( .I ( n82 ) , .ZN ( n86 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U28 ( .A1 ( n12 ) , .A2 ( n11 ) , 
    .B ( n86 ) , .ZN ( n111 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U29 ( .I ( n111 ) , .ZN ( n96 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U30 ( .I ( n13 ) , .ZN ( n108 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U31 ( .A1 ( vpu_res_in[6] ) , .A2 ( n96 ) , 
    .B1 ( n108 ) , .B2 ( act_res_out[6] ) , .ZN ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U32 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( n22 ) , .ZN ( n109 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U34 ( .A1 ( n16 ) , .A2 ( n109 ) , 
    .ZN ( n231 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U35 ( .A1 ( vpu_res_in[5] ) , 
    .A2 ( vpu_res_in[4] ) , .A3 ( vpu_res_in[3] ) , .A4 ( vpu_res_in[0] ) , 
    .ZN ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U36 ( .A1 ( vpu_res_in[2] ) , 
    .A2 ( vpu_res_in[1] ) , .A3 ( vpu_res_in[6] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U37 ( .A1 ( n19 ) , .A2 ( n18 ) , 
    .B ( vpu_res_in[7] ) , .C ( n17 ) , .ZN ( n24 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( vpu_res_in[6] ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U39 ( .A1 ( vpu_res_in[7] ) , .A2 ( n21 ) , 
    .B ( n20 ) , .C ( n46 ) , .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U40 ( .A1 ( n24 ) , .A2 ( N701 ) , 
    .B1 ( n23 ) , .B2 ( N701 ) , .C ( n22 ) , .ZN ( n88 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_200 ( .A1 ( n99 ) , 
    .A2 ( tmp_net90 ) , .ZN ( n226 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( vpu_res_in[7] ) , .ZN ( n41 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( n25 ) , .A2 ( n41 ) , 
    .B1 ( vpu_res_in[7] ) , .B2 ( n28 ) , .ZN ( n43 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( vpu_res_in[3] ) , .ZN ( n35 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U45 ( .I ( n35 ) , .ZN ( n27 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U46 ( .A1 ( n35 ) , .A2 ( vpu_res_in[1] ) , 
    .B1 ( vpu_res_in[2] ) , .B2 ( n27 ) , .ZN ( n39 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U47 ( .I ( vpu_res_in[4] ) , .ZN ( n83 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( vpu_res_in[5] ) , .ZN ( n30 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U49 ( .A1 ( vpu_res_in[3] ) , .A2 ( n39 ) , 
    .B ( n83 ) , .C ( n30 ) , .ZN ( n26 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U50 ( .A1 ( vpu_res_in[7] ) , .A2 ( n26 ) , 
    .Z ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( vpu_res_in[5] ) , 
    .A2 ( vpu_res_in[4] ) , .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U52 ( .A1 ( n83 ) , .A2 ( vpu_res_in[5] ) , 
    .A3 ( vpu_res_in[3] ) , .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U53 ( .A1 ( n34 ) , .A2 ( n27 ) , 
    .B ( n36 ) , .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U54 ( .I ( n38 ) , .ZN ( n53 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U55 ( .A1 ( vpu_res_in[5] ) , 
    .A2 ( vpu_res_in[3] ) , .B1 ( vpu_res_in[5] ) , .B2 ( vpu_res_in[2] ) , 
    .C1 ( vpu_res_in[3] ) , .C2 ( vpu_res_in[4] ) , .ZN ( n54 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U56 ( .A1 ( n35 ) , .A2 ( vpu_res_in[0] ) , 
    .B1 ( vpu_res_in[1] ) , .B2 ( n27 ) , .ZN ( n52 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U57 ( .A1 ( n53 ) , .A2 ( n54 ) , 
    .B1 ( n52 ) , .B2 ( n28 ) , .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U58 ( .A1 ( n41 ) , .A2 ( n29 ) , .Z ( n50 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U59 ( .A1 ( n83 ) , .A2 ( n35 ) , 
    .B ( n30 ) , .ZN ( n55 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_156 ( .A1 ( n48 ) , 
    .A2 ( tmp_net58 ) , .ZN ( n230 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( vpu_res_in[2] ) , .ZN ( n95 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_2_157 ( .A1 ( n86 ) , 
    .A2 ( vpu_res_in[5] ) , .B1 ( n108 ) , .B2 ( act_res_out[5] ) , 
    .C ( tmp_net57 ) , .ZN ( tmp_net58 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_158 ( .I ( n88 ) , 
    .ZN ( tmp_net57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U64 ( .A1 ( vpu_res_in[0] ) , .A2 ( n35 ) , 
    .B ( vpu_res_in[5] ) , .ZN ( n37 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U65 ( .A1 ( n39 ) , .A2 ( n38 ) , 
    .B1 ( n37 ) , .B2 ( n36 ) , .ZN ( n59 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U66 ( .I ( n59 ) , .ZN ( n40 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U67 ( .A1 ( vpu_res_in[7] ) , .A2 ( n64 ) , 
    .A3 ( n40 ) , .ZN ( n57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U68 ( .A1 ( n50 ) , .A2 ( n57 ) , 
    .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U69 ( .A1 ( n51 ) , .A2 ( n45 ) , 
    .ZN ( n44 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U70 ( .A1 ( n43 ) , .A2 ( n44 ) , 
    .ZN ( n42 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U71 ( .A1 ( n42 ) , .A2 ( n41 ) , 
    .ZN ( n79 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U72 ( .I ( n79 ) , .ZN ( n75 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U73 ( .I ( n43 ) , .ZN ( n73 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U74 ( .A1 ( n73 ) , .A2 ( n44 ) , .Z ( n70 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U75 ( .A1 ( n51 ) , .A2 ( n45 ) , .Z ( n62 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U76 ( .I ( n62 ) , .ZN ( n76 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U77 ( .A1 ( n70 ) , .A2 ( n76 ) , 
    .ZN ( n78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U78 ( .A1 ( n46 ) , .A2 ( vpu_res_in[6] ) , 
    .A3 ( act_op_in[0] ) , .ZN ( n47 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( N701 ) , .A2 ( n47 ) , 
    .ZN ( n89 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U80 ( .I ( n89 ) , .ZN ( n107 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U81 ( .A1 ( n75 ) , .A2 ( n78 ) , 
    .B ( n107 ) , .ZN ( n48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_2_201 ( .A1 ( n96 ) , 
    .A2 ( vpu_res_in[1] ) , .B1 ( n108 ) , .B2 ( act_res_out[1] ) , 
    .C ( tmp_net89 ) , .ZN ( tmp_net90 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U83 ( .A1 ( n57 ) , .A2 ( n50 ) , .Z ( n72 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n72 ) , .ZN ( n60 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U85 ( .A1 ( n51 ) , .A2 ( n70 ) , 
    .B1 ( n60 ) , .B2 ( n70 ) , .C ( n75 ) , .ZN ( n85 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U86 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .B1 ( n53 ) , .B2 ( n52 ) , .ZN ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U87 ( .I ( n65 ) , .ZN ( n56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U88 ( .A1 ( n64 ) , .A2 ( n56 ) , 
    .ZN ( n101 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U89 ( .A1 ( vpu_res_in[7] ) , .A2 ( n101 ) , 
    .A3 ( n59 ) , .ZN ( n58 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U90 ( .A1 ( n59 ) , .A2 ( vpu_res_in[7] ) , 
    .B ( n58 ) , .C ( n57 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U91 ( .I0 ( n60 ) , .I1 ( n63 ) , .S ( n85 ) , 
    .Z ( n67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U92 ( .A1 ( n67 ) , .A2 ( n75 ) , 
    .B ( n70 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U93 ( .A1 ( n70 ) , .A2 ( n62 ) , 
    .A3 ( n75 ) , .B ( n61 ) , .ZN ( n92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n63 ) , .ZN ( n71 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U95 ( .A1 ( n65 ) , .A2 ( n64 ) , 
    .B ( n85 ) , .ZN ( n66 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U96 ( .A1 ( n85 ) , .A2 ( n71 ) , 
    .B ( n66 ) , .ZN ( n103 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U97 ( .I ( n67 ) , .ZN ( n69 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U98 ( .A1 ( n79 ) , .A2 ( n70 ) , 
    .ZN ( n68 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U99 ( .A1 ( n69 ) , .A2 ( n68 ) , 
    .ZN ( n104 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U100 ( .A1 ( n103 ) , .A2 ( n104 ) , 
    .ZN ( n102 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U101 ( .A1 ( n71 ) , .A2 ( n70 ) , 
    .B ( n75 ) , .ZN ( n77 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U102 ( .A1 ( n73 ) , .A2 ( n72 ) , 
    .ZN ( n74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U103 ( .A1 ( n77 ) , .A2 ( n76 ) , 
    .B1 ( n75 ) , .B2 ( n74 ) , .ZN ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U104 ( .A1 ( n102 ) , .A2 ( n98 ) , 
    .ZN ( n97 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U105 ( .A1 ( n92 ) , .A2 ( n97 ) , 
    .ZN ( n91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U106 ( .A1 ( n85 ) , .A2 ( n91 ) , 
    .ZN ( n84 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U107 ( .A1 ( n79 ) , .A2 ( n84 ) , 
    .A3 ( n78 ) , .ZN ( n80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U108 ( .A1 ( n108 ) , 
    .A2 ( act_res_out[4] ) , .B1 ( n107 ) , .B2 ( n80 ) , .ZN ( n81 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U109 ( .A1 ( n83 ) , .A2 ( n82 ) , 
    .B ( n88 ) , .C ( n81 ) , .ZN ( n229 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U110 ( .A1 ( n85 ) , .A2 ( n91 ) , 
    .B ( n84 ) , .ZN ( n90 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_202 ( .I ( n109 ) , 
    .ZN ( tmp_net89 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U113 ( .A1 ( n92 ) , .A2 ( n97 ) , 
    .B ( n91 ) , .ZN ( n93 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U114 ( .A1 ( n108 ) , 
    .A2 ( act_res_out[2] ) , .B1 ( n107 ) , .B2 ( n93 ) , .ZN ( n94 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U115 ( .A1 ( n95 ) , .A2 ( n111 ) , 
    .B ( n94 ) , .C ( n109 ) , .ZN ( n227 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U117 ( .A1 ( n102 ) , .A2 ( n98 ) , 
    .B ( n107 ) , .C ( n97 ) , .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U119 ( .I ( vpu_res_in[0] ) , .ZN ( n112 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U120 ( .I ( n101 ) , .ZN ( n105 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U121 ( .A1 ( n105 ) , .A2 ( n104 ) , 
    .B1 ( n103 ) , .B2 ( n104 ) , .C ( n102 ) , .ZN ( n106 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U122 ( .A1 ( n108 ) , 
    .A2 ( act_res_out[0] ) , .B1 ( n107 ) , .B2 ( n106 ) , .ZN ( n110 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U123 ( .A1 ( n112 ) , .A2 ( n111 ) , 
    .B ( n110 ) , .C ( n109 ) , .ZN ( n224 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_54 ( .A1 ( n31 ) , .A2 ( n95 ) , 
    .B ( n55 ) , .ZN ( tmp_net35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_55 ( .A1 ( n34 ) , 
    .A2 ( vpu_res_in[0] ) , .B ( tmp_net35 ) , .ZN ( n64 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_159 ( .A1 ( n90 ) , .A2 ( n89 ) , 
    .B ( tmp_net60 ) , .ZN ( n228 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_2_160 ( .A1 ( n86 ) , 
    .A2 ( vpu_res_in[3] ) , .B1 ( n108 ) , .B2 ( act_res_out[3] ) , 
    .C ( tmp_net59 ) , .ZN ( tmp_net60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_161 ( .I ( n88 ) , 
    .ZN ( tmp_net59 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module vpu ( clk , rst_n , exe_inst_in , exe_inst_in_val , weight_data , 
    weight_data_val , input_data , input_data_val , vpu_res_out , act_op_out , 
    vpu_res_out_val , VPWR , VGND , HFSNET_20 , ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  [8:0] exe_inst_in ;
input  exe_inst_in_val ;
input  [7:0] weight_data ;
input  weight_data_val ;
input  [7:0] input_data ;
input  input_data_val ;
output [7:0] vpu_res_out ;
output [2:0] act_op_out ;
output vpu_res_out_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_20 ;
input  ZCTSNET_0 ;

wire tmp_net30 ;
wire tmp_net32 ;
wire N787 ;
wire n401 ;
wire n402 ;
wire n403 ;
wire n404 ;
wire n405 ;
wire n406 ;
wire n407 ;
wire n408 ;
wire n409 ;
wire n410 ;
wire n411 ;
wire n412 ;
wire n413 ;
wire n414 ;
wire n415 ;
wire n416 ;
wire n417 ;
wire n418 ;
wire n419 ;
wire n420 ;
wire n421 ;
wire n422 ;
wire n423 ;
wire n424 ;
wire n425 ;
wire n426 ;
wire n427 ;
wire intadd_0_A_3_ ;
wire intadd_0_A_2_ ;
wire intadd_0_A_1_ ;
wire intadd_0_A_0_ ;
wire intadd_0_B_3_ ;
wire intadd_0_B_2_ ;
wire intadd_0_B_1_ ;
wire intadd_0_B_0_ ;
wire intadd_0_CI ;
wire intadd_0_SUM_3_ ;
wire intadd_0_SUM_2_ ;
wire intadd_0_SUM_1_ ;
wire intadd_0_SUM_0_ ;
wire intadd_0_n4 ;
wire intadd_0_n3 ;
wire intadd_0_n2 ;
wire intadd_0_n1 ;
wire intadd_1_A_2_ ;
wire intadd_1_A_1_ ;
wire intadd_1_A_0_ ;
wire intadd_1_B_2_ ;
wire intadd_1_B_1_ ;
wire intadd_1_B_0_ ;
wire intadd_1_CI ;
wire intadd_1_SUM_2_ ;
wire intadd_1_SUM_1_ ;
wire intadd_1_SUM_0_ ;
wire intadd_1_n3 ;
wire intadd_1_n2 ;
wire intadd_1_n1 ;
wire intadd_2_A_2_ ;
wire intadd_2_A_1_ ;
wire intadd_2_B_2_ ;
wire intadd_2_B_1_ ;
wire intadd_2_CI ;
wire intadd_2_SUM_2_ ;
wire intadd_2_SUM_1_ ;
wire intadd_2_SUM_0_ ;
wire intadd_2_n3 ;
wire intadd_2_n2 ;
wire intadd_2_n1 ;
wire n5 ;
wire tmp_net43 ;
wire HFSNET_18 ;
wire n8 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n25 ;
wire n26 ;
wire tmp_net44 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n32 ;
wire n33 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire tmp_net46 ;
wire tmp_net48 ;
wire tmp_net49 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n60 ;
wire n61 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire n70 ;
wire n71 ;
wire n72_CDR1 ;
wire n73_CDR1 ;
wire n74_CDR1 ;
wire n75_CDR1 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81_CDR1 ;
wire n82_CDR1 ;
wire n83_CDR1 ;
wire n84_CDR1 ;
wire n85 ;
wire n86 ;
wire n87 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n96 ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n100 ;
wire n101 ;
wire n102 ;
wire n103 ;
wire n104 ;
wire n105 ;
wire n106 ;
wire n107 ;
wire n108 ;
wire n109 ;
wire n110 ;
wire n111 ;
wire n112 ;
wire n113 ;
wire n114 ;
wire n115 ;
wire n116 ;
wire n117 ;
wire n118 ;
wire n119 ;
wire n121 ;
wire n122 ;
wire n123 ;
wire n124 ;
wire n125 ;
wire n126 ;
wire n127 ;
wire n128 ;
wire n129 ;
wire n130 ;
wire n131 ;
wire n132 ;
wire n133 ;
wire n134 ;
wire n135 ;
wire n136 ;
wire n137 ;
wire n138 ;
wire n139 ;
wire n140 ;
wire n141 ;
wire n142 ;
wire n143 ;
wire n144 ;
wire n145 ;
wire n146 ;
wire n147 ;
wire n148 ;
wire n149 ;
wire n150 ;
wire n151 ;
wire n152 ;
wire n153 ;
wire n154 ;
wire n155 ;
wire n156 ;
wire n157 ;
wire n158 ;
wire n159 ;
wire n160 ;
wire n162 ;
wire n163 ;
wire n164 ;
wire n165 ;
wire n166 ;
wire n167 ;
wire n168 ;
wire n169 ;
wire n170 ;
wire n171 ;
wire n172 ;
wire n173 ;
wire n174 ;
wire HFSNET_11 ;
wire n176 ;
wire n177 ;
wire n178 ;
wire n179 ;
wire n180 ;
wire n181 ;
wire n182 ;
wire n183 ;
wire n184 ;
wire n185 ;
wire HFSNET_0 ;
wire n187 ;
wire n188 ;
wire n189 ;
wire n190 ;
wire n191 ;
wire n192 ;
wire n193 ;
wire n194 ;
wire n195 ;
wire n196 ;
wire n197 ;
wire n198 ;
wire n199 ;
wire n200 ;
wire n201 ;
wire n202 ;
wire n203 ;
wire n204 ;
wire n205 ;
wire n206 ;
wire n207 ;
wire n208 ;
wire n209 ;
wire n210 ;
wire n211 ;
wire n212 ;
wire n213 ;
wire HFSNET_7 ;
wire n215 ;
wire n216 ;
wire n217 ;
wire n218 ;
wire n219 ;
wire n220 ;
wire n221 ;
wire n222 ;
wire n223 ;
wire n224 ;
wire n225 ;
wire n226 ;
wire HFSNET_2 ;
wire n228 ;
wire n229 ;
wire n230 ;
wire n231 ;
wire n232 ;
wire n233 ;
wire n234 ;
wire n235 ;
wire n236 ;
wire n237 ;
wire n238 ;
wire n239 ;
wire n240 ;
wire n241 ;
wire n242 ;
wire n243 ;
wire n244 ;
wire n245 ;
wire n246 ;
wire n247 ;
wire n248 ;
wire n249 ;
wire n250 ;
wire HFSNET_19 ;
wire n252 ;
wire n253 ;
wire n254 ;
wire n255 ;
wire n256 ;
wire n257 ;
wire n258 ;
wire n259 ;
wire n260 ;
wire n261 ;
wire n262 ;
wire n263 ;
wire n265 ;
wire n266 ;
wire n267 ;
wire n268 ;
wire n269 ;
wire n270 ;
wire n271 ;
wire n272 ;
wire n273 ;
wire n274 ;
wire n275 ;
wire n276 ;
wire n277 ;
wire n278 ;
wire n279 ;
wire n280 ;
wire n281 ;
wire n282 ;
wire n283 ;
wire n284 ;
wire n285 ;
wire n286 ;
wire n287 ;
wire n288 ;
wire n289 ;
wire n290 ;
wire n291 ;
wire n292 ;
wire n293 ;
wire n294 ;
wire n295 ;
wire n296 ;
wire n297 ;
wire n298 ;
wire n299 ;
wire n300 ;
wire n301 ;
wire n302 ;
wire n303 ;
wire HFSNET_16 ;
wire n305 ;
wire n306 ;
wire n307 ;
wire n308 ;
wire n309 ;
wire n312 ;
wire n313 ;
wire n314 ;
wire n315 ;
wire n316 ;
wire n317 ;
wire n318 ;
wire n319 ;
wire n320 ;
wire n321 ;
wire n322 ;
wire n323 ;
wire n324 ;
wire n325 ;
wire n326 ;
wire n327 ;
wire n328 ;
wire n329 ;
wire n330 ;
wire n331 ;
wire n332 ;
wire n333 ;
wire n334 ;
wire n335 ;
wire n336 ;
wire n337 ;
wire n338 ;
wire n339 ;
wire n340 ;
wire HFSNET_9 ;
wire HFSNET_13 ;
wire n343 ;
wire n344 ;
wire n345 ;
wire n346 ;
wire n347 ;
wire n348 ;
wire n349 ;
wire n350 ;
wire n351 ;
wire n352 ;
wire n353 ;
wire n354 ;
wire n355 ;
wire n359 ;
wire n360 ;
wire n361 ;
wire n362 ;
wire n363 ;
wire n364 ;
wire n365 ;
wire n366 ;
wire n367 ;
wire n368 ;
wire n369 ;
wire n370 ;
wire n371 ;
wire n372 ;
wire n373 ;
wire n374 ;
wire n375 ;
wire n376 ;
wire n377 ;
wire n378 ;
wire n379 ;
wire n380 ;
wire n381 ;
wire n382 ;
wire n383 ;
wire n384 ;
wire n385 ;
wire n386 ;
wire n387 ;
wire n388 ;
wire n389 ;
wire n390 ;
wire n391 ;
wire n392 ;
wire n393 ;
wire n394 ;
wire n395 ;
wire n396 ;
wire n397 ;
wire n398 ;
wire n399 ;
wire n400 ;
wire n428 ;
wire n429 ;
wire n430 ;
wire n431 ;
wire n432 ;
wire n433 ;
wire n434 ;
wire n435 ;
wire n436 ;
wire n437 ;
wire n438 ;
wire n439 ;
wire n440 ;
wire n441 ;
wire n442 ;
wire n443 ;
wire n444 ;
wire n445 ;
wire n446 ;
wire n447 ;
wire n448 ;
wire n449 ;
wire n450 ;
wire n451 ;
wire n452 ;
wire n453 ;
wire n454 ;
wire n455 ;
wire n457 ;
wire n458 ;
wire n459 ;
wire n460 ;
wire n461 ;
wire n462 ;
wire n463 ;
wire [7:0] x ;
wire [7:0] w ;
supply1 VPWR ;
supply0 VGND ;
wire HFSNET_1 ;
wire HFSNET_3 ;
wire HFSNET_5 ;
wire HFSNET_8 ;
wire HFSNET_10 ;
wire HFSNET_15 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_val_reg ( .D ( N787 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_7_ ( .D ( n404 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_6_ ( .D ( n405 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_5_ ( .D ( n406 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_4_ ( .D ( n407 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_3_ ( .D ( n408 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_2_ ( .D ( n409 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_0_ ( .D ( n411 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_7_ ( .D ( n412 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_6_ ( .D ( n420 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_5_ ( .D ( n421 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_4_ ( .D ( n422 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_3_ ( .D ( n423 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_2_ ( .D ( n424 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_1_ ( .D ( n425 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_0_ ( .D ( n426 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_0_ ( .D ( n427 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_7_ ( .D ( n419 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_1_ ( .D ( n418 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_2_ ( .D ( n417 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_3_ ( .D ( n416 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_4_ ( .D ( n415 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_5_ ( .D ( n414 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_6_ ( .D ( n413 ) , 
    .CLK ( clk ) , .Q ( vpu_res_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_2_ ( .D ( n403 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_1_ ( .D ( n402 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_0_ ( .D ( n401 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U5 ( .A ( intadd_0_A_0_ ) , 
    .B ( intadd_0_B_0_ ) , .CI ( intadd_0_CI ) , .CO ( intadd_0_n4 ) , 
    .S ( intadd_0_SUM_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U4 ( .A ( intadd_0_A_1_ ) , 
    .B ( intadd_0_B_1_ ) , .CI ( intadd_0_n4 ) , .CO ( intadd_0_n3 ) , 
    .S ( intadd_0_SUM_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U3 ( .A ( intadd_0_A_2_ ) , 
    .B ( intadd_0_B_2_ ) , .CI ( intadd_0_n3 ) , .CO ( intadd_0_n2 ) , 
    .S ( intadd_0_SUM_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U2 ( .A ( intadd_0_A_3_ ) , 
    .B ( intadd_0_B_3_ ) , .CI ( intadd_0_n2 ) , .CO ( intadd_0_n1 ) , 
    .S ( intadd_0_SUM_3_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U4 ( .A ( intadd_1_A_0_ ) , 
    .B ( intadd_1_B_0_ ) , .CI ( intadd_1_CI ) , .CO ( intadd_1_n3 ) , 
    .S ( intadd_1_SUM_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U3 ( .A ( intadd_1_A_1_ ) , 
    .B ( intadd_1_B_1_ ) , .CI ( intadd_1_n3 ) , .CO ( intadd_1_n2 ) , 
    .S ( intadd_1_SUM_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U2 ( .A ( intadd_1_A_2_ ) , 
    .B ( intadd_1_B_2_ ) , .CI ( intadd_1_n2 ) , .CO ( intadd_1_n1 ) , 
    .S ( intadd_1_SUM_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U4 ( .A ( x[4] ) , .B ( w[4] ) , 
    .CI ( intadd_2_CI ) , .CO ( intadd_2_n3 ) , .S ( intadd_2_SUM_0_ ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U3 ( .A ( intadd_2_A_1_ ) , 
    .B ( intadd_2_B_1_ ) , .CI ( intadd_2_n3 ) , .CO ( intadd_2_n2 ) , 
    .S ( intadd_2_SUM_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U2 ( .A ( intadd_2_A_2_ ) , 
    .B ( intadd_2_B_2_ ) , .CI ( intadd_2_n2 ) , .CO ( intadd_2_n1 ) , 
    .S ( intadd_2_SUM_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_1_ ( .D ( n410 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_39 ( .A1 ( n122 ) , 
    .A2 ( intadd_2_SUM_1_ ) , .B ( n60 ) , .ZN ( n78 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 ctmTdsLR_1_40 ( .A1 ( intadd_1_n1 ) , 
    .A2 ( n267 ) , .B ( n265 ) , .C ( n302 ) , .ZN ( n312 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 ctmTdsLR_1_41 ( .A1 ( n132 ) , .A2 ( n93 ) , 
    .Z ( tmp_net30 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_42 ( .A1 ( tmp_net30 ) , 
    .A2 ( n130 ) , .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U7 ( .I ( n142 ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 ctmTdsLR_1_45 ( .A1 ( n58 ) , .A2 ( n57 ) , 
    .Z ( n102 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_779_27 ( .I ( n370 ) , 
    .ZN ( HFSNET_18 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( exe_inst_in[1] ) , .ZN ( n8 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_2 U11 ( .A1 ( exe_inst_in[7] ) , 
    .A2 ( exe_inst_in_val ) , .B1 ( n257 ) , .B2 ( exe_inst_in_val ) , 
    .C ( rst_n ) , .ZN ( n434 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U12 ( .A1 ( x[2] ) , .A2 ( w[0] ) , 
    .Z ( intadd_0_A_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U13 ( .A1 ( w[4] ) , .A2 ( w[5] ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( w[6] ) , .ZN ( n118 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1 ( n22 ) , .A2 ( n118 ) , 
    .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U16 ( .A1 ( w[3] ) , .A2 ( n23 ) , 
    .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( w[1] ) , .ZN ( n143 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( x[0] ) , .ZN ( n253 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U19 ( .A1 ( x[1] ) , .A2 ( w[2] ) , 
    .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U20 ( .A1 ( n39 ) , .A2 ( n143 ) , 
    .B ( n253 ) , .C ( n11 ) , .ZN ( intadd_0_A_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U21 ( .A1 ( w[1] ) , .A2 ( x[0] ) , 
    .B ( n11 ) , .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U22 ( .A1 ( n39 ) , .A2 ( n253 ) , 
    .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U23 ( .A1 ( n10 ) , .A2 ( n9 ) , 
    .Z ( intadd_0_A_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( x[1] ) , .A2 ( w[1] ) , 
    .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U25 ( .A1 ( x[0] ) , .A2 ( w[0] ) , 
    .ZN ( n173 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U26 ( .A1 ( n14 ) , .A2 ( n173 ) , 
    .ZN ( intadd_0_B_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U27 ( .I ( w[2] ) , .ZN ( n24 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U28 ( .A1 ( n253 ) , .A2 ( n143 ) , 
    .A3 ( n11 ) , .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U29 ( .A1 ( n24 ) , .A2 ( n14 ) , 
    .B1 ( n253 ) , .B2 ( n14 ) , .C ( n12 ) , .ZN ( intadd_0_CI ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U30 ( .A1 ( x[5] ) , .A2 ( x[4] ) , 
    .ZN ( n20 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( x[6] ) , .ZN ( n119 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U32 ( .A1 ( n20 ) , .A2 ( n119 ) , 
    .ZN ( n21 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U33 ( .A1 ( x[3] ) , .A2 ( n21 ) , 
    .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( n38 ) , .ZN ( n256 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and3_1 U35 ( .A1 ( w[1] ) , .A2 ( intadd_0_A_0_ ) , 
    .A3 ( n256 ) , .Z ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U36 ( .A1 ( w[1] ) , .A2 ( x[2] ) , 
    .B1 ( w[0] ) , .B2 ( n256 ) , .ZN ( n13 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U37 ( .A1 ( n19 ) , .A2 ( n13 ) , 
    .ZN ( intadd_0_B_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U38 ( .A1 ( w[1] ) , .A2 ( n256 ) , 
    .ZN ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U39 ( .I ( x[1] ) , .ZN ( n380 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U40 ( .A1 ( n38 ) , .A2 ( n39 ) , 
    .ZN ( n35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( n35 ) , .ZN ( n15 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U42 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .ZN ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U43 ( .A1 ( n39 ) , .A2 ( n16 ) , 
    .B1 ( n380 ) , .B2 ( n16 ) , .C ( n32 ) , .ZN ( n18 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( x[2] ) , .ZN ( n140 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U45 ( .A1 ( n140 ) , .A2 ( n24 ) , 
    .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U46 ( .A ( n19 ) , .B ( n18 ) , .CI ( n17 ) , 
    .CO ( intadd_0_B_3_ ) , .S ( intadd_0_B_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U47 ( .A1 ( x[3] ) , .A2 ( n38 ) , 
    .B1 ( w[3] ) , .B2 ( n39 ) , .ZN ( intadd_2_CI ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U48 ( .A1 ( x[4] ) , .A2 ( x[5] ) , 
    .B ( n20 ) , .ZN ( intadd_2_A_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U49 ( .A1 ( w[5] ) , .A2 ( w[4] ) , 
    .B ( n22 ) , .ZN ( intadd_2_B_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U50 ( .A1 ( n119 ) , .A2 ( n20 ) , .Z ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( n21 ) , .A2 ( n52 ) , 
    .ZN ( intadd_2_A_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U52 ( .A1 ( n118 ) , .A2 ( n22 ) , .Z ( n51 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U53 ( .A1 ( n23 ) , .A2 ( n51 ) , 
    .ZN ( intadd_2_B_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U54 ( .A1 ( n38 ) , .A2 ( n24 ) , 
    .ZN ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U55 ( .A1 ( n39 ) , .A2 ( n140 ) , 
    .ZN ( n30 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U56 ( .A1 ( exe_inst_in[0] ) , .A2 ( w[7] ) , 
    .B ( exe_inst_in[1] ) , .ZN ( n26 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U57 ( .I ( exe_inst_in[1] ) , .ZN ( n201 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U58 ( .A1 ( exe_inst_in[0] ) , 
    .A2 ( exe_inst_in[1] ) , .ZN ( n142 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U59 ( .A1 ( x[7] ) , .A2 ( n8 ) , 
    .B ( n142 ) , .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U60 ( .A1 ( x[7] ) , .A2 ( n26 ) , 
    .B1 ( w[7] ) , .B2 ( n25 ) , .ZN ( n371 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U61 ( .A1 ( n201 ) , .A2 ( exe_inst_in[0] ) , 
    .ZN ( n254 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U62 ( .A1 ( n254 ) , .A2 ( exe_inst_in[2] ) , 
    .Z ( n202 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_138 ( .A1 ( n121 ) , 
    .A2 ( n191 ) , .B ( tmp_net49 ) , .ZN ( n345 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_2_139 ( .A1 ( exe_inst_in[1] ) , 
    .A2 ( n119 ) , .B1 ( n142 ) , .B2 ( n118 ) , .C ( tmp_net48 ) , 
    .ZN ( tmp_net49 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U65 ( .A1 ( vpu_res_out[7] ) , .A2 ( n202 ) , 
    .B1 ( n28 ) , .B2 ( n8 ) , .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U66 ( .A1 ( x[7] ) , .A2 ( n142 ) , 
    .B ( n29 ) , .ZN ( n366 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_2 U67 ( .A1 ( n371 ) , .A2 ( n366 ) , 
    .Z ( n302 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U68 ( .A ( n32 ) , .B ( n31 ) , .CI ( n30 ) , 
    .CO ( n33 ) , .S ( intadd_0_A_3_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U69 ( .I ( n33 ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U70 ( .A1 ( n37 ) , .A2 ( n35 ) , 
    .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U71 ( .A1 ( intadd_0_n1 ) , .A2 ( n34 ) , 
    .Z ( n43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U72 ( .I ( intadd_0_SUM_3_ ) , .ZN ( n153 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U73 ( .A1 ( n43 ) , .A2 ( n153 ) , 
    .ZN ( n55 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U74 ( .A1 ( n35 ) , .A2 ( intadd_0_n1 ) , 
    .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U75 ( .A1 ( n37 ) , .A2 ( n36 ) , 
    .ZN ( n156 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U76 ( .A1 ( intadd_0_SUM_2_ ) , .A2 ( n55 ) , 
    .A3 ( n156 ) , .ZN ( n113 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 ctmTdsLR_1_50 ( .A1 ( n162 ) , 
    .A2 ( n172 ) , .B1 ( n162 ) , .B2 ( n160 ) , .C1 ( intadd_0_SUM_2_ ) , 
    .C2 ( n165 ) , .ZN ( n170 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 ctmTdsLR_1_57 ( .A1 ( w[7] ) , 
    .A2 ( exe_inst_in[0] ) , .Z ( n28 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_129 ( .A1 ( tmp_net43 ) , 
    .A2 ( tmp_net44 ) , .ZN ( n427 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_2_130 ( .A1 ( n378 ) , 
    .A2 ( n355 ) , .B1 ( n378 ) , .B2 ( n376 ) , .C ( n384 ) , 
    .ZN ( tmp_net43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( n43 ) , .ZN ( n150 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U82 ( .A1 ( intadd_0_SUM_1_ ) , 
    .A2 ( n113 ) , .B ( n156 ) , .ZN ( n44 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U83 ( .A1 ( n150 ) , .A2 ( n153 ) , 
    .B ( n44 ) , .ZN ( n57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U84 ( .A1 ( n58 ) , .A2 ( n57 ) , 
    .ZN ( n47 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U85 ( .A1 ( n44 ) , .A2 ( n43 ) , .Z ( n46 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U86 ( .A1 ( intadd_2_SUM_2_ ) , .A2 ( n45 ) , 
    .ZN ( n109 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U87 ( .A1 ( n45 ) , .A2 ( intadd_2_SUM_2_ ) , 
    .B ( n109 ) , .ZN ( n92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U88 ( .A ( n47 ) , .B ( n46 ) , 
    .CI ( intadd_2_SUM_0_ ) , .CO ( n50 ) , .S ( n132 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or4_1 ctmTdsLR_1_46 ( .A1 ( n38 ) , .A2 ( n39 ) , 
    .A3 ( x[3] ) , .A4 ( w[3] ) , .Z ( tmp_net32 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 ctmTdsLR_2_47 ( .A1 ( tmp_net32 ) , 
    .A2 ( intadd_2_CI ) , .Z ( n58 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 ctmTdsLR_3_131 ( .A1 ( n435 ) , 
    .A2 ( x[0] ) , .B1 ( n434 ) , .B2 ( vpu_res_out[0] ) , .ZN ( tmp_net44 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U92 ( .A ( n113 ) , .B ( n50 ) , 
    .CI ( intadd_2_SUM_1_ ) , .CO ( n45 ) , .S ( n97 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U93 ( .I ( n92 ) , .ZN ( n104 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U94 ( .A1 ( n97 ) , .A2 ( n132 ) , 
    .B ( n104 ) , .ZN ( n54 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U95 ( .A1 ( intadd_2_n1 ) , .A2 ( n52 ) , 
    .A3 ( n51 ) , .ZN ( n53 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U96 ( .A1 ( intadd_2_n1 ) , .A2 ( n52 ) , 
    .B1 ( intadd_2_n1 ) , .B2 ( n51 ) , .C1 ( n52 ) , .C2 ( n51 ) , 
    .ZN ( n107 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U97 ( .A1 ( n54 ) , .A2 ( n53 ) , 
    .B1 ( n109 ) , .B2 ( n53 ) , .C ( n107 ) , .ZN ( n110 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n110 ) , .ZN ( n122 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U99 ( .I ( n156 ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U100 ( .A1 ( n122 ) , .A2 ( n68 ) , 
    .ZN ( n60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U101 ( .I ( n60 ) , .ZN ( n56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U102 ( .A1 ( n110 ) , 
    .A2 ( intadd_2_SUM_0_ ) , .Z ( n62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U103 ( .A1 ( n56 ) , .A2 ( n55 ) , 
    .B ( n62 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U104 ( .A1 ( n110 ) , .A2 ( n58 ) , 
    .B1 ( n57 ) , .B2 ( n122 ) , .ZN ( n70 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U105 ( .A1 ( n63 ) , .A2 ( n70 ) , 
    .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_134 ( .A1 ( n390 ) , 
    .A2 ( n391 ) , .B ( tmp_net46 ) , .ZN ( n318 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_135 ( .A1 ( n307 ) , 
    .A2 ( n391 ) , .ZN ( tmp_net46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U108 ( .A1 ( intadd_2_SUM_2_ ) , 
    .A2 ( n122 ) , .B ( n78 ) , .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U109 ( .A1 ( n61 ) , .A2 ( n64 ) , 
    .ZN ( n149 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U110 ( .A1 ( n61 ) , .A2 ( n78 ) , 
    .ZN ( n166 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U111 ( .I ( n166 ) , .ZN ( n67 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U112 ( .A1 ( n62 ) , .A2 ( n70 ) , 
    .A3 ( n78 ) , .ZN ( n172 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U113 ( .A1 ( n64 ) , .A2 ( n63 ) , 
    .Z ( n174 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U114 ( .A1 ( n70 ) , .A2 ( n174 ) , 
    .ZN ( n148 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( n150 ) , .A2 ( n172 ) , 
    .B1 ( intadd_0_SUM_2_ ) , .B2 ( n148 ) , .ZN ( n66 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( n70 ) , .ZN ( n71 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U117 ( .A1 ( n71 ) , .A2 ( n174 ) , 
    .ZN ( n160 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U118 ( .A1 ( n63 ) , .A2 ( n71 ) , 
    .ZN ( n76 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U119 ( .A1 ( n64 ) , .A2 ( n76 ) , 
    .ZN ( n155 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U120 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n160 ) , .B1 ( intadd_0_SUM_0_ ) , .B2 ( n155 ) , .ZN ( n65 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U121 ( .A1 ( n68 ) , .A2 ( n67 ) , 
    .B ( n66 ) , .C ( n65 ) , .ZN ( n69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U122 ( .A1 ( intadd_0_SUM_1_ ) , 
    .A2 ( n149 ) , .B ( n69 ) , .ZN ( n100 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U123 ( .A1 ( n110 ) , 
    .A2 ( intadd_2_SUM_0_ ) , .A3 ( intadd_2_SUM_1_ ) , .ZN ( n159 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U124 ( .A1 ( n70 ) , .A2 ( n159 ) , 
    .ZN ( n85 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( n173 ) , .ZN ( n80 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U126 ( .A1 ( n150 ) , .A2 ( n85 ) , 
    .B1 ( n158 ) , .B2 ( n156 ) , .ZN ( n75_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U127 ( .A1 ( n148 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .B1 ( intadd_0_SUM_3_ ) , .B2 ( n166 ) , 
    .ZN ( n74_CDR1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U128 ( .A1 ( n71 ) , .A2 ( n159 ) , 
    .ZN ( n158 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U129 ( .A1 ( n149 ) , .A2 ( n162 ) , 
    .B1 ( n155 ) , .B2 ( n80 ) , .ZN ( n73_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U130 ( .A1 ( x[1] ) , .A2 ( w[0] ) , 
    .B1 ( x[0] ) , .B2 ( w[1] ) , .ZN ( n164 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U131 ( .A1 ( intadd_0_B_0_ ) , .A2 ( n164 ) , 
    .ZN ( n162 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U132 ( .A1 ( intadd_0_SUM_1_ ) , 
    .A2 ( n160 ) , .B1 ( intadd_0_SUM_2_ ) , .B2 ( n172 ) , .ZN ( n72_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U133 ( .A1 ( n75_CDR1 ) , .A2 ( n74_CDR1 ) , 
    .A3 ( n73_CDR1 ) , .A4 ( n72_CDR1 ) , .ZN ( n157 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U134 ( .I ( n76 ) , .ZN ( n77 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U135 ( .A1 ( n78 ) , .A2 ( n77 ) , 
    .ZN ( n169 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U136 ( .I ( n169 ) , .ZN ( n79 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U137 ( .A1 ( n85 ) , 
    .A2 ( intadd_0_SUM_3_ ) , .B1 ( n150 ) , .B2 ( n158 ) , .ZN ( n84_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U138 ( .A1 ( n148 ) , .A2 ( n162 ) , 
    .B1 ( n149 ) , .B2 ( n80 ) , .ZN ( n83_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U139 ( .A1 ( n79 ) , .A2 ( n156 ) , 
    .B1 ( intadd_0_SUM_2_ ) , .B2 ( n166 ) , .ZN ( n82_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U140 ( .A1 ( n160 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .B1 ( intadd_0_SUM_1_ ) , .B2 ( n172 ) , 
    .ZN ( n81_CDR1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U141 ( .A1 ( n84_CDR1 ) , .A2 ( n83_CDR1 ) , 
    .A3 ( n82_CDR1 ) , .A4 ( n81_CDR1 ) , .ZN ( n179 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U142 ( .A1 ( n157 ) , .A2 ( n179 ) , 
    .Z ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U143 ( .A1 ( intadd_0_SUM_2_ ) , 
    .A2 ( n160 ) , .B1 ( n155 ) , .B2 ( n162 ) , .ZN ( n89 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U144 ( .A1 ( intadd_0_SUM_1_ ) , 
    .A2 ( n148 ) , .B1 ( intadd_0_SUM_3_ ) , .B2 ( n172 ) , .ZN ( n88 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U145 ( .A1 ( n166 ) , .A2 ( n150 ) , 
    .B1 ( n85 ) , .B2 ( n156 ) , .ZN ( n87 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U146 ( .A1 ( n149 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .ZN ( n86 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U147 ( .A1 ( n89 ) , .A2 ( n88 ) , 
    .A3 ( n87 ) , .A4 ( n86 ) , .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U148 ( .A1 ( n98 ) , .A2 ( n99 ) , 
    .ZN ( n136 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U149 ( .A1 ( n100 ) , .A2 ( n136 ) , 
    .ZN ( n193 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U150 ( .A1 ( n102 ) , .A2 ( n193 ) , 
    .ZN ( n93 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U151 ( .A1 ( n132 ) , .A2 ( n93 ) , 
    .ZN ( n96 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U152 ( .I ( n97 ) , .ZN ( n90 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U153 ( .A1 ( n96 ) , .A2 ( n90 ) , 
    .ZN ( n91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U154 ( .A1 ( n92 ) , .A2 ( n91 ) , 
    .Z ( n105 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_140 ( .I ( n185 ) , 
    .ZN ( tmp_net48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U156 ( .A1 ( n102 ) , .A2 ( n193 ) , 
    .Z ( n130 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U159 ( .A1 ( n97 ) , .A2 ( n96 ) , 
    .Z ( n125 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U160 ( .A1 ( n123 ) , .A2 ( n125 ) , 
    .ZN ( n101 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U161 ( .A1 ( n105 ) , .A2 ( n101 ) , 
    .Z ( n111 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U162 ( .A1 ( n99 ) , .A2 ( n98 ) , 
    .Z ( n146 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U163 ( .I ( n100 ) , .ZN ( n137 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U164 ( .A1 ( n146 ) , .A2 ( n137 ) , 
    .B ( n101 ) , .ZN ( n106 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U165 ( .I ( n102 ) , .ZN ( n103 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U166 ( .A1 ( n106 ) , .A2 ( n105 ) , 
    .B1 ( n104 ) , .B2 ( n103 ) , .ZN ( n108 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U167 ( .A1 ( n109 ) , .A2 ( n108 ) , 
    .B ( n107 ) , .ZN ( n126 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U168 ( .A1 ( n111 ) , .A2 ( n126 ) , 
    .B ( n110 ) , .ZN ( n121 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U169 ( .I ( intadd_0_SUM_1_ ) , .ZN ( n163 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U170 ( .I ( n254 ) , .ZN ( n112 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U171 ( .A1 ( n113 ) , .A2 ( n163 ) , 
    .B ( n112 ) , .ZN ( n191 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U172 ( .A1 ( x[3] ) , .A2 ( x[6] ) , 
    .A3 ( x[2] ) , .A4 ( x[1] ) , .ZN ( n117 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U173 ( .A1 ( x[5] ) , .A2 ( x[4] ) , 
    .A3 ( x[0] ) , .ZN ( n116 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U174 ( .A1 ( w[6] ) , .A2 ( w[2] ) , 
    .A3 ( w[1] ) , .A4 ( w[3] ) , .ZN ( n115 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U175 ( .A1 ( w[4] ) , .A2 ( w[5] ) , 
    .A3 ( w[0] ) , .ZN ( n114 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U176 ( .A1 ( n117 ) , .A2 ( n116 ) , 
    .B1 ( n115 ) , .B2 ( n114 ) , .ZN ( n185 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U179 ( .I ( n142 ) , .ZN ( n200 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U180 ( .A1 ( n201 ) , .A2 ( w[5] ) , 
    .B1 ( n202 ) , .B2 ( vpu_res_out[5] ) , .C1 ( n5 ) , .C2 ( x[5] ) , 
    .ZN ( n217 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U181 ( .A1 ( n122 ) , .A2 ( n126 ) , 
    .ZN ( n147 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U182 ( .I ( n123 ) , .ZN ( n131 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U183 ( .A1 ( n125 ) , .A2 ( n131 ) , 
    .ZN ( n124 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U184 ( .A1 ( n125 ) , .A2 ( n131 ) , 
    .B ( n254 ) , .C ( n124 ) , .ZN ( n129 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U185 ( .A1 ( w[5] ) , .A2 ( n5 ) , 
    .B1 ( x[5] ) , .B2 ( n8 ) , .ZN ( n128 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( n126 ) , .ZN ( n127 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U187 ( .A1 ( n127 ) , .A2 ( n185 ) , 
    .B ( n254 ) , .ZN ( n195 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U188 ( .A1 ( n147 ) , .A2 ( n129 ) , 
    .B ( n128 ) , .C ( n195 ) , .ZN ( n348 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U189 ( .I ( n130 ) , .ZN ( n190 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U190 ( .A1 ( n132 ) , .A2 ( n131 ) , 
    .B1 ( n190 ) , .B2 ( n131 ) , .C ( n147 ) , .ZN ( n135 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U191 ( .I ( n195 ) , .ZN ( n144 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U192 ( .A1 ( n201 ) , .A2 ( x[4] ) , 
    .B1 ( n200 ) , .B2 ( w[4] ) , .ZN ( n133 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U193 ( .I ( n133 ) , .ZN ( n134 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U194 ( .A1 ( n191 ) , .A2 ( n135 ) , 
    .B ( n144 ) , .C ( n134 ) , .ZN ( n213 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U195 ( .A1 ( n201 ) , .A2 ( w[3] ) , 
    .B1 ( n202 ) , .B2 ( vpu_res_out[3] ) , .C1 ( n200 ) , .C2 ( x[3] ) , 
    .ZN ( n337 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U196 ( .A1 ( n137 ) , .A2 ( n136 ) , 
    .Z ( n139 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U197 ( .I ( n191 ) , .ZN ( n138 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U198 ( .A1 ( exe_inst_in[1] ) , 
    .A2 ( n140 ) , .B1 ( n139 ) , .B2 ( n138 ) , .ZN ( n141 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U199 ( .A1 ( w[2] ) , .A2 ( n5 ) , 
    .B ( n144 ) , .C ( n141 ) , .ZN ( n252 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U200 ( .A1 ( n201 ) , .A2 ( w[1] ) , 
    .B1 ( n202 ) , .B2 ( vpu_res_out[1] ) , .C1 ( n5 ) , .C2 ( x[1] ) , 
    .ZN ( n338 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U201 ( .A1 ( n143 ) , .A2 ( n142 ) , 
    .B1 ( n380 ) , .B2 ( exe_inst_in[1] ) , .ZN ( n145 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U202 ( .A1 ( n146 ) , .A2 ( n191 ) , 
    .B ( n145 ) , .C ( n144 ) , .ZN ( n344 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U203 ( .I ( n344 ) , .ZN ( n226 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U204 ( .I ( n147 ) , .ZN ( n182 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U205 ( .I ( n148 ) , .ZN ( n152 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U206 ( .A1 ( n150 ) , .A2 ( n160 ) , 
    .B1 ( intadd_0_SUM_2_ ) , .B2 ( n149 ) , .ZN ( n151 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U207 ( .A1 ( n153 ) , .A2 ( n152 ) , 
    .B ( n151 ) , .ZN ( n154 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U208 ( .A1 ( n172 ) , .A2 ( n156 ) , 
    .B ( n155 ) , .C ( n154 ) , .ZN ( n189 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U209 ( .I ( n157 ) , .ZN ( n180 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U210 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n158 ) , .B1 ( n172 ) , .B2 ( intadd_0_SUM_0_ ) , .ZN ( n171 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U211 ( .I ( n159 ) , .ZN ( n165 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U214 ( .A1 ( n164 ) , .A2 ( n163 ) , 
    .A3 ( n173 ) , .ZN ( n167 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U215 ( .A1 ( intadd_0_SUM_0_ ) , 
    .A2 ( n167 ) , .B1 ( n166 ) , .B2 ( n165 ) , .ZN ( n168 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U216 ( .A1 ( n171 ) , .A2 ( n170 ) , 
    .A3 ( n169 ) , .A4 ( n168 ) , .ZN ( n177 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_45_13 ( .I ( n172 ) , 
    .ZN ( HFSNET_11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U218 ( .A1 ( HFSNET_11 ) , .A2 ( n174 ) , 
    .B ( n173 ) , .ZN ( n176 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U219 ( .A1 ( n177 ) , .A2 ( n176 ) , 
    .B ( n180 ) , .C ( n179 ) , .ZN ( n178 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U220 ( .A1 ( n180 ) , .A2 ( n179 ) , 
    .B ( n178 ) , .ZN ( n181 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U221 ( .A1 ( n182 ) , .A2 ( n189 ) , 
    .B ( n191 ) , .C ( n181 ) , .ZN ( n183 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U222 ( .A1 ( exe_inst_in[1] ) , 
    .A2 ( n253 ) , .B ( n183 ) , .ZN ( n184 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U223 ( .A1 ( n5 ) , .A2 ( w[0] ) , 
    .B ( n185 ) , .C ( n184 ) , .ZN ( n346 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U224 ( .A1 ( vpu_res_out[0] ) , 
    .A2 ( n202 ) , .B1 ( w[0] ) , .B2 ( n201 ) , .C1 ( n200 ) , .C2 ( x[0] ) , 
    .ZN ( n339 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_169_1 ( .I ( n339 ) , .ZN ( HFSNET_0 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U226 ( .A1 ( n346 ) , .A2 ( HFSNET_0 ) , 
    .ZN ( n187 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U227 ( .A1 ( HFSNET_3 ) , .A2 ( n226 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( n187 ) , .C1 ( n226 ) , .C2 ( n187 ) , 
    .ZN ( n188 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U228 ( .A1 ( vpu_res_out[2] ) , 
    .A2 ( n202 ) , .B1 ( w[2] ) , .B2 ( n201 ) , .C1 ( n5 ) , .C2 ( x[2] ) , 
    .ZN ( n340 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U229 ( .I ( n340 ) , .ZN ( n210 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U230 ( .A1 ( n252 ) , .A2 ( n188 ) , 
    .B1 ( n252 ) , .B2 ( n210 ) , .C1 ( n188 ) , .C2 ( n210 ) , .ZN ( n197 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U231 ( .A1 ( w[3] ) , .A2 ( n5 ) , 
    .B1 ( x[3] ) , .B2 ( n201 ) , .ZN ( n196 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U232 ( .I ( n189 ) , .ZN ( n192 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U233 ( .A1 ( n193 ) , .A2 ( n192 ) , 
    .B ( n191 ) , .C ( n190 ) , .ZN ( n194 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U234 ( .A1 ( n196 ) , .A2 ( n195 ) , 
    .A3 ( n194 ) , .ZN ( n349 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U235 ( .A1 ( HFSNET_5 ) , .A2 ( n197 ) , 
    .B1 ( HFSNET_5 ) , .B2 ( n349 ) , .C1 ( n197 ) , .C2 ( n349 ) , 
    .ZN ( n198 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U236 ( .A1 ( n200 ) , .A2 ( x[4] ) , 
    .B1 ( w[4] ) , .B2 ( n201 ) , .C1 ( vpu_res_out[4] ) , .C2 ( n202 ) , 
    .ZN ( n354 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_226_9 ( .I ( n354 ) , .ZN ( HFSNET_7 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U238 ( .A1 ( n213 ) , .A2 ( n198 ) , 
    .B1 ( n213 ) , .B2 ( HFSNET_7 ) , .C1 ( n198 ) , .C2 ( HFSNET_7 ) , 
    .ZN ( n199 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U239 ( .A1 ( HFSNET_15 ) , .A2 ( n348 ) , 
    .B1 ( HFSNET_15 ) , .B2 ( n199 ) , .C1 ( n348 ) , .C2 ( n199 ) , 
    .ZN ( n203 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U240 ( .A1 ( vpu_res_out[6] ) , 
    .A2 ( n202 ) , .B1 ( w[6] ) , .B2 ( n201 ) , .C1 ( n200 ) , .C2 ( x[6] ) , 
    .ZN ( n222 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_209_11 ( .I ( n222 ) , 
    .ZN ( HFSNET_9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U242 ( .A1 ( n345 ) , .A2 ( n203 ) , 
    .B1 ( n345 ) , .B2 ( HFSNET_9 ) , .C1 ( n203 ) , .C2 ( HFSNET_9 ) , 
    .ZN ( n370 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_61_28 ( .I ( n370 ) , .Z ( HFSNET_19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U244 ( .I ( n349 ) , .ZN ( n204 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U245 ( .I ( n348 ) , .ZN ( n216 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U246 ( .A1 ( n345 ) , .A2 ( n204 ) , 
    .A3 ( n216 ) , .A4 ( n213 ) , .ZN ( n206 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U247 ( .A1 ( HFSNET_8 ) , .A2 ( HFSNET_15 ) , 
    .A3 ( HFSNET_10 ) , .A4 ( HFSNET_5 ) , .ZN ( n205 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U248 ( .A1 ( n206 ) , .A2 ( n205 ) , 
    .ZN ( n269 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U249 ( .I ( n269 ) , .ZN ( n265 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 U250 ( .A1 ( HFSNET_18 ) , .A2 ( n204 ) , 
    .B1 ( HFSNET_19 ) , .B2 ( HFSNET_5 ) , .C ( n265 ) , .ZN ( n208 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U251 ( .I ( n208 ) , .ZN ( n276 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U252 ( .A1 ( n206 ) , .A2 ( n205 ) , 
    .ZN ( n211 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U253 ( .I ( n211 ) , .ZN ( n230 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U254 ( .A1 ( n349 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( n207 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U255 ( .A1 ( HFSNET_5 ) , 
    .A2 ( HFSNET_18 ) , .B ( n230 ) , .C ( n207 ) , .ZN ( n212 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U256 ( .I ( n212 ) , .ZN ( n209 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U257 ( .A1 ( n276 ) , .A2 ( n212 ) , 
    .B1 ( n209 ) , .B2 ( n208 ) , .ZN ( n246 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U258 ( .I ( n252 ) , .ZN ( n350 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U259 ( .A1 ( HFSNET_19 ) , .A2 ( n210 ) , 
    .B1 ( n350 ) , .B2 ( HFSNET_18 ) , .ZN ( n234 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U260 ( .A1 ( n246 ) , .A2 ( n234 ) , 
    .B1 ( n276 ) , .B2 ( n211 ) , .ZN ( n296 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U261 ( .A1 ( HFSNET_19 ) , .A2 ( n213 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( HFSNET_18 ) , .ZN ( n278 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U262 ( .A1 ( n276 ) , .A2 ( n212 ) , 
    .ZN ( n224 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U263 ( .I ( n213 ) , .ZN ( n347 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U264 ( .A1 ( HFSNET_19 ) , .A2 ( HFSNET_7 ) , 
    .B1 ( n347 ) , .B2 ( HFSNET_18 ) , .ZN ( n223 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 HFSINV_119_15 ( .I ( n217 ) , 
    .ZN ( HFSNET_13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U266 ( .A1 ( HFSNET_15 ) , .A2 ( n216 ) , 
    .B1 ( n348 ) , .B2 ( HFSNET_13 ) , .ZN ( n215 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U267 ( .A1 ( n218 ) , .A2 ( n215 ) , 
    .Z ( n294 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U268 ( .I ( n294 ) , .ZN ( n232 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U269 ( .A1 ( HFSNET_19 ) , 
    .A2 ( HFSNET_15 ) , .B1 ( n216 ) , .B2 ( HFSNET_18 ) , .ZN ( n220 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U270 ( .A1 ( HFSNET_19 ) , .A2 ( n348 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( HFSNET_18 ) , .ZN ( n266 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U271 ( .I ( n218 ) , .ZN ( n219 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U272 ( .A1 ( n220 ) , .A2 ( n266 ) , 
    .B1 ( n220 ) , .B2 ( n219 ) , .C1 ( n266 ) , .C2 ( n219 ) , .ZN ( n221 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U273 ( .A1 ( HFSNET_10 ) , .A2 ( n345 ) , 
    .ZN ( n328 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U274 ( .A1 ( HFSNET_10 ) , .A2 ( n345 ) , 
    .B ( n221 ) , .C ( n328 ) , .ZN ( n228 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U275 ( .A ( n278 ) , .B ( n224 ) , 
    .CI ( n223 ) , .CO ( n218 ) , .S ( n237 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U276 ( .I ( n237 ) , .ZN ( n229 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U277 ( .A1 ( n228 ) , .A2 ( n229 ) , 
    .ZN ( n293 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U278 ( .A1 ( n232 ) , .A2 ( n293 ) , 
    .ZN ( n262 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U279 ( .A1 ( n296 ) , .A2 ( n262 ) , 
    .ZN ( n225 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U280 ( .A1 ( n302 ) , .A2 ( n225 ) , 
    .Z ( intadd_1_A_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_10_3 ( .I ( n338 ) , .ZN ( HFSNET_2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U282 ( .A1 ( HFSNET_19 ) , .A2 ( HFSNET_2 ) , 
    .B1 ( n226 ) , .B2 ( HFSNET_18 ) , .ZN ( n244 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U283 ( .I ( n246 ) , .ZN ( n243 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U284 ( .A1 ( n246 ) , .A2 ( n244 ) , 
    .B1 ( n234 ) , .B2 ( n243 ) , .ZN ( n249 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U285 ( .A1 ( n294 ) , .A2 ( n228 ) , 
    .ZN ( n235 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U286 ( .A1 ( n229 ) , .A2 ( n235 ) , 
    .ZN ( n298 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U287 ( .A1 ( n230 ) , .A2 ( n246 ) , 
    .ZN ( n248 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U288 ( .A1 ( HFSNET_19 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n346 ) , .B2 ( HFSNET_18 ) , .ZN ( n236 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U289 ( .A1 ( n236 ) , .A2 ( n243 ) , 
    .ZN ( n231 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U290 ( .A1 ( n232 ) , .A2 ( n248 ) , 
    .B1 ( n294 ) , .B2 ( n231 ) , .C ( n293 ) , .ZN ( n233 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U291 ( .A1 ( n249 ) , .A2 ( n298 ) , 
    .B ( n233 ) , .ZN ( n303 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U292 ( .I ( n303 ) , .ZN ( n242 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_118_20 ( .I ( n302 ) , 
    .ZN ( HFSNET_16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U294 ( .A1 ( n294 ) , .A2 ( n234 ) , 
    .ZN ( n241 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U295 ( .I ( n235 ) , .ZN ( n239 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U296 ( .I ( n236 ) , .ZN ( n245 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U297 ( .A1 ( n237 ) , .A2 ( n243 ) , 
    .ZN ( n238 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U298 ( .A1 ( n239 ) , .A2 ( n245 ) , 
    .B1 ( n239 ) , .B2 ( n238 ) , .C1 ( n245 ) , .C2 ( n244 ) , .ZN ( n240 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U299 ( .A1 ( n241 ) , .A2 ( n243 ) , 
    .B ( n240 ) , .ZN ( n333 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U300 ( .A1 ( HFSNET_16 ) , .A2 ( n333 ) , 
    .ZN ( n300 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U301 ( .A1 ( n242 ) , .A2 ( n300 ) , 
    .ZN ( intadd_1_A_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U302 ( .A1 ( HFSNET_19 ) , .A2 ( n346 ) , 
    .B1 ( HFSNET_1 ) , .B2 ( HFSNET_18 ) , .ZN ( intadd_1_B_0_ ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U303 ( .A1 ( n246 ) , .A2 ( n245 ) , 
    .B1 ( n244 ) , .B2 ( n243 ) , .ZN ( n297 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U304 ( .A1 ( n262 ) , .A2 ( n297 ) , 
    .B1 ( n298 ) , .B2 ( n296 ) , .ZN ( n247 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U305 ( .A1 ( n247 ) , .A2 ( n302 ) , 
    .Z ( intadd_1_CI ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U306 ( .A1 ( HFSNET_19 ) , .A2 ( n344 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( HFSNET_18 ) , .ZN ( intadd_1_A_1_ ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U307 ( .I ( n248 ) , .ZN ( n261 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U308 ( .A1 ( n261 ) , .A2 ( n298 ) , 
    .B1 ( n262 ) , .B2 ( n249 ) , .ZN ( n250 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U309 ( .A1 ( n250 ) , .A2 ( n302 ) , 
    .Z ( intadd_1_B_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U310 ( .A1 ( HFSNET_19 ) , .A2 ( n252 ) , 
    .B1 ( n340 ) , .B2 ( HFSNET_18 ) , .ZN ( intadd_1_B_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U312 ( .A1 ( n254 ) , 
    .A2 ( exe_inst_in[6] ) , .A3 ( n253 ) , .ZN ( n255 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U313 ( .A1 ( x[1] ) , .A2 ( x[2] ) , 
    .A3 ( n256 ) , .A4 ( n255 ) , .ZN ( n258 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U314 ( .A1 ( n258 ) , 
    .A2 ( exe_inst_in[2] ) , .B ( exe_inst_in[8] ) , .ZN ( n257 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U315 ( .A1 ( rst_n ) , .A2 ( n434 ) , 
    .ZN ( n260 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U316 ( .A1 ( exe_inst_in[8] ) , 
    .A2 ( n260 ) , .ZN ( n381 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U317 ( .I ( n381 ) , .ZN ( n435 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U318 ( .I ( exe_inst_in[7] ) , .ZN ( n457 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U319 ( .I ( n258 ) , .ZN ( n259 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U320 ( .A1 ( n260 ) , .A2 ( n457 ) , 
    .A3 ( n259 ) , .ZN ( n392 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U321 ( .I ( n392 ) , .ZN ( n384 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U322 ( .I ( n328 ) , .ZN ( n288 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U323 ( .A1 ( n262 ) , .A2 ( n261 ) , 
    .ZN ( n263 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U324 ( .A1 ( n302 ) , .A2 ( n263 ) , 
    .Z ( n267 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U327 ( .A1 ( n276 ) , .A2 ( n312 ) , 
    .ZN ( n275 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U328 ( .A1 ( n278 ) , .A2 ( n275 ) , 
    .ZN ( n270 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U329 ( .A1 ( n266 ) , .A2 ( n270 ) , 
    .ZN ( n329 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U330 ( .I ( n329 ) , .ZN ( n287 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U331 ( .A1 ( n266 ) , .A2 ( n270 ) , 
    .B ( n329 ) , .ZN ( n321 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U332 ( .A1 ( n267 ) , .A2 ( intadd_1_n1 ) , 
    .Z ( n313 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U333 ( .I ( n312 ) , .ZN ( n314 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U334 ( .A1 ( n269 ) , .A2 ( n313 ) , 
    .ZN ( n268 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U335 ( .A1 ( n269 ) , .A2 ( n313 ) , 
    .B ( n314 ) , .C ( n268 ) , .ZN ( n387 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U336 ( .I ( intadd_1_SUM_2_ ) , .ZN ( n393 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U337 ( .A1 ( n387 ) , .A2 ( n393 ) , 
    .ZN ( n271 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U338 ( .A1 ( n271 ) , 
    .A2 ( intadd_1_SUM_0_ ) , .A3 ( intadd_1_SUM_1_ ) , .ZN ( n285 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U339 ( .A1 ( n278 ) , .A2 ( n275 ) , 
    .B ( n270 ) , .ZN ( n289 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U340 ( .A1 ( n314 ) , 
    .A2 ( intadd_1_SUM_1_ ) , .B1 ( intadd_1_SUM_0_ ) , .B2 ( n312 ) , 
    .ZN ( n309 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U341 ( .A1 ( n314 ) , 
    .A2 ( intadd_1_SUM_2_ ) , .B1 ( intadd_1_SUM_1_ ) , .B2 ( n312 ) , 
    .ZN ( n317 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U342 ( .A1 ( n309 ) , .A2 ( n317 ) , 
    .B ( n271 ) , .ZN ( n279 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U343 ( .I ( n278 ) , .ZN ( n272 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U344 ( .A1 ( n279 ) , .A2 ( n272 ) , 
    .B ( n312 ) , .ZN ( n273 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U345 ( .I ( n285 ) , .ZN ( n367 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U346 ( .A1 ( n321 ) , .A2 ( n273 ) , 
    .B1 ( n321 ) , .B2 ( n367 ) , .C1 ( n273 ) , .C2 ( n367 ) , .ZN ( n274 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U347 ( .A1 ( n288 ) , .A2 ( n274 ) , 
    .ZN ( n283 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U348 ( .A1 ( n276 ) , .A2 ( n312 ) , 
    .B ( n275 ) , .ZN ( n292 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U349 ( .I ( n292 ) , .ZN ( n277 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U350 ( .A1 ( n292 ) , .A2 ( n278 ) , 
    .B1 ( n289 ) , .B2 ( n277 ) , .ZN ( n281 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U351 ( .A1 ( n279 ) , .A2 ( n283 ) , 
    .ZN ( n280 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U352 ( .A1 ( n283 ) , .A2 ( n281 ) , 
    .B ( n280 ) , .ZN ( n391 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U353 ( .A1 ( n309 ) , 
    .A2 ( intadd_1_SUM_1_ ) , .ZN ( n282 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U354 ( .A1 ( intadd_1_SUM_2_ ) , 
    .A2 ( n282 ) , .B ( n283 ) , .C ( n387 ) , .ZN ( n291 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U355 ( .A1 ( n283 ) , .A2 ( n292 ) , 
    .B ( n291 ) , .ZN ( n308 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U356 ( .I ( n308 ) , .ZN ( n395 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U357 ( .A1 ( n292 ) , .A2 ( n395 ) , 
    .ZN ( n290 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U358 ( .A1 ( n285 ) , .A2 ( n284 ) , 
    .ZN ( n320 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U359 ( .A1 ( n321 ) , .A2 ( n320 ) , 
    .ZN ( n286 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U360 ( .A1 ( n288 ) , .A2 ( n287 ) , 
    .B ( n286 ) , .ZN ( n438 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U361 ( .A ( n289 ) , .B ( n391 ) , 
    .CI ( n290 ) , .CO ( n284 ) , .S ( n326 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U362 ( .A1 ( n292 ) , .A2 ( n291 ) , 
    .B ( n290 ) , .ZN ( n324 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U363 ( .A1 ( n294 ) , .A2 ( n293 ) , 
    .ZN ( n295 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U364 ( .A1 ( n298 ) , .A2 ( n297 ) , 
    .B1 ( n296 ) , .B2 ( n295 ) , .ZN ( n301 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U365 ( .A1 ( n301 ) , .A2 ( n302 ) , 
    .Z ( n299 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U366 ( .A1 ( n314 ) , .A2 ( n242 ) , 
    .B1 ( n300 ) , .B2 ( n299 ) , .ZN ( n332 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U367 ( .A1 ( n301 ) , .A2 ( n333 ) , 
    .B ( n303 ) , .ZN ( n305 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U368 ( .A1 ( n305 ) , .A2 ( HFSNET_16 ) , 
    .B1 ( n303 ) , .B2 ( n302 ) , .C ( intadd_1_A_0_ ) , .ZN ( n368 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U369 ( .A1 ( n314 ) , 
    .A2 ( intadd_1_SUM_0_ ) , .B1 ( n368 ) , .B2 ( n312 ) , .ZN ( n306 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U370 ( .I0 ( n332 ) , .I1 ( n306 ) , 
    .S ( n395 ) , .Z ( n307 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U371 ( .A1 ( n391 ) , .A2 ( n307 ) , 
    .ZN ( n389 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U372 ( .A1 ( n395 ) , .A2 ( n309 ) , 
    .B1 ( n306 ) , .B2 ( n308 ) , .ZN ( n331 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U373 ( .A1 ( n389 ) , .A2 ( n331 ) , 
    .ZN ( n319 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U375 ( .A1 ( n395 ) , .A2 ( n317 ) , 
    .B1 ( n309 ) , .B2 ( n308 ) , .ZN ( n390 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U378 ( .A1 ( n319 ) , .A2 ( n318 ) , 
    .ZN ( n322 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U379 ( .A1 ( n314 ) , .A2 ( n313 ) , 
    .B1 ( n393 ) , .B2 ( n312 ) , .ZN ( n315 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U380 ( .A1 ( n395 ) , .A2 ( n315 ) , 
    .B1 ( n391 ) , .B2 ( n331 ) , .ZN ( n316 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U381 ( .A1 ( n317 ) , .A2 ( n395 ) , 
    .B ( n316 ) , .ZN ( n323 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U382 ( .A1 ( n322 ) , .A2 ( n323 ) , 
    .ZN ( n383 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U383 ( .A1 ( n324 ) , .A2 ( n383 ) , 
    .ZN ( n325 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U384 ( .A1 ( n326 ) , .A2 ( n325 ) , 
    .Z ( n429 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U385 ( .A1 ( n319 ) , .A2 ( n318 ) , 
    .Z ( n375 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U386 ( .A1 ( n321 ) , .A2 ( n320 ) , 
    .ZN ( n430 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U387 ( .A1 ( n323 ) , .A2 ( n322 ) , 
    .Z ( n382 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U388 ( .A1 ( n324 ) , .A2 ( n383 ) , 
    .ZN ( n396 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U389 ( .A1 ( n375 ) , .A2 ( n430 ) , 
    .A3 ( n382 ) , .A4 ( n396 ) , .ZN ( n327 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U390 ( .I ( n325 ) , .ZN ( n397 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U391 ( .A1 ( n326 ) , .A2 ( n397 ) , 
    .ZN ( n431 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U392 ( .A1 ( n431 ) , .A2 ( n430 ) , 
    .ZN ( n436 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U393 ( .A1 ( n429 ) , .A2 ( n327 ) , 
    .B ( n436 ) , .ZN ( n330 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U394 ( .A1 ( n438 ) , .A2 ( n330 ) , 
    .B1 ( n329 ) , .B2 ( n328 ) , .ZN ( n376 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U395 ( .I ( n331 ) , .ZN ( n336 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U396 ( .A1 ( n333 ) , .A2 ( n332 ) , 
    .ZN ( n334 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U397 ( .A1 ( n336 ) , .A2 ( n389 ) , 
    .A3 ( n334 ) , .ZN ( n335 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U398 ( .A1 ( n391 ) , .A2 ( n336 ) , 
    .A3 ( n389 ) , .B ( n335 ) , .ZN ( n355 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U399 ( .A1 ( n340 ) , .A2 ( HFSNET_1 ) , 
    .A3 ( HFSNET_3 ) , .A4 ( n337 ) , .ZN ( n343 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U400 ( .A1 ( n343 ) , .A2 ( HFSNET_13 ) , 
    .A3 ( HFSNET_9 ) , .ZN ( n353 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or3_1 U401 ( .A1 ( n346 ) , .A2 ( n345 ) , 
    .A3 ( n344 ) , .Z ( n352 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U402 ( .A1 ( n350 ) , .A2 ( n349 ) , 
    .A3 ( n348 ) , .A4 ( n347 ) , .ZN ( n351 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U403 ( .A1 ( HFSNET_8 ) , .A2 ( n353 ) , 
    .B1 ( n352 ) , .B2 ( n351 ) , .ZN ( n378 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U408 ( .A1 ( input_data_val ) , 
    .A2 ( rst_n ) , .ZN ( n444 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U409 ( .A1 ( n444 ) , .A2 ( rst_n ) , 
    .ZN ( n443 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U410 ( .A1 ( x[0] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[0] ) , .ZN ( n359 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U411 ( .I ( n359 ) , .ZN ( n426 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U412 ( .A1 ( x[1] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[1] ) , .ZN ( n360 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U413 ( .I ( n360 ) , .ZN ( n425 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U414 ( .A1 ( x[2] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[2] ) , .ZN ( n361 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U415 ( .I ( n361 ) , .ZN ( n424 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U416 ( .A1 ( x[3] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[3] ) , .ZN ( n362 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U417 ( .I ( n362 ) , .ZN ( n423 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U418 ( .A1 ( x[4] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[4] ) , .ZN ( n363 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U419 ( .I ( n363 ) , .ZN ( n422 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U420 ( .A1 ( x[5] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[5] ) , .ZN ( n364 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U421 ( .I ( n364 ) , .ZN ( n421 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U422 ( .A1 ( x[6] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[6] ) , .ZN ( n365 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U423 ( .I ( n365 ) , .ZN ( n420 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U424 ( .I ( x[7] ) , .ZN ( n374 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U425 ( .A1 ( n368 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( n367 ) , .B2 ( HFSNET_19 ) , .C ( n366 ) , .ZN ( n369 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U426 ( .A1 ( n371 ) , .A2 ( HFSNET_19 ) , 
    .B ( n369 ) , .C ( n378 ) , .ZN ( n372 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U427 ( .A1 ( n372 ) , .A2 ( n384 ) , 
    .B1 ( vpu_res_out[7] ) , .B2 ( n434 ) , .ZN ( n373 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U428 ( .A1 ( n374 ) , .A2 ( n381 ) , 
    .B ( n373 ) , .ZN ( n419 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U429 ( .A1 ( n375 ) , .A2 ( n384 ) , 
    .B1 ( vpu_res_out[1] ) , .B2 ( n434 ) , .ZN ( n379 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U430 ( .I ( n376 ) , .ZN ( n377 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U431 ( .A1 ( n378 ) , .A2 ( n377 ) , 
    .B ( n384 ) , .ZN ( n441 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U432 ( .A1 ( n381 ) , .A2 ( n380 ) , 
    .B ( n379 ) , .C ( n441 ) , .ZN ( n418 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U433 ( .A1 ( x[2] ) , .A2 ( n435 ) , 
    .B1 ( vpu_res_out[2] ) , .B2 ( n434 ) , .ZN ( n386 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U434 ( .A1 ( n384 ) , .A2 ( n383 ) , 
    .A3 ( n382 ) , .ZN ( n385 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U435 ( .A1 ( n386 ) , .A2 ( n441 ) , 
    .A3 ( n385 ) , .ZN ( n417 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U436 ( .A1 ( x[3] ) , .A2 ( n435 ) , 
    .B1 ( vpu_res_out[3] ) , .B2 ( n434 ) , .ZN ( n399 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U437 ( .I ( n387 ) , .ZN ( n388 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U438 ( .A1 ( n391 ) , .A2 ( n390 ) , 
    .B ( n389 ) , .C ( n388 ) , .ZN ( n394 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U439 ( .A1 ( n395 ) , .A2 ( n394 ) , 
    .B1 ( n393 ) , .B2 ( n394 ) , .C ( n392 ) , .ZN ( n437 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U440 ( .A1 ( n437 ) , .A2 ( n397 ) , 
    .A3 ( n396 ) , .ZN ( n398 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U441 ( .A1 ( n399 ) , .A2 ( n441 ) , 
    .A3 ( n398 ) , .ZN ( n416 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U442 ( .I ( n437 ) , .ZN ( n428 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U443 ( .A1 ( x[4] ) , .A2 ( n435 ) , 
    .B1 ( vpu_res_out[4] ) , .B2 ( n434 ) , .ZN ( n400 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U444 ( .A1 ( n429 ) , .A2 ( n428 ) , 
    .B ( n400 ) , .C ( n441 ) , .ZN ( n415 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U445 ( .A1 ( x[5] ) , .A2 ( n435 ) , 
    .B1 ( vpu_res_out[5] ) , .B2 ( n434 ) , .ZN ( n433 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U446 ( .A1 ( n431 ) , .A2 ( n430 ) , 
    .B ( n437 ) , .C ( n436 ) , .ZN ( n432 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U447 ( .A1 ( n433 ) , .A2 ( n441 ) , 
    .A3 ( n432 ) , .ZN ( n414 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U448 ( .A1 ( x[6] ) , .A2 ( n435 ) , 
    .B1 ( vpu_res_out[6] ) , .B2 ( n434 ) , .ZN ( n442 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U449 ( .I ( n436 ) , .ZN ( n439 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U450 ( .A1 ( n439 ) , .A2 ( n438 ) , 
    .B ( n437 ) , .ZN ( n440 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U451 ( .A1 ( n442 ) , .A2 ( n441 ) , 
    .A3 ( n440 ) , .ZN ( n413 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U452 ( .A1 ( x[7] ) , .A2 ( n444 ) , 
    .B1 ( n443 ) , .B2 ( input_data[7] ) , .ZN ( n445 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U453 ( .I ( n445 ) , .ZN ( n412 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U454 ( .A1 ( weight_data_val ) , 
    .A2 ( rst_n ) , .ZN ( n454 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U455 ( .A1 ( n454 ) , .A2 ( rst_n ) , 
    .ZN ( n453 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U456 ( .A1 ( w[0] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[0] ) , .ZN ( n446 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U457 ( .I ( n446 ) , .ZN ( n411 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U458 ( .A1 ( w[1] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[1] ) , .ZN ( n447 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U459 ( .I ( n447 ) , .ZN ( n410 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U460 ( .A1 ( w[2] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[2] ) , .ZN ( n448 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U461 ( .I ( n448 ) , .ZN ( n409 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U462 ( .A1 ( w[3] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[3] ) , .ZN ( n449 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U463 ( .I ( n449 ) , .ZN ( n408 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U464 ( .A1 ( w[4] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[4] ) , .ZN ( n450 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U465 ( .I ( n450 ) , .ZN ( n407 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U466 ( .A1 ( w[5] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[5] ) , .ZN ( n451 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U467 ( .I ( n451 ) , .ZN ( n406 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U468 ( .A1 ( w[6] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[6] ) , .ZN ( n452 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U469 ( .I ( n452 ) , .ZN ( n405 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U470 ( .A1 ( w[7] ) , .A2 ( n454 ) , 
    .B1 ( n453 ) , .B2 ( weight_data[7] ) , .ZN ( n455 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U471 ( .I ( n455 ) , .ZN ( n404 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U472 ( .A1 ( HFSNET_20 ) , 
    .A2 ( exe_inst_in_val ) , .Z ( N787 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U473 ( .A1 ( exe_inst_in_val ) , 
    .A2 ( rst_n ) , .ZN ( n462 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U474 ( .A1 ( n457 ) , 
    .A2 ( exe_inst_in[8] ) , .B ( N787 ) , .ZN ( n458 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U475 ( .I ( n458 ) , .ZN ( n461 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U476 ( .A1 ( n462 ) , .A2 ( act_op_out[2] ) , 
    .B1 ( n461 ) , .B2 ( exe_inst_in[5] ) , .ZN ( n459 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U477 ( .I ( n459 ) , .ZN ( n403 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U478 ( .A1 ( n462 ) , .A2 ( act_op_out[1] ) , 
    .B1 ( n461 ) , .B2 ( exe_inst_in[4] ) , .ZN ( n460 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U479 ( .I ( n460 ) , .ZN ( n402 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U480 ( .A1 ( n462 ) , .A2 ( act_op_out[0] ) , 
    .B1 ( n461 ) , .B2 ( exe_inst_in[3] ) , .ZN ( n463 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U481 ( .I ( n463 ) , .ZN ( n401 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_133_2 ( .I ( n339 ) , .Z ( HFSNET_1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_225_4 ( .I ( n338 ) , .Z ( HFSNET_3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_154_6 ( .I ( n337 ) , .Z ( HFSNET_5 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_178_10 ( .I ( n354 ) , .Z ( HFSNET_8 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_169_12 ( .I ( n222 ) , 
    .Z ( HFSNET_10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_27_17 ( .I ( n217 ) , .Z ( HFSNET_15 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module mem_ctrl ( clk , rst_n , mem_inst_in , mem_inst_in_val , mem_rdy , 
    mem_itf_rdy , read_en , write_en , copy_en , src_addr , dst_addr , 
    write_data , read_data , read_data_val , weight_data , weight_data_val , 
    input_data , input_data_val , act_res_in , VPWR , VGND , HFSNET_1 , 
    ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
input  [15:0] mem_inst_in ;
input  mem_inst_in_val ;
output mem_rdy ;
input  mem_itf_rdy ;
output read_en ;
output write_en ;
output copy_en ;
output [24:0] src_addr ;
output [24:0] dst_addr ;
output [7:0] write_data ;
input  [7:0] read_data ;
input  read_data_val ;
output [7:0] weight_data ;
output weight_data_val ;
output [7:0] input_data ;
output input_data_val ;
input  [7:0] act_res_in ;
input  VPWR ;
input  VGND ;
input  HFSNET_1 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;

wire tmp_net91 ;
wire tmp_net92 ;
wire tmp_net93 ;
wire tmp_net97 ;
wire tmp_net98 ;
wire tmp_net99 ;
wire force_weight ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n100 ;
wire n101 ;
wire n102 ;
wire n103 ;
wire n104 ;
wire n105 ;
wire n106 ;
wire n107 ;
wire n108 ;
wire n109 ;
wire n110 ;
wire n111 ;
wire n112 ;
wire n113 ;
wire n114 ;
wire n115 ;
wire n116 ;
wire n117 ;
wire n118 ;
wire n119 ;
wire n120 ;
wire n121 ;
wire n122 ;
wire n123 ;
wire n124 ;
wire n125 ;
wire n126 ;
wire n127 ;
wire n128 ;
wire n129 ;
wire n130 ;
wire n131 ;
wire n132 ;
wire n133 ;
wire n134 ;
wire n135 ;
wire n136 ;
wire n137 ;
wire n138 ;
wire n139 ;
wire n140 ;
wire n141 ;
wire n142 ;
wire n143 ;
wire n144 ;
wire n145 ;
wire n146 ;
wire n147 ;
wire n148 ;
wire n149 ;
wire n150 ;
wire tmp_net100 ;
wire tmp_net101 ;
wire tmp_net102 ;
wire n11 ;
wire n12 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n25 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n32 ;
wire n33 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire n49 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire n60 ;
wire n61 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire n70 ;
wire n71 ;
wire n72 ;
wire n73 ;
wire n74 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81 ;
wire n82 ;
wire n83 ;
wire n84 ;
wire n85 ;
wire n86 ;
wire n87 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n95 ;
wire n96 ;
wire n151 ;
wire n152 ;
wire n153 ;
wire n154 ;
wire n155 ;
wire n156 ;
wire n157 ;
wire n158 ;
wire n159 ;
wire n160 ;
wire n161 ;
wire n162 ;
wire n163 ;
wire n164 ;
wire n165 ;
wire n166 ;
wire n167 ;
wire n168 ;
wire n169 ;
wire n170 ;
wire n171 ;
wire n172 ;
wire n173 ;
wire n174 ;
wire [2:0] state ;
supply1 VPWR ;
supply0 VGND ;

assign write_data[7] = act_res_in[7] ;
assign write_data[6] = act_res_in[6] ;
assign write_data[5] = act_res_in[5] ;
assign write_data[4] = act_res_in[4] ;
assign write_data[3] = act_res_in[3] ;
assign write_data[2] = act_res_in[2] ;
assign write_data[1] = act_res_in[1] ;
assign write_data[0] = act_res_in[0] ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n150 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 force_weight_reg ( .D ( n149 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( force_weight ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n147 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_2_ ( .D ( n148 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( state[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_0_ ( .D ( n146 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_12_ ( .D ( n145 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_11_ ( .D ( n144 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_10_ ( .D ( n143 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_9_ ( .D ( n142 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_8_ ( .D ( n141 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_7_ ( .D ( n140 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_6_ ( .D ( n139 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_5_ ( .D ( n138 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_4_ ( .D ( n137 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_3_ ( .D ( n136 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_2_ ( .D ( n135 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_1_ ( .D ( n134 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_0_ ( .D ( n121 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_12_ ( .D ( n120 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_11_ ( .D ( n119 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_10_ ( .D ( n118 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_9_ ( .D ( n117 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_8_ ( .D ( n116 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_7_ ( .D ( n115 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_6_ ( .D ( n114 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_5_ ( .D ( n113 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_4_ ( .D ( n112 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_3_ ( .D ( n111 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_2_ ( .D ( n110 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_1_ ( .D ( n109 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_13_ ( .D ( n133 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_24_ ( .D ( n132 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[24] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_23_ ( .D ( n131 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[23] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_22_ ( .D ( n130 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[22] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_21_ ( .D ( n129 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[21] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_20_ ( .D ( n128 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[20] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_19_ ( .D ( n127 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[19] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_18_ ( .D ( n126 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[18] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_17_ ( .D ( n125 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[17] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_16_ ( .D ( n124 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[16] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_15_ ( .D ( n123 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_14_ ( .D ( n122 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_13_ ( .D ( n108 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_24_ ( .D ( n107 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[24] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_23_ ( .D ( n106 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[23] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_22_ ( .D ( n105 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[22] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_21_ ( .D ( n104 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[21] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_20_ ( .D ( n103 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[20] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_19_ ( .D ( n102 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[19] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_18_ ( .D ( n101 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[18] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_17_ ( .D ( n100 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[17] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_16_ ( .D ( n99 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[16] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_15_ ( .D ( n98 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_14_ ( .D ( n97 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_203 ( .A1 ( n29 ) , .A2 ( n30 ) , 
    .B ( tmp_net92 ) , .ZN ( n149 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_204 ( .A1 ( n29 ) , 
    .A2 ( tmp_net91 ) , .ZN ( tmp_net92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_3_205 ( .A1 ( rst_n ) , 
    .A2 ( n170 ) , .ZN ( tmp_net91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_206 ( .A1 ( n91 ) , 
    .A2 ( tmp_net93 ) , .B ( HFSNET_1 ) , .ZN ( n42 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_207 ( .A1 ( mem_inst_in[13] ) , 
    .A2 ( mem_inst_in[14] ) , .Z ( tmp_net93 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_213 ( .A1 ( tmp_net100 ) , 
    .A2 ( HFSNET_1 ) , .ZN ( n172 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_2_214 ( .A1 ( tmp_net97 ) , 
    .A2 ( tmp_net98 ) , .A3 ( tmp_net99 ) , .ZN ( tmp_net100 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_215 ( .I ( n91 ) , 
    .ZN ( tmp_net97 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_216 ( .I ( n93 ) , 
    .ZN ( tmp_net98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_5_217 ( .I ( n92 ) , 
    .ZN ( tmp_net99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U13 ( .I ( n42 ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U14 ( .I ( n74 ) , .ZN ( n12 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( read_data[1] ) , .ZN ( n17 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( read_data[3] ) , .ZN ( n19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( n17 ) , .ZN ( weight_data[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( n16 ) , .ZN ( input_data[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n19 ) , .ZN ( weight_data[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_218 ( .A1 ( n37 ) , .A2 ( n36 ) , 
    .B ( tmp_net102 ) , .ZN ( n148 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_219 ( .A1 ( n37 ) , 
    .A2 ( tmp_net101 ) , .ZN ( tmp_net102 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_3_220 ( .A1 ( n32 ) , .A2 ( n33 ) , 
    .ZN ( tmp_net101 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U29 ( .I ( read_data[7] ) , .ZN ( n14 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( n14 ) , .ZN ( weight_data[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( n14 ) , .ZN ( input_data[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U32 ( .I ( read_data[6] ) , .ZN ( n15 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( n15 ) , .ZN ( weight_data[6] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( n15 ) , .ZN ( input_data[6] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U35 ( .I ( read_data[0] ) , .ZN ( n16 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( n16 ) , .ZN ( weight_data[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U37 ( .I ( n17 ) , .ZN ( input_data[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( read_data[2] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U39 ( .I ( n18 ) , .ZN ( weight_data[2] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( n18 ) , .ZN ( input_data[2] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( n19 ) , .ZN ( input_data[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( read_data[4] ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U43 ( .I ( n20 ) , .ZN ( weight_data[4] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( n20 ) , .ZN ( input_data[4] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U45 ( .I ( read_data[5] ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U46 ( .I ( n21 ) , .ZN ( weight_data[5] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U47 ( .I ( n21 ) , .ZN ( input_data[5] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( state[1] ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U49 ( .I ( state[0] ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U50 ( .A1 ( n23 ) , .A2 ( n28 ) , 
    .ZN ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U51 ( .A1 ( state[2] ) , .A2 ( n24 ) , 
    .ZN ( mem_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U52 ( .I ( force_weight ) , .ZN ( n30 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( src_addr[24] ) , .ZN ( n60 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U56 ( .I ( n24 ) , .ZN ( n33 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U57 ( .A1 ( HFSNET_1 ) , .A2 ( state[2] ) , 
    .A3 ( read_data_val ) , .A4 ( n33 ) , .ZN ( n22 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U58 ( .A1 ( src_addr[23] ) , .A2 ( n30 ) , 
    .B1 ( n60 ) , .B2 ( n30 ) , .C ( n22 ) , .ZN ( weight_data_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( src_addr[23] ) , .ZN ( n61 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U60 ( .A1 ( force_weight ) , .A2 ( n61 ) , 
    .A3 ( n60 ) , .A4 ( n22 ) , .ZN ( input_data_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( state[2] ) , .ZN ( n36 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U62 ( .A1 ( HFSNET_1 ) , .A2 ( n36 ) , 
    .ZN ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U63 ( .A1 ( state[1] ) , .A2 ( n28 ) , 
    .A3 ( n32 ) , .ZN ( read_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U64 ( .A1 ( state[0] ) , .A2 ( n23 ) , 
    .A3 ( n32 ) , .ZN ( write_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U65 ( .A1 ( n23 ) , .A2 ( n28 ) , 
    .A3 ( n32 ) , .ZN ( copy_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U66 ( .A1 ( read_data_val ) , .A2 ( n28 ) , 
    .B ( state[1] ) , .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U67 ( .A1 ( mem_rdy ) , 
    .A2 ( mem_inst_in_val ) , .ZN ( n40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U68 ( .A1 ( n40 ) , .A2 ( mem_inst_in[15] ) , 
    .B ( HFSNET_1 ) , .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U69 ( .A1 ( mem_itf_rdy ) , .A2 ( n24 ) , 
    .B ( n29 ) , .ZN ( n35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U70 ( .A1 ( n25 ) , .A2 ( n36 ) , 
    .B ( n35 ) , .ZN ( n37 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U71 ( .I ( mem_inst_in[13] ) , .ZN ( n93 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U72 ( .A1 ( mem_inst_in[14] ) , .A2 ( n93 ) , 
    .ZN ( n58 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U73 ( .A1 ( mem_rdy ) , .A2 ( n58 ) , 
    .B1 ( state[1] ) , .B2 ( n36 ) , .ZN ( n27 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U74 ( .A1 ( n37 ) , .A2 ( HFSNET_1 ) , 
    .ZN ( n26 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U75 ( .A1 ( n37 ) , .A2 ( n28 ) , 
    .B1 ( n27 ) , .B2 ( n26 ) , .ZN ( n150 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U77 ( .I ( mem_inst_in[2] ) , .ZN ( n170 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U81 ( .A1 ( n36 ) , .A2 ( state[1] ) , 
    .A3 ( n35 ) , .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U82 ( .I ( mem_inst_in[14] ) , .ZN ( n92 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U83 ( .A1 ( mem_inst_in[13] ) , .A2 ( n92 ) , 
    .ZN ( n73 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U84 ( .A1 ( mem_rdy ) , .A2 ( HFSNET_1 ) , 
    .A3 ( n37 ) , .A4 ( n73 ) , .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U85 ( .A1 ( n39 ) , .A2 ( n38 ) , 
    .ZN ( n147 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U86 ( .I ( n40 ) , .ZN ( n41 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U87 ( .A1 ( n41 ) , .A2 ( mem_inst_in[15] ) , 
    .ZN ( n91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U89 ( .I ( n42 ) , .ZN ( n56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U90 ( .A1 ( rst_n ) , .A2 ( n56 ) , 
    .ZN ( n55 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( n56 ) , .A2 ( src_addr[0] ) , 
    .B1 ( mem_inst_in[0] ) , .B2 ( n55 ) , .ZN ( n43 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U92 ( .I ( n43 ) , .ZN ( n146 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( n56 ) , .A2 ( src_addr[12] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[12] ) , .ZN ( n44 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n44 ) , .ZN ( n145 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U95 ( .A1 ( n56 ) , .A2 ( src_addr[11] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[11] ) , .ZN ( n45 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U96 ( .I ( n45 ) , .ZN ( n144 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U97 ( .A1 ( n56 ) , .A2 ( src_addr[10] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[10] ) , .ZN ( n46 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n46 ) , .ZN ( n143 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U99 ( .A1 ( n56 ) , .A2 ( src_addr[9] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[9] ) , .ZN ( n47 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U100 ( .I ( n47 ) , .ZN ( n142 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U101 ( .A1 ( n56 ) , .A2 ( src_addr[8] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[8] ) , .ZN ( n48 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( n48 ) , .ZN ( n141 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U103 ( .A1 ( n56 ) , .A2 ( src_addr[7] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[7] ) , .ZN ( n49 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n49 ) , .ZN ( n140 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( n56 ) , .A2 ( src_addr[6] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[6] ) , .ZN ( n50 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U106 ( .I ( n50 ) , .ZN ( n139 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U107 ( .A1 ( n56 ) , .A2 ( src_addr[5] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[5] ) , .ZN ( n51 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U108 ( .I ( n51 ) , .ZN ( n138 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U109 ( .A1 ( n11 ) , .A2 ( src_addr[4] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[4] ) , .ZN ( n52 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U110 ( .I ( n52 ) , .ZN ( n137 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( n11 ) , .A2 ( src_addr[3] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[3] ) , .ZN ( n53 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U112 ( .I ( n53 ) , .ZN ( n136 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( n11 ) , .A2 ( src_addr[2] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[2] ) , .ZN ( n54 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n54 ) , .ZN ( n135 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( n11 ) , .A2 ( src_addr[1] ) , 
    .B1 ( n55 ) , .B2 ( mem_inst_in[1] ) , .ZN ( n57 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( n57 ) , .ZN ( n134 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U117 ( .I ( mem_inst_in[0] ) , .ZN ( n96 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_2 U118 ( .A1 ( n58 ) , .A2 ( n91 ) , 
    .B ( HFSNET_1 ) , .ZN ( n71 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U119 ( .A1 ( HFSNET_1 ) , .A2 ( n71 ) , 
    .ZN ( n72 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U120 ( .I ( src_addr[13] ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U121 ( .A1 ( n96 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n59 ) , .ZN ( n133 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U122 ( .I ( mem_inst_in[11] ) , .ZN ( n152 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U123 ( .A1 ( n152 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n60 ) , .ZN ( n132 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U124 ( .I ( mem_inst_in[10] ) , .ZN ( n154 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U125 ( .A1 ( n154 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n61 ) , .ZN ( n131 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U126 ( .I ( mem_inst_in[9] ) , .ZN ( n156 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U127 ( .I ( src_addr[22] ) , .ZN ( n62 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U128 ( .A1 ( n156 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n62 ) , .ZN ( n130 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U129 ( .I ( mem_inst_in[8] ) , .ZN ( n158 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U130 ( .I ( src_addr[21] ) , .ZN ( n63 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U131 ( .A1 ( n158 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n63 ) , .ZN ( n129 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U132 ( .I ( mem_inst_in[7] ) , .ZN ( n160 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U133 ( .I ( src_addr[20] ) , .ZN ( n64 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U134 ( .A1 ( n160 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n64 ) , .ZN ( n128 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U135 ( .I ( mem_inst_in[6] ) , .ZN ( n162 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U136 ( .I ( src_addr[19] ) , .ZN ( n65 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U137 ( .A1 ( n162 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n65 ) , .ZN ( n127 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U138 ( .I ( mem_inst_in[5] ) , .ZN ( n164 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U139 ( .I ( src_addr[18] ) , .ZN ( n66 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U140 ( .A1 ( n164 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n66 ) , .ZN ( n126 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U141 ( .I ( mem_inst_in[4] ) , .ZN ( n166 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U142 ( .I ( src_addr[17] ) , .ZN ( n67 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U143 ( .A1 ( n71 ) , .A2 ( n67 ) , 
    .B1 ( n72 ) , .B2 ( n166 ) , .ZN ( n125 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U144 ( .I ( mem_inst_in[3] ) , .ZN ( n168 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U145 ( .I ( src_addr[16] ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U146 ( .A1 ( n168 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n68 ) , .ZN ( n124 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U147 ( .I ( src_addr[15] ) , .ZN ( n69 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U148 ( .A1 ( n170 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n69 ) , .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U149 ( .I ( mem_inst_in[1] ) , .ZN ( n174 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U150 ( .I ( src_addr[14] ) , .ZN ( n70 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U151 ( .A1 ( n174 ) , .A2 ( n72 ) , 
    .B1 ( n71 ) , .B2 ( n70 ) , .ZN ( n122 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U152 ( .A1 ( n73 ) , .A2 ( n91 ) , 
    .B ( HFSNET_1 ) , .ZN ( n74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U153 ( .I ( n74 ) , .ZN ( n88 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U154 ( .A1 ( rst_n ) , .A2 ( n88 ) , 
    .ZN ( n89 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U155 ( .A1 ( mem_inst_in[0] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[0] ) , .ZN ( n76 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U156 ( .I ( n76 ) , .ZN ( n121 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U157 ( .A1 ( mem_inst_in[12] ) , 
    .A2 ( n89 ) , .B1 ( n88 ) , .B2 ( dst_addr[12] ) , .ZN ( n77 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U158 ( .I ( n77 ) , .ZN ( n120 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U159 ( .A1 ( mem_inst_in[11] ) , 
    .A2 ( n89 ) , .B1 ( n88 ) , .B2 ( dst_addr[11] ) , .ZN ( n78 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U160 ( .I ( n78 ) , .ZN ( n119 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U161 ( .A1 ( mem_inst_in[10] ) , 
    .A2 ( n89 ) , .B1 ( n88 ) , .B2 ( dst_addr[10] ) , .ZN ( n79 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U162 ( .I ( n79 ) , .ZN ( n118 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U163 ( .A1 ( mem_inst_in[9] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[9] ) , .ZN ( n80 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U164 ( .I ( n80 ) , .ZN ( n117 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U165 ( .A1 ( mem_inst_in[8] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[8] ) , .ZN ( n81 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U166 ( .I ( n81 ) , .ZN ( n116 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U167 ( .A1 ( mem_inst_in[7] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[7] ) , .ZN ( n82 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U168 ( .I ( n82 ) , .ZN ( n115 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U169 ( .A1 ( mem_inst_in[6] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[6] ) , .ZN ( n83 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U170 ( .I ( n83 ) , .ZN ( n114 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U171 ( .A1 ( mem_inst_in[5] ) , .A2 ( n89 ) , 
    .B1 ( n88 ) , .B2 ( dst_addr[5] ) , .ZN ( n84 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U172 ( .I ( n84 ) , .ZN ( n113 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U173 ( .A1 ( mem_inst_in[4] ) , .A2 ( n89 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[4] ) , .ZN ( n85 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U174 ( .I ( n85 ) , .ZN ( n112 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U175 ( .A1 ( mem_inst_in[3] ) , .A2 ( n89 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[3] ) , .ZN ( n86 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U176 ( .I ( n86 ) , .ZN ( n111 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U177 ( .A1 ( mem_inst_in[2] ) , .A2 ( n89 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[2] ) , .ZN ( n87 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U178 ( .I ( n87 ) , .ZN ( n110 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U179 ( .A1 ( mem_inst_in[1] ) , .A2 ( n89 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[1] ) , .ZN ( n90 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U180 ( .I ( n90 ) , .ZN ( n109 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U182 ( .A1 ( HFSNET_1 ) , .A2 ( n172 ) , 
    .ZN ( n173 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U183 ( .I ( dst_addr[13] ) , .ZN ( n95 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U184 ( .A1 ( n96 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n95 ) , .ZN ( n108 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U185 ( .I ( dst_addr[24] ) , .ZN ( n151 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U186 ( .A1 ( n152 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n151 ) , .ZN ( n107 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U187 ( .I ( dst_addr[23] ) , .ZN ( n153 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U188 ( .A1 ( n154 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n153 ) , .ZN ( n106 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U189 ( .I ( dst_addr[22] ) , .ZN ( n155 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U190 ( .A1 ( n156 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n155 ) , .ZN ( n105 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U191 ( .I ( dst_addr[21] ) , .ZN ( n157 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U192 ( .A1 ( n158 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n157 ) , .ZN ( n104 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U193 ( .I ( dst_addr[20] ) , .ZN ( n159 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U194 ( .A1 ( n160 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n159 ) , .ZN ( n103 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U195 ( .I ( dst_addr[19] ) , .ZN ( n161 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U196 ( .A1 ( n162 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n161 ) , .ZN ( n102 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U197 ( .I ( dst_addr[18] ) , .ZN ( n163 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U198 ( .A1 ( n164 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n163 ) , .ZN ( n101 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U199 ( .I ( dst_addr[17] ) , .ZN ( n165 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U200 ( .A1 ( n166 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n165 ) , .ZN ( n100 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U201 ( .I ( dst_addr[16] ) , .ZN ( n167 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U202 ( .A1 ( n168 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n167 ) , .ZN ( n99 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U203 ( .I ( dst_addr[15] ) , .ZN ( n169 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U204 ( .A1 ( n170 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n169 ) , .ZN ( n98 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U205 ( .I ( dst_addr[14] ) , .ZN ( n171 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U206 ( .A1 ( n174 ) , .A2 ( n173 ) , 
    .B1 ( n172 ) , .B2 ( n171 ) , .ZN ( n97 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
endmodule


module decoder ( rst_n , inst_in , inst_in_val , core_rdy , mem_rdy , 
    exe_rdy , mem_inst_out , mem_inst_out_val , exe_inst_out , 
    exe_inst_out_val , VPWR , VGND , HFSNET_0 ) ;
input  rst_n ;
input  [15:0] inst_in ;
input  inst_in_val ;
output core_rdy ;
input  mem_rdy ;
input  exe_rdy ;
output [15:0] mem_inst_out ;
output mem_inst_out_val ;
output [8:0] exe_inst_out ;
output exe_inst_out_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_0 ;

wire tmp_net31 ;
wire tmp_net68 ;
wire tmp_net69 ;
wire tmp_net70 ;
wire tmp_net71 ;
wire n3 ;
wire n4 ;
wire n5 ;
wire n6 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
supply1 VPWR ;
supply0 VGND ;

assign mem_inst_out[8] = inst_in[8] ;
assign mem_inst_out[7] = inst_in[7] ;
assign mem_inst_out[6] = inst_in[6] ;
assign mem_inst_out[5] = inst_in[5] ;
assign mem_inst_out[4] = inst_in[4] ;
assign mem_inst_out[3] = inst_in[3] ;
assign mem_inst_out[2] = inst_in[2] ;
assign mem_inst_out[1] = inst_in[1] ;
assign mem_inst_out[0] = inst_in[0] ;

gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_1_43 ( .I ( inst_in[14] ) , 
    .ZN ( tmp_net31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or4_1 ctmTdsLR_2_44 ( .A1 ( mem_inst_out[15] ) , 
    .A2 ( tmp_net31 ) , .A3 ( inst_in[13] ) , .A4 ( inst_in[12] ) , 
    .Z ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_1_172 ( .I ( tmp_net71 ) , 
    .ZN ( core_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or3_1 ctmTdsLR_2_173 ( .A1 ( n5 ) , 
    .A2 ( tmp_net70 ) , .A3 ( rst_n ) , .Z ( tmp_net71 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_3_174 ( .A1 ( mem_rdy ) , 
    .A2 ( inst_in[9] ) , .B ( tmp_net69 ) , .ZN ( tmp_net70 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_175 ( .A1 ( tmp_net68 ) , 
    .A2 ( n6 ) , .ZN ( tmp_net69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_5_176 ( .A1 ( n3 ) , .A2 ( n20 ) , 
    .ZN ( tmp_net68 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( inst_in[15] ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( inst_in[11] ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .ZN ( mem_inst_out[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( inst_in[10] ) , .ZN ( n19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U20 ( .A1 ( n19 ) , .A2 ( n9 ) , 
    .ZN ( exe_inst_out[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( inst_in[9] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U22 ( .A1 ( n18 ) , .A2 ( n9 ) , 
    .ZN ( exe_inst_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U23 ( .A1 ( exe_inst_out[8] ) , 
    .A2 ( exe_inst_out[7] ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U24 ( .A1 ( n17 ) , .A2 ( mem_inst_out[1] ) , 
    .Z ( exe_inst_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U25 ( .A1 ( n17 ) , .A2 ( mem_inst_out[0] ) , 
    .Z ( exe_inst_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U26 ( .A1 ( inst_in[14] ) , 
    .A2 ( inst_in[13] ) , .A3 ( inst_in[12] ) , .A4 ( n19 ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U28 ( .A1 ( inst_in[15] ) , .A2 ( exe_rdy ) , 
    .B ( n18 ) , .ZN ( n6 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U30 ( .A1 ( inst_in[14] ) , 
    .A2 ( inst_in[13] ) , .A3 ( inst_in[12] ) , .A4 ( inst_in[11] ) , 
    .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U31 ( .A1 ( inst_in[15] ) , .A2 ( n4 ) , 
    .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U32 ( .A1 ( mem_rdy ) , .A2 ( n15 ) , 
    .B1 ( exe_rdy ) , .B2 ( n9 ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( exe_rdy ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U34 ( .A1 ( inst_in_val ) , 
    .A2 ( HFSNET_0 ) , .ZN ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U35 ( .A1 ( n10 ) , .A2 ( n9 ) , .A3 ( n13 ) , 
    .ZN ( exe_inst_out_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( inst_in[13] ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U37 ( .A1 ( inst_in[15] ) , .A2 ( n11 ) , 
    .B1 ( n18 ) , .B2 ( n21 ) , .ZN ( mem_inst_out[13] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( inst_in[14] ) , .ZN ( n12 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U39 ( .A1 ( inst_in[15] ) , .A2 ( n12 ) , 
    .B1 ( n19 ) , .B2 ( n21 ) , .ZN ( mem_inst_out[14] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( mem_rdy ) , .ZN ( n14 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U41 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .A3 ( n13 ) , .ZN ( mem_inst_out_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U42 ( .A1 ( n17 ) , .A2 ( mem_inst_out[2] ) , 
    .Z ( exe_inst_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U43 ( .A1 ( exe_inst_out[7] ) , .A2 ( n19 ) , 
    .ZN ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U44 ( .A1 ( mem_inst_out[3] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U45 ( .A1 ( mem_inst_out[4] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U46 ( .A1 ( mem_inst_out[5] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U47 ( .A1 ( n17 ) , .A2 ( mem_inst_out[6] ) , 
    .Z ( exe_inst_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U48 ( .A1 ( n18 ) , .A2 ( n21 ) , 
    .ZN ( mem_inst_out[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n21 ) , .A2 ( n19 ) , 
    .ZN ( mem_inst_out[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .ZN ( mem_inst_out[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U51 ( .A1 ( inst_in[15] ) , 
    .A2 ( inst_in[12] ) , .Z ( mem_inst_out[12] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
endmodule


module inst_fifo_WORD_WIDTH16 ( clk , rst_n , inst , inst_val , fifo_rdy , 
    core_rdy , inst_out , inst_out_val , VPWR , VGND , ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
input  [15:0] inst ;
input  inst_val ;
output fifo_rdy ;
input  core_rdy ;
output [15:0] inst_out ;
output inst_out_val ;
input  VPWR ;
input  VGND ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;

wire count_0_ ;
wire n6 ;
wire n7 ;
wire n8 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n3 ;
wire n4 ;
wire n23 ;
wire n24 ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net67 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 count_reg_0_ ( .D ( n22 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( count_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__0_ ( .D ( n21 ) , .CLK ( clk ) , 
    .Q ( inst_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__1_ ( .D ( n20 ) , .CLK ( clk ) , 
    .Q ( inst_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__2_ ( .D ( n19 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__3_ ( .D ( n18 ) , .CLK ( clk ) , 
    .Q ( inst_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__4_ ( .D ( n17 ) , .CLK ( clk ) , 
    .Q ( inst_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__5_ ( .D ( n16 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__6_ ( .D ( n15 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__7_ ( .D ( n14 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__8_ ( .D ( n13 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__9_ ( .D ( n12 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst_out[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__10_ ( .D ( n11 ) , .CLK ( clk ) , 
    .Q ( inst_out[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__11_ ( .D ( n10 ) , .CLK ( clk ) , 
    .Q ( inst_out[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__12_ ( .D ( n9 ) , .CLK ( clk ) , 
    .Q ( inst_out[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__13_ ( .D ( n8 ) , .CLK ( clk ) , 
    .Q ( inst_out[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__14_ ( .D ( n7 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__15_ ( .D ( n6 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_2 ctmTdsLR_1_170 ( .A1 ( n4 ) , 
    .A2 ( tmp_net67 ) , .Z ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_171 ( .I ( inst_val ) , 
    .ZN ( tmp_net67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( count_0_ ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U6 ( .A1 ( rst_n ) , .A2 ( n3 ) , 
    .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U7 ( .A1 ( inst_val ) , .A2 ( n4 ) , 
    .ZN ( fifo_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U8 ( .A1 ( count_0_ ) , .A2 ( rst_n ) , 
    .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U11 ( .A1 ( core_rdy ) , .A2 ( n23 ) , 
    .B ( n24 ) , .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( n23 ) , .ZN ( inst_out_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U13 ( .I0 ( inst[0] ) , .I1 ( inst_out[0] ) , 
    .S ( n24 ) , .Z ( n21 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U14 ( .I0 ( inst[1] ) , .I1 ( inst_out[1] ) , 
    .S ( n24 ) , .Z ( n20 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U15 ( .I0 ( inst[2] ) , .I1 ( inst_out[2] ) , 
    .S ( n24 ) , .Z ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U16 ( .I0 ( inst[3] ) , .I1 ( inst_out[3] ) , 
    .S ( n24 ) , .Z ( n18 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U17 ( .I0 ( inst[4] ) , .I1 ( inst_out[4] ) , 
    .S ( n24 ) , .Z ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U18 ( .I0 ( inst[5] ) , .I1 ( inst_out[5] ) , 
    .S ( n24 ) , .Z ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U19 ( .I0 ( inst[6] ) , .I1 ( inst_out[6] ) , 
    .S ( n24 ) , .Z ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U20 ( .I0 ( inst[7] ) , .I1 ( inst_out[7] ) , 
    .S ( n24 ) , .Z ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U21 ( .I0 ( inst[8] ) , .I1 ( inst_out[8] ) , 
    .S ( n24 ) , .Z ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U22 ( .I0 ( inst[9] ) , .I1 ( inst_out[9] ) , 
    .S ( n24 ) , .Z ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U23 ( .I0 ( inst[10] ) , 
    .I1 ( inst_out[10] ) , .S ( n24 ) , .Z ( n11 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U24 ( .I0 ( inst[11] ) , 
    .I1 ( inst_out[11] ) , .S ( n24 ) , .Z ( n10 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U25 ( .I0 ( inst[12] ) , 
    .I1 ( inst_out[12] ) , .S ( n24 ) , .Z ( n9 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U26 ( .I0 ( inst[13] ) , 
    .I1 ( inst_out[13] ) , .S ( n24 ) , .Z ( n8 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0 ( inst[14] ) , 
    .I1 ( inst_out[14] ) , .S ( n24 ) , .Z ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0 ( inst[15] ) , 
    .I1 ( inst_out[15] ) , .S ( n24 ) , .Z ( n6 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
endmodule


module uart_tx ( clk , rst_n , inst_fifo_rdy , tx , VPWR , VGND , HFSNET_0 ) ;
input  clk ;
input  rst_n ;
input  inst_fifo_rdy ;
output tx ;
input  VPWR ;
input  VGND ;
input  HFSNET_0 ;

wire state ;
wire ready_sent ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire n49 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n1 ;
wire n2 ;
wire n3 ;
wire n4 ;
wire n5 ;
wire n6 ;
wire n7 ;
wire n8 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n16 ;
wire n17 ;
wire n19 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n25 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n32 ;
wire n33 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire n60 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire tmp_net65 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire [3:0] bit_idx ;
wire [6:0] clk_cnt ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net86 ;
wire tmp_net87 ;
wire tmp_net88 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_0_ ( .D ( n53 ) , .CLK ( clk ) , 
    .Q ( bit_idx[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg ( .D ( n41 ) , .CLK ( clk ) , 
    .Q ( state ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 ready_sent_reg ( .D ( n52 ) , .CLK ( clk ) , 
    .Q ( ready_sent ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_6_ ( .D ( n42 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_0_ ( .D ( n48 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_1_ ( .D ( n47 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_2_ ( .D ( n46 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_3_ ( .D ( n45 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_4_ ( .D ( n44 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_5_ ( .D ( n43 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_1_ ( .D ( n51 ) , .CLK ( clk ) , 
    .Q ( bit_idx[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_2_ ( .D ( n50 ) , .CLK ( clk ) , 
    .Q ( bit_idx[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_3_ ( .D ( n49 ) , .CLK ( clk ) , 
    .Q ( bit_idx[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I ( bit_idx[2] ) , .ZN ( n17 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( bit_idx[1] ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U5 ( .A1 ( bit_idx[0] ) , .A2 ( n17 ) , 
    .A3 ( n10 ) , .ZN ( n62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U6 ( .A1 ( state ) , .A2 ( n62 ) , 
    .ZN ( tx ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_167 ( .A1 ( n19 ) , 
    .A2 ( tmp_net65 ) , .A3 ( state ) , .ZN ( n8 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U9 ( .A1 ( HFSNET_0 ) , .A2 ( state ) , 
    .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U10 ( .I ( inst_fifo_rdy ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U11 ( .A1 ( n1 ) , .A2 ( ready_sent ) , 
    .B ( HFSNET_0 ) , .ZN ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( bit_idx[3] ) , .ZN ( n64 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U13 ( .I ( clk_cnt[4] ) , .ZN ( n36 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U14 ( .I ( clk_cnt[5] ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U15 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( clk_cnt[6] ) , .A4 ( n55 ) , .ZN ( n2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U16 ( .A1 ( clk_cnt[3] ) , 
    .A2 ( clk_cnt[0] ) , .A3 ( n36 ) , .A4 ( n2 ) , .ZN ( n19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_197 ( .A1 ( n54 ) , 
    .A2 ( tmp_net86 ) , .ZN ( tmp_net87 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( n8 ) , .ZN ( n3 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U19 ( .A1 ( n34 ) , .A2 ( n65 ) , .B ( n3 ) , 
    .ZN ( n7 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U20 ( .A1 ( bit_idx[0] ) , .A2 ( n34 ) , 
    .ZN ( n6 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U21 ( .A1 ( bit_idx[0] ) , .A2 ( n7 ) , 
    .B1 ( n3 ) , .B2 ( n6 ) , .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( n4 ) , .ZN ( n53 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U23 ( .I ( state ) , .ZN ( n67 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U24 ( .A1 ( n67 ) , .A2 ( ready_sent ) , 
    .B ( HFSNET_0 ) , .C ( inst_fifo_rdy ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U25 ( .I ( n5 ) , .ZN ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U26 ( .A1 ( n7 ) , .A2 ( n6 ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U27 ( .A1 ( n34 ) , .A2 ( n8 ) , .ZN ( n12 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U28 ( .A1 ( bit_idx[0] ) , .A2 ( n12 ) , 
    .A3 ( n10 ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U29 ( .A1 ( n11 ) , .A2 ( n10 ) , .B ( n9 ) , 
    .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U30 ( .A1 ( n34 ) , .A2 ( bit_idx[1] ) , 
    .B ( n11 ) , .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U31 ( .I ( n14 ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U32 ( .A1 ( bit_idx[1] ) , 
    .A2 ( bit_idx[0] ) , .A3 ( n12 ) , .ZN ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U33 ( .A1 ( n13 ) , .A2 ( bit_idx[2] ) , 
    .B1 ( n16 ) , .B2 ( n17 ) , .ZN ( n50 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U34 ( .I ( n34 ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U35 ( .A1 ( n58 ) , .A2 ( n17 ) , 
    .B ( n14 ) , .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U36 ( .A1 ( bit_idx[3] ) , .A2 ( n17 ) , 
    .A3 ( n16 ) , .B1 ( n15 ) , .B2 ( n64 ) , .ZN ( n49 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U37 ( .A1 ( HFSNET_0 ) , .A2 ( n67 ) , 
    .ZN ( n37 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U38 ( .I ( clk_cnt[0] ) , .ZN ( n22 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U39 ( .I ( n19 ) , .ZN ( n63 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U40 ( .A1 ( n63 ) , .A2 ( n58 ) , 
    .ZN ( n40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U41 ( .I ( n40 ) , .ZN ( n56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U42 ( .A1 ( n56 ) , .A2 ( n22 ) , 
    .ZN ( n20 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U43 ( .A1 ( n37 ) , .A2 ( n22 ) , 
    .B ( n20 ) , .ZN ( n48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U44 ( .A1 ( n37 ) , .A2 ( n20 ) , 
    .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U45 ( .I ( n23 ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U46 ( .I ( clk_cnt[1] ) , .ZN ( n24 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U47 ( .A1 ( clk_cnt[1] ) , .A2 ( n34 ) , 
    .A3 ( n22 ) , .B1 ( n21 ) , .B2 ( n24 ) , .ZN ( n47 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U48 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[0] ) , .ZN ( n26 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U49 ( .A1 ( n58 ) , .A2 ( n24 ) , 
    .B ( n23 ) , .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U50 ( .I ( clk_cnt[2] ) , .ZN ( n27 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U51 ( .A1 ( clk_cnt[2] ) , .A2 ( n34 ) , 
    .A3 ( n26 ) , .B1 ( n25 ) , .B2 ( n27 ) , .ZN ( n46 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U52 ( .A1 ( n27 ) , .A2 ( n26 ) , 
    .ZN ( n30 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U53 ( .I ( n30 ) , .ZN ( n29 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U54 ( .A1 ( n40 ) , .A2 ( n30 ) , 
    .B ( n37 ) , .ZN ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U55 ( .I ( n31 ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U56 ( .I ( clk_cnt[3] ) , .ZN ( n32 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U57 ( .A1 ( clk_cnt[3] ) , .A2 ( n40 ) , 
    .A3 ( n29 ) , .B1 ( n28 ) , .B2 ( n32 ) , .ZN ( n45 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U58 ( .A1 ( clk_cnt[3] ) , .A2 ( n30 ) , 
    .ZN ( n35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U59 ( .A1 ( n56 ) , .A2 ( n32 ) , 
    .B ( n31 ) , .ZN ( n33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U60 ( .A1 ( clk_cnt[4] ) , .A2 ( n34 ) , 
    .A3 ( n35 ) , .B1 ( n33 ) , .B2 ( n36 ) , .ZN ( n44 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U61 ( .A1 ( n35 ) , .A2 ( n36 ) , 
    .ZN ( n57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U62 ( .I ( n57 ) , .ZN ( n39 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U63 ( .A1 ( n57 ) , .A2 ( n40 ) , 
    .B ( n37 ) , .ZN ( n54 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U64 ( .I ( n54 ) , .ZN ( n38 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U65 ( .A1 ( clk_cnt[5] ) , .A2 ( n40 ) , 
    .A3 ( n39 ) , .B1 ( n38 ) , .B2 ( n55 ) , .ZN ( n43 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_3_169_roptpi_223 ( .A1 ( n62 ) , 
    .A2 ( n64 ) , .Z ( tmp_net65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U67 ( .A1 ( n58 ) , .A2 ( clk_cnt[5] ) , 
    .A3 ( n57 ) , .ZN ( n60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U68 ( .I ( clk_cnt[6] ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( tmp_net87 ) , .A2 ( tmp_net88 ) , 
    .B1 ( n60 ) , .B2 ( n59 ) , .ZN ( n42 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U70 ( .A1 ( n64 ) , .A2 ( n63 ) , 
    .A3 ( n62 ) , .ZN ( n69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U71 ( .I ( n65 ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U72 ( .A1 ( n69 ) , .A2 ( state ) , 
    .B1 ( n68 ) , .B2 ( n67 ) , .C ( rst_n ) , .ZN ( n41 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_198 ( .I ( clk_cnt[6] ) , 
    .ZN ( tmp_net86 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_199 ( .A1 ( n56 ) , .A2 ( n55 ) , 
    .ZN ( tmp_net88 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module uart_rx_WORD_WIDTH16 ( clk , rst_n , inst , inst_val , rx , VPWR , 
    VGND , HFSNET_3 , ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
output [15:0] inst ;
output inst_val ;
input  rx ;
input  VPWR ;
input  VGND ;
input  HFSNET_3 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;

wire rx_sync ;
wire byte_idx_0_ ;
wire rx_meta ;
wire N143 ;
wire N144 ;
wire n75 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81 ;
wire n82 ;
wire n83 ;
wire n84 ;
wire n85 ;
wire n86 ;
wire n87 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n94 ;
wire n95 ;
wire n96 ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n100 ;
wire n101 ;
wire n102 ;
wire n103 ;
wire n104 ;
wire n105 ;
wire HFSNET_2 ;
wire n4 ;
wire n5 ;
wire n6 ;
wire n7 ;
wire n9 ;
wire n10 ;
wire n11 ;
wire n12 ;
wire n13 ;
wire n14 ;
wire n15 ;
wire n17 ;
wire n18 ;
wire tmp_net80 ;
wire n20 ;
wire n21 ;
wire n22 ;
wire n23 ;
wire n24 ;
wire n26 ;
wire n27 ;
wire n28 ;
wire n29 ;
wire n30 ;
wire n31 ;
wire n32 ;
wire n33 ;
wire n34 ;
wire n35 ;
wire n36 ;
wire n37 ;
wire n38 ;
wire n39 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n48 ;
wire n49 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire n60 ;
wire n61 ;
wire tmp_net81 ;
wire n63 ;
wire n64 ;
wire n65 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire n69 ;
wire n70 ;
wire n71 ;
wire n72 ;
wire n73 ;
wire n74 ;
wire n106 ;
wire n107 ;
wire n108 ;
wire n109 ;
wire n110 ;
wire n111 ;
wire n112 ;
wire n113 ;
wire n114 ;
wire n115 ;
wire n116 ;
wire n117 ;
wire n118 ;
wire n119 ;
wire n120 ;
wire n121 ;
wire n122 ;
wire n123 ;
wire [1:0] state ;
wire [3:0] bit_idx ;
wire [6:0] clk_cnt ;
supply1 VPWR ;
supply0 VGND ;
wire HFSNET_1 ;
wire tmp_net95 ;
wire tmp_net96 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_meta_reg ( .D ( N143 ) , .CLK ( clk ) , 
    .Q ( rx_meta ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_sync_reg ( .D ( N144 ) , .CLK ( clk ) , 
    .Q ( rx_sync ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_0_ ( .D ( n102 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( bit_idx[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n104 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_0_ ( .D ( n98 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_1_ ( .D ( n97 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_2_ ( .D ( n96 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_3_ ( .D ( n95 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_4_ ( .D ( n94 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_5_ ( .D ( n93 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_6_ ( .D ( n92 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_1_ ( .D ( n101 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( bit_idx[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_2_ ( .D ( n100 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( bit_idx[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_3_ ( .D ( n99 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( bit_idx[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n103 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_15_ ( .D ( n76 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_14_ ( .D ( n77 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_13_ ( .D ( n78 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_12_ ( .D ( n79 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_11_ ( .D ( n80 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_10_ ( .D ( n81 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_9_ ( .D ( n82 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_8_ ( .D ( n83 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_7_ ( .D ( n84 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_6_ ( .D ( n85 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_5_ ( .D ( n86 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_4_ ( .D ( n87 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_3_ ( .D ( n88 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_2_ ( .D ( n89 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_1_ ( .D ( n90 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_0_ ( .D ( n91 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 byte_idx_reg_0_ ( .D ( n105 ) , .CLK ( clk ) , 
    .Q ( byte_idx_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_val_reg ( .D ( n75 ) , .CLK ( clk ) , 
    .Q ( inst_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_1_189 ( .A1 ( n17 ) , .A2 ( n44 ) , 
    .B1 ( n15 ) , .B2 ( state[0] ) , .C ( tmp_net81 ) , .ZN ( n26 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_190 ( .A1 ( n14 ) , .A2 ( n18 ) , 
    .B ( tmp_net80 ) , .ZN ( tmp_net81 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_515_25 ( .I ( n117 ) , .Z ( HFSNET_2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_191 ( .I ( state[1] ) , 
    .ZN ( tmp_net80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_1_210 ( .A1 ( n26 ) , .A2 ( n44 ) , 
    .A3 ( state[1] ) , .B ( tmp_net96 ) , .ZN ( n103 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U8 ( .A1 ( HFSNET_3 ) , .A2 ( rx_meta ) , 
    .Z ( N144 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U9 ( .A1 ( HFSNET_3 ) , .A2 ( rx ) , 
    .Z ( N143 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U10 ( .A1 ( bit_idx[2] ) , 
    .A2 ( bit_idx[1] ) , .A3 ( bit_idx[0] ) , .ZN ( n4 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( bit_idx[3] ) , .ZN ( n6 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U12 ( .A1 ( n4 ) , .A2 ( n6 ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U13 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[6] ) , .ZN ( n5 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U14 ( .A1 ( clk_cnt[0] ) , 
    .A2 ( clk_cnt[5] ) , .A3 ( clk_cnt[3] ) , .A4 ( n5 ) , .ZN ( n7 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( bit_idx[2] ) , .ZN ( n39 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( bit_idx[1] ) , .ZN ( n35 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U17 ( .I ( bit_idx[0] ) , .ZN ( n30 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U18 ( .A1 ( n30 ) , .A2 ( n35 ) , 
    .A3 ( n39 ) , .A4 ( n6 ) , .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U19 ( .A1 ( clk_cnt[4] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( n7 ) , .A4 ( n11 ) , .ZN ( n27 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n27 ) , .ZN ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U21 ( .A1 ( n28 ) , .A2 ( n42 ) , 
    .A3 ( rx_sync ) , .ZN ( n121 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U22 ( .A1 ( state[1] ) , .A2 ( n121 ) , 
    .ZN ( n20 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U23 ( .A1 ( rst_n ) , .A2 ( n20 ) , 
    .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( HFSNET_3 ) , .A2 ( state[1] ) , 
    .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( n123 ) , .A2 ( state[0] ) , 
    .ZN ( n119 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U26 ( .I ( n119 ) , .ZN ( n43 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U27 ( .A1 ( state[0] ) , .A2 ( HFSNET_3 ) , 
    .ZN ( n44 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U28 ( .I ( n44 ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U29 ( .A1 ( n10 ) , .A2 ( n58 ) , 
    .B ( byte_idx_0_ ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U30 ( .A1 ( byte_idx_0_ ) , .A2 ( n10 ) , 
    .A3 ( n43 ) , .B ( n9 ) , .ZN ( n105 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U31 ( .I ( clk_cnt[0] ) , .ZN ( n46 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U32 ( .A1 ( clk_cnt[5] ) , .A2 ( n46 ) , 
    .ZN ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( n11 ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( clk_cnt[6] ) , .ZN ( n66 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U35 ( .A1 ( clk_cnt[1] ) , .A2 ( n21 ) , 
    .A3 ( clk_cnt[3] ) , .A4 ( n66 ) , .ZN ( n12 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U36 ( .A1 ( clk_cnt[4] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( n13 ) , .A4 ( n12 ) , .ZN ( n41 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U37 ( .I ( state[1] ) , .ZN ( n24 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U38 ( .A1 ( n41 ) , .A2 ( n24 ) , 
    .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U39 ( .I ( rx_sync ) , .ZN ( n15 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U40 ( .A1 ( n29 ) , .A2 ( n15 ) , 
    .B ( HFSNET_3 ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U41 ( .I ( state[0] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U42 ( .A1 ( n28 ) , .A2 ( n42 ) , 
    .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_211 ( .A1 ( n26 ) , 
    .A2 ( tmp_net95 ) , .ZN ( tmp_net96 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_212 ( .I ( n24 ) , 
    .ZN ( tmp_net95 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U45 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .B ( HFSNET_3 ) , .C ( n18 ) , .ZN ( n23 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U46 ( .A1 ( n26 ) , .A2 ( state[0] ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U47 ( .A1 ( n26 ) , .A2 ( n23 ) , 
    .B ( n22 ) , .ZN ( n104 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n28 ) , .A2 ( n27 ) , 
    .ZN ( n69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U51 ( .A1 ( n69 ) , .A2 ( n123 ) , 
    .B ( n44 ) , .ZN ( n117 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U52 ( .A1 ( rx_sync ) , .A2 ( n29 ) , 
    .B ( n117 ) , .ZN ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U53 ( .I ( n31 ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U54 ( .A1 ( n30 ) , .A2 ( n119 ) , 
    .B ( n37 ) , .ZN ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U55 ( .A1 ( n37 ) , .A2 ( n30 ) , 
    .B ( n32 ) , .ZN ( n102 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U56 ( .A1 ( n31 ) , .A2 ( bit_idx[0] ) , 
    .A3 ( n119 ) , .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U57 ( .A1 ( bit_idx[1] ) , .A2 ( n32 ) , 
    .B1 ( n34 ) , .B2 ( n35 ) , .ZN ( n101 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U58 ( .A1 ( n43 ) , .A2 ( bit_idx[1] ) , 
    .B ( n32 ) , .ZN ( n33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U59 ( .I ( n33 ) , .ZN ( n36 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U60 ( .A1 ( n35 ) , .A2 ( n34 ) , .Z ( n40 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U61 ( .A1 ( bit_idx[2] ) , .A2 ( n36 ) , 
    .B1 ( n40 ) , .B2 ( n39 ) , .ZN ( n100 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U62 ( .A1 ( n119 ) , .A2 ( n37 ) , 
    .B ( bit_idx[3] ) , .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U63 ( .A1 ( n40 ) , .A2 ( n39 ) , 
    .B ( n38 ) , .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U66 ( .A1 ( clk_cnt[0] ) , .A2 ( n44 ) , 
    .B1 ( n65 ) , .B2 ( n46 ) , .ZN ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U67 ( .A1 ( HFSNET_1 ) , .A2 ( n46 ) , 
    .B ( n58 ) , .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U68 ( .I ( clk_cnt[1] ) , .ZN ( n47 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U69 ( .A1 ( clk_cnt[1] ) , .A2 ( n46 ) , 
    .A3 ( n65 ) , .B1 ( n45 ) , .B2 ( n47 ) , .ZN ( n97 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U70 ( .A1 ( clk_cnt[0] ) , 
    .A2 ( clk_cnt[1] ) , .ZN ( n49 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U71 ( .A1 ( n47 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n46 ) , .B2 ( HFSNET_1 ) , .C ( n58 ) , .ZN ( n48 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U72 ( .I ( clk_cnt[2] ) , .ZN ( n50 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U73 ( .A1 ( clk_cnt[2] ) , .A2 ( n65 ) , 
    .A3 ( n49 ) , .B1 ( n48 ) , .B2 ( n50 ) , .ZN ( n96 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U74 ( .A1 ( n50 ) , .A2 ( n49 ) , 
    .ZN ( n52 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U75 ( .I ( n52 ) , .ZN ( n53 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U76 ( .A1 ( HFSNET_1 ) , .A2 ( n53 ) , 
    .B ( n58 ) , .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U77 ( .I ( clk_cnt[3] ) , .ZN ( n54 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U78 ( .A1 ( clk_cnt[3] ) , .A2 ( n65 ) , 
    .A3 ( n53 ) , .B1 ( n51 ) , .B2 ( n54 ) , .ZN ( n95 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( clk_cnt[3] ) , .A2 ( n52 ) , 
    .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U80 ( .A1 ( n54 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n53 ) , .B2 ( HFSNET_1 ) , .C ( n58 ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( clk_cnt[4] ) , .ZN ( n57 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U82 ( .A1 ( n65 ) , .A2 ( n56 ) , 
    .A3 ( clk_cnt[4] ) , .B1 ( n55 ) , .B2 ( n57 ) , .ZN ( n94 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U83 ( .A1 ( n57 ) , .A2 ( n56 ) , 
    .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n64 ) , .ZN ( n60 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U85 ( .A1 ( HFSNET_1 ) , .A2 ( n60 ) , 
    .B ( n58 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U86 ( .I ( clk_cnt[5] ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U87 ( .A1 ( clk_cnt[5] ) , .A2 ( n65 ) , 
    .A3 ( n60 ) , .B1 ( n61 ) , .B2 ( n59 ) , .ZN ( n93 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U88 ( .A1 ( n65 ) , .A2 ( clk_cnt[5] ) , 
    .B ( n61 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U89 ( .I ( n63 ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U90 ( .A1 ( clk_cnt[5] ) , .A2 ( HFSNET_1 ) , 
    .A3 ( n64 ) , .ZN ( n67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( clk_cnt[6] ) , .A2 ( n68 ) , 
    .B1 ( n67 ) , .B2 ( n66 ) , .ZN ( n92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U92 ( .A1 ( n119 ) , .A2 ( n69 ) , 
    .Z ( n116 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( inst[1] ) , .A2 ( n116 ) , 
    .B1 ( inst[0] ) , .B2 ( HFSNET_2 ) , .ZN ( n70 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n70 ) , .ZN ( n91 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U95 ( .A1 ( inst[2] ) , .A2 ( n116 ) , 
    .B1 ( inst[1] ) , .B2 ( HFSNET_2 ) , .ZN ( n71 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U96 ( .I ( n71 ) , .ZN ( n90 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U97 ( .A1 ( inst[3] ) , .A2 ( n116 ) , 
    .B1 ( inst[2] ) , .B2 ( HFSNET_2 ) , .ZN ( n72 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n72 ) , .ZN ( n89 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U99 ( .A1 ( inst[4] ) , .A2 ( n116 ) , 
    .B1 ( inst[3] ) , .B2 ( HFSNET_2 ) , .ZN ( n73 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U100 ( .I ( n73 ) , .ZN ( n88 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U101 ( .A1 ( inst[5] ) , .A2 ( n116 ) , 
    .B1 ( inst[4] ) , .B2 ( HFSNET_2 ) , .ZN ( n74 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( n74 ) , .ZN ( n87 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U103 ( .A1 ( inst[6] ) , .A2 ( n116 ) , 
    .B1 ( inst[5] ) , .B2 ( HFSNET_2 ) , .ZN ( n106 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n106 ) , .ZN ( n86 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( inst[7] ) , .A2 ( n116 ) , 
    .B1 ( inst[6] ) , .B2 ( HFSNET_2 ) , .ZN ( n107 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U106 ( .I ( n107 ) , .ZN ( n85 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U107 ( .A1 ( inst[8] ) , .A2 ( n116 ) , 
    .B1 ( inst[7] ) , .B2 ( HFSNET_2 ) , .ZN ( n108 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U108 ( .I ( n108 ) , .ZN ( n84 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U109 ( .A1 ( inst[9] ) , .A2 ( n116 ) , 
    .B1 ( inst[8] ) , .B2 ( HFSNET_2 ) , .ZN ( n109 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U110 ( .I ( n109 ) , .ZN ( n83 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( inst[10] ) , .A2 ( n116 ) , 
    .B1 ( inst[9] ) , .B2 ( HFSNET_2 ) , .ZN ( n110 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U112 ( .I ( n110 ) , .ZN ( n82 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( inst[11] ) , .A2 ( n116 ) , 
    .B1 ( inst[10] ) , .B2 ( HFSNET_2 ) , .ZN ( n111 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n111 ) , .ZN ( n81 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( inst[12] ) , .A2 ( n116 ) , 
    .B1 ( inst[11] ) , .B2 ( HFSNET_2 ) , .ZN ( n112 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( n112 ) , .ZN ( n80 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U117 ( .A1 ( inst[13] ) , .A2 ( n116 ) , 
    .B1 ( inst[12] ) , .B2 ( HFSNET_2 ) , .ZN ( n113 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n113 ) , .ZN ( n79 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U119 ( .A1 ( inst[14] ) , .A2 ( n116 ) , 
    .B1 ( inst[13] ) , .B2 ( HFSNET_2 ) , .ZN ( n114 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U120 ( .I ( n114 ) , .ZN ( n78 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U121 ( .A1 ( inst[15] ) , .A2 ( n116 ) , 
    .B1 ( inst[14] ) , .B2 ( n117 ) , .ZN ( n115 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U122 ( .I ( n115 ) , .ZN ( n77 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U123 ( .A1 ( n117 ) , .A2 ( inst[15] ) , 
    .B1 ( n116 ) , .B2 ( rx_sync ) , .ZN ( n118 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U124 ( .I ( n118 ) , .ZN ( n76 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( inst_val ) , .ZN ( n122 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1 ( n119 ) , .A2 ( byte_idx_0_ ) , 
    .ZN ( n120 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U127 ( .A1 ( n123 ) , .A2 ( n122 ) , 
    .B1 ( n121 ) , .B2 ( n120 ) , .ZN ( n75 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 HFSINV_295_23 ( .I ( n65 ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or3_1 U64 ( .A1 ( n43 ) , .A2 ( n42 ) , .A3 ( n41 ) , 
    .Z ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module tiny_sparse_acc_core ( ui_in , uo_out , uio_in , uio_out , 
    uio_oe , ena , clk , rst_n , VPWR , VGND ) ;
input  [7:0] ui_in ;
output [7:0] uo_out ;
input  [7:0] uio_in ;
output [7:0] uio_out ;
output [7:0] uio_oe ;
input  ena ;
input  clk ;
input  rst_n ;
input  VPWR ;
input  VGND ;

wire ZCTSNET_0 ;
wire ZCTSNET_1 ;
wire ZCTSNET_2 ;
wire ZCTSNET_3 ;
wire ZCTSNET_4 ;
wire ZCTSNET_5 ;
wire optlc_net_103 ;
wire optlc_net_104 ;
wire optlc_net_105 ;
wire rx_inst_val ;
wire fifo_rdy ;
wire host_inst_val ;
wire exe_active ;
wire exe_inst_val ;
wire act_result_val ;
wire mem_rdy ;
wire mem_inst_val ;
wire mem_itf_rdy ;
wire read_en ;
wire write_en ;
wire copy_en ;
wire read_data_val ;
wire weight_data_val ;
wire input_data_val ;
wire vpu_result_val ;
wire qspi_req_val ;
wire qspi_req_rdy ;
wire qspi_req_write ;
wire qspi_read_data_val ;
wire n4 ;
wire n5 ;
wire HFSNET_2 ;
wire HFSNET_1 ;
wire HFSNET_3 ;
wire [1:0] reset_sync ;
wire [15:0] rx_inst ;
wire [15:0] host_inst ;
wire [15:0] mem_inst ;
wire [8:0] exe_inst ;
wire [24:0] src_addr ;
wire [24:0] dst_addr ;
wire [7:0] write_data ;
wire [7:0] read_data ;
wire [7:0] weight_data ;
wire [7:0] input_data ;
wire [7:0] act_result ;
wire [7:0] vpu_result ;
wire [2:0] act_op ;
wire [24:0] qspi_req_addr ;
wire [7:0] qspi_req_data ;
wire [7:0] qspi_read_data ;
supply1 VPWR ;
supply0 VGND ;

uart_rx_WORD_WIDTH16 receiver ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_2 ) , 
    .inst ( rx_inst ) , .inst_val ( rx_inst_val ) , .rx ( ui_in[3] ) , 
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_3 ( HFSNET_3 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_3 ) ) ;
uart_tx transmitter ( .clk ( ZCTSNET_4 ) , .rst_n ( HFSNET_2 ) , 
    .inst_fifo_rdy ( fifo_rdy ) , .tx ( uo_out[4] ) , .VPWR ( VPWR ) , 
    .VGND ( VGND ) , .HFSNET_0 ( HFSNET_3 ) ) ;
inst_fifo_WORD_WIDTH16 fifo ( .clk ( ZCTSNET_1 ) , .rst_n ( HFSNET_3 ) , 
    .inst ( rx_inst ) , .inst_val ( rx_inst_val ) , .fifo_rdy ( fifo_rdy ) , 
    .core_rdy ( uo_out[0] ) , .inst_out ( host_inst ) , 
    .inst_out_val ( host_inst_val ) , .VPWR ( VPWR ) , .VGND ( VGND ) , 
    .ZCTSNET_0 ( ZCTSNET_2 ) , .ZCTSNET_1 ( ZCTSNET_3 ) ) ;
decoder decode ( .rst_n ( HFSNET_2 ) , .inst_in ( host_inst ) , 
    .inst_in_val ( host_inst_val ) , .core_rdy ( uo_out[0] ) , 
    .mem_rdy ( mem_rdy ) , .exe_rdy ( n5 ) , .mem_inst_out ( mem_inst ) , 
    .mem_inst_out_val ( mem_inst_val ) , .exe_inst_out ( exe_inst ) , 
    .exe_inst_out_val ( exe_inst_val ) , .VPWR ( VPWR ) , .VGND ( VGND ) , 
    .HFSNET_0 ( HFSNET_3 ) ) ;
mem_ctrl memory ( .clk ( ZCTSNET_2 ) , .rst_n ( HFSNET_2 ) , 
    .mem_inst_in ( mem_inst ) , .mem_inst_in_val ( mem_inst_val ) , 
    .mem_rdy ( mem_rdy ) , .mem_itf_rdy ( mem_itf_rdy ) , 
    .read_en ( read_en ) , .write_en ( write_en ) , .copy_en ( copy_en ) , 
    .src_addr ( src_addr ) , .dst_addr ( dst_addr ) , 
    .write_data ( write_data ) , .read_data ( read_data ) , 
    .read_data_val ( read_data_val ) , .weight_data ( weight_data ) , 
    .weight_data_val ( weight_data_val ) , .input_data ( input_data ) , 
    .input_data_val ( input_data_val ) , .act_res_in ( act_result ) , 
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_1 ( HFSNET_3 ) , 
    .ZCTSNET_0 ( ZCTSNET_3 ) , .ZCTSNET_1 ( ZCTSNET_4 ) ) ;
vpu compute ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_2 ) , 
    .exe_inst_in ( exe_inst ) , .exe_inst_in_val ( exe_inst_val ) , 
    .weight_data ( weight_data ) , .weight_data_val ( weight_data_val ) , 
    .input_data ( input_data ) , .input_data_val ( input_data_val ) , 
    .vpu_res_out ( vpu_result ) , .act_op_out ( act_op ) , 
    .vpu_res_out_val ( vpu_result_val ) , .VPWR ( VPWR ) , .VGND ( VGND ) , 
    .HFSNET_20 ( HFSNET_3 ) , .ZCTSNET_0 ( ZCTSNET_1 ) ) ;
act activation ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_3 ) , 
    .vpu_res_in ( vpu_result ) , .act_op_in ( act_op ) , 
    .vpu_res_in_val ( vpu_result_val ) , .act_res_out ( act_result ) , 
    .act_res_out_val ( act_result_val ) , .VPWR ( VPWR ) , .VGND ( VGND ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_2 ) ) ;
mem_itf itf ( .clk ( ZCTSNET_2 ) , .rst_n ( HFSNET_2 ) , 
    .read_en ( read_en ) , .write_en ( write_en ) , .copy_en ( copy_en ) , 
    .rdy ( mem_itf_rdy ) , .src_addr ( src_addr ) , .dst_addr ( dst_addr ) , 
    .write_data ( write_data ) , .read_data ( read_data ) , 
    .read_data_val ( read_data_val ) , .qspi_req_val ( qspi_req_val ) , 
    .qspi_req_rdy ( qspi_req_rdy ) , .qspi_req_write ( qspi_req_write ) , 
    .qspi_req_addr ( qspi_req_addr ) , .qspi_req_data ( qspi_req_data ) , 
    .qspi_read_data ( qspi_read_data ) , 
    .qspi_read_data_val ( qspi_read_data_val ) , .VPWR ( VPWR ) , 
    .VGND ( VGND ) , .HFSNET_0 ( HFSNET_3 ) ) ;
qspi_ctrl serial_memory ( .clk ( ZCTSNET_2 ) , .rst_n ( HFSNET_2 ) , 
    .req_val ( qspi_req_val ) , .req_rdy ( qspi_req_rdy ) , 
    .req_write ( qspi_req_write ) , .req_addr ( qspi_req_addr ) , 
    .req_data ( qspi_req_data ) , .read_data ( qspi_read_data ) , 
    .read_data_val ( qspi_read_data_val ) , .sck ( uio_out[3] ) , 
    .flash_sc_n ( uio_out[0] ) , .psram_a_sc_n ( uio_out[6] ) , 
    .psram_b_sc_n ( uio_out[7] ) ,
    .dq_in ( { uio_in[5] , uio_in[4] , uio_in[2] , uio_in[1] } ) ,
    .dq_out ( { uio_out[5] , uio_out[4] , uio_out[2] , uio_out[1] } ) ,
    .dq_oe ( { uio_oe[5] , uio_oe[4] , uio_oe[2] , uio_oe[1] } ) ,
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_2 ( HFSNET_3 ) , 
    .ZCTSNET_0 ( ZCTSNET_4 ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_0_ ( .D ( optlc_net_105 ) , 
    .CLK ( ZCTSNET_2 ) , .RN ( rst_n ) , .Q ( reset_sync[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_1_ ( .D ( reset_sync[0] ) , 
    .CLK ( ZCTSNET_0 ) , .RN ( rst_n ) , .Q ( reset_sync[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exe_active_reg ( .D ( n4 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( exe_active ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( optlc_net_103 ) , 
    .ZN ( uio_oe[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( optlc_net_103 ) , 
    .ZN ( uio_oe[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( optlc_net_103 ) , 
    .ZN ( uio_oe[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( optlc_net_103 ) , 
    .ZN ( uio_oe[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( optlc_net_105 ) , 
    .ZN ( uo_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( optlc_net_104 ) , 
    .ZN ( uo_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( optlc_net_104 ) , 
    .ZN ( uo_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( optlc_net_104 ) , 
    .ZN ( uo_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( optlc_net_104 ) , 
    .ZN ( uo_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( optlc_net_104 ) , 
    .ZN ( uo_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_4 HFSINV_1469_29 ( .I ( reset_sync[1] ) , 
    .ZN ( HFSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( exe_active ) , .ZN ( n5 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dlya_4 HFSBUF_1407_30 ( .I ( reset_sync[1] ) , 
    .Z ( HFSNET_3 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_98_7 ( .I ( exe_inst_val ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U25 ( .A1 ( act_result_val ) , 
    .A2 ( HFSNET_1 ) , .B1 ( n5 ) , .B2 ( HFSNET_1 ) , .C ( HFSNET_2 ) , 
    .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_2459_73 ( .I ( clk ) , 
    .Z ( ZCTSNET_0 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_5364_74 ( .I ( clk ) , 
    .Z ( ZCTSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_8256_75 ( .I ( clk ) , 
    .Z ( ZCTSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_13581_76 ( .I ( clk ) , 
    .Z ( ZCTSNET_3 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_12 ZCTSINV_11390_77 ( .I ( ZCTSNET_5 ) , 
    .ZN ( ZCTSNET_4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_8 ZCTSINV_11430_78 ( .I ( clk ) , 
    .ZN ( ZCTSNET_5 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tiel optlc_229 ( .ZN ( optlc_net_103 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_230 ( .Z ( optlc_net_104 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_231 ( .Z ( optlc_net_105 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


