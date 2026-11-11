// IC Compiler II Version Y-2026.03 Verilog Writer
// Generated on 11/11/2026 at 15:46:49
// Library Name: core.ndm
// Block Name: tt_um_tiny_sparse_acc_ramzxc
// User Label: 
// Write Command: write_verilog -exclude { all_physical_cells } /docker/projects/tapeout/tiny-sparse-acc-gf180/pnr/exports/20261111_154647_1794379607968332/core.v
module qspi_ctrl ( clk , rst_n , req_val , req_rdy , req_write , req_addr , 
    req_data , read_data , read_data_val , sck , flash_sc_n , psram_a_sc_n , 
    psram_b_sc_n , dq_in , dq_out , dq_oe , VDD , VSS , HFSNET_2 , ZCTSNET_0 , 
    ZCTSNET_1 , ZCTSNET_2 , ZCTSNET_4 ) ;
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
input  VDD ;
input  VSS ;
input  HFSNET_2 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;
input  ZCTSNET_2 ;
input  ZCTSNET_4 ;

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
wire n49 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire ZCTSNET_3 ;
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
wire n127 ;
wire n129 ;
wire n130 ;
wire n131 ;
wire n133 ;
wire n134 ;
wire n135 ;
wire n136 ;
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
supply1 VDD ;
supply0 VSS ;
wire tmp_net34 ;
wire tmp_net42 ;
wire tmp_net43 ;
wire tmp_net49 ;
wire tmp_net50 ;
wire tmp_net51 ;
wire tmp_net53 ;
wire tmp_net54 ;
wire tmp_net55 ;
wire tmp_net61 ;
wire tmp_net65 ;
wire tmp_net68 ;
wire tmp_net69 ;
wire tmp_net70 ;
wire tmp_net71 ;
wire tmp_net76 ;
wire tmp_net77 ;
wire tmp_net81 ;
wire tmp_net82 ;
wire tmp_net83 ;
wire tmp_net84 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n196 ) , 
    .CLK ( ZCTSNET_3 ) , .Q ( state[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_0_ ( .D ( n205 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( chip[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_reg_reg ( .D ( n204 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( write_reg ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_1_ ( .D ( n200 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( operation[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_2_ ( .D ( n197 ) , 
    .CLK ( ZCTSNET_3 ) , .Q ( state[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n199 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( state[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_2_ ( .D ( n201 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( operation[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_0_ ( .D ( n215 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( status_shift[0] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N318 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_1_ ( .D ( n214 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( status_shift[1] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_0_ ( .D ( n202 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( operation[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_0_ ( .D ( n213 ) , 
    .CLK ( clk ) , .Q ( read_data[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_1_ ( .D ( n212 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_2_ ( .D ( n211 ) , 
    .CLK ( clk ) , .Q ( read_data[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_3_ ( .D ( n210 ) , 
    .CLK ( clk ) , .Q ( read_data[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_4_ ( .D ( n209 ) , 
    .CLK ( clk ) , .Q ( read_data[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_5_ ( .D ( n208 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_6_ ( .D ( n207 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_7_ ( .D ( n206 ) , 
    .CLK ( clk ) , .Q ( read_data[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_3_ ( .D ( n217 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( cycles_left[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_0_ ( .D ( n220 ) , 
    .CLK ( ZCTSNET_3 ) , .Q ( cycles_left[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_1_ ( .D ( n219 ) , 
    .CLK ( ZCTSNET_3 ) , .Q ( cycles_left[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_4_ ( .D ( n216 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( cycles_left[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 cycles_left_reg_2_ ( .D ( n218 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( cycles_left[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 flash_sc_n_reg ( .D ( n195 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( flash_sc_n ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 psram_b_sc_n_reg ( .D ( n221 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( psram_b_sc_n ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 psram_a_sc_n_reg ( .D ( n194 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( psram_a_sc_n ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 sck_reg ( .D ( n222 ) , .CLK ( ZCTSNET_2 ) , 
    .Q ( sck ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_3_ ( .D ( n198 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( state[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_1_ ( .D ( n203 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( chip[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I ( chip[1] ) , .ZN ( n1 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( chip[1] ) , .ZN ( n2 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_33 ( .A1 ( req_addr[4] ) , 
    .A2 ( n57 ) , .B1 ( n56 ) , .B2 ( req_addr[12] ) , .C1 ( n58 ) , 
    .C2 ( req_addr[20] ) , .ZN ( tmp_net34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_2 U6 ( .A1 ( n75 ) , .A2 ( n2 ) , 
    .B1 ( n124 ) , .B2 ( n138 ) , .ZN ( dq_out[1] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_201 ( .A1 ( n163 ) , 
    .A2 ( n155 ) , .B ( tmp_net77 ) , .ZN ( n202 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U8 ( .I ( dq_oe[2] ) , .ZN ( n4 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( n4 ) , .ZN ( dq_oe[0] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( n4 ) , .ZN ( dq_oe[3] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( state[2] ) , .ZN ( n193 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( state[3] ) , .ZN ( n77 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U13 ( .A1 ( n193 ) , .A2 ( n77 ) , 
    .A3 ( state[1] ) , .ZN ( n76 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( state[0] ) , .ZN ( n12 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1 ( n77 ) , .A2 ( state[2] ) , 
    .ZN ( n3 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U16 ( .A1 ( n12 ) , .A2 ( n3 ) , 
    .A3 ( state[1] ) , .ZN ( n18 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U17 ( .A1 ( write_reg ) , .A2 ( n18 ) , 
    .ZN ( n124 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( n3 ) , .ZN ( n83 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U19 ( .A1 ( n12 ) , .A2 ( state[1] ) , 
    .A3 ( n83 ) , .ZN ( n5 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U20 ( .A1 ( n76 ) , .A2 ( n124 ) , 
    .A3 ( n5 ) , .ZN ( dq_oe[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_1_31 ( .A1 ( n1 ) , .A2 ( n76 ) , 
    .Z ( tmp_net33 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U22 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n89 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U23 ( .A1 ( n89 ) , .A2 ( n193 ) , 
    .ZN ( n79 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U24 ( .A1 ( state[3] ) , .A2 ( rst_n ) , 
    .A3 ( n79 ) , .ZN ( req_rdy ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U25 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n186 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U26 ( .I ( n76 ) , .ZN ( n17 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U27 ( .A1 ( n83 ) , .A2 ( n186 ) , 
    .B ( n17 ) , .ZN ( n81 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U28 ( .I ( write_reg ) , .ZN ( n185 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U29 ( .A1 ( n185 ) , .A2 ( n18 ) , 
    .ZN ( n129 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( n129 ) , .ZN ( n127 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( n5 ) , .ZN ( n119 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U32 ( .A1 ( n81 ) , .A2 ( n89 ) , 
    .A3 ( n127 ) , .A4 ( n119 ) , .ZN ( n26 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U33 ( .A1 ( read_data[7] ) , .A2 ( n18 ) , 
    .B1 ( n17 ) , .B2 ( n2 ) , .ZN ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U34 ( .A1 ( n12 ) , .A2 ( n76 ) , 
    .ZN ( n90 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U35 ( .A1 ( chip[1] ) , 
    .A2 ( cycles_left[2] ) , .B1 ( cycles_left[4] ) , .B2 ( n1 ) , 
    .ZN ( n58 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U36 ( .A1 ( chip[1] ) , 
    .A2 ( cycles_left[0] ) , .B1 ( cycles_left[2] ) , .B2 ( n1 ) , 
    .ZN ( n55 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U37 ( .I ( cycles_left[1] ) , .ZN ( n101 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( cycles_left[3] ) , .ZN ( n115 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U39 ( .A1 ( chip[1] ) , .A2 ( n101 ) , 
    .B1 ( n115 ) , .B2 ( n2 ) , .ZN ( n52 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U40 ( .A1 ( n55 ) , .A2 ( n52 ) , 
    .ZN ( n38 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( n52 ) , .ZN ( n56 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U42 ( .A1 ( n56 ) , .A2 ( n55 ) , 
    .ZN ( n37 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( n38 ) , .A2 ( req_addr[7] ) , 
    .B1 ( n37 ) , .B2 ( req_addr[15] ) , .ZN ( n7 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( n55 ) , .ZN ( n59 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U45 ( .A1 ( n52 ) , .A2 ( n59 ) , 
    .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U46 ( .A1 ( n56 ) , .A2 ( n59 ) , 
    .ZN ( n39 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U47 ( .A1 ( n40 ) , .A2 ( req_addr[3] ) , 
    .B1 ( n39 ) , .B2 ( req_addr[11] ) , .ZN ( n6 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U48 ( .A1 ( n7 ) , .A2 ( n6 ) , .ZN ( n11 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n58 ) , .A2 ( n52 ) , 
    .ZN ( n44 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U50 ( .A1 ( n2 ) , .A2 ( cycles_left[2] ) , 
    .ZN ( n66 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U51 ( .I ( n66 ) , .ZN ( n8 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U52 ( .A1 ( n8 ) , .A2 ( req_addr[23] ) , 
    .B1 ( n55 ) , .B2 ( req_addr[19] ) , .ZN ( n9 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( n9 ) , .ZN ( n10 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U54 ( .A1 ( n58 ) , .A2 ( n11 ) , 
    .B1 ( n44 ) , .B2 ( n10 ) , .ZN ( n47 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U55 ( .I ( n47 ) , .ZN ( n14 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U56 ( .A1 ( n193 ) , .A2 ( n12 ) , 
    .A3 ( state[1] ) , .ZN ( n96 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U57 ( .A1 ( cycles_left[0] ) , 
    .A2 ( state[3] ) , .A3 ( n96 ) , .ZN ( n74 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( operation[2] ) , .ZN ( n175 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( operation[0] ) , .ZN ( n160 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U60 ( .A1 ( n175 ) , .A2 ( n160 ) , 
    .ZN ( n30 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n30 ) , .ZN ( n178 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U62 ( .I ( operation[1] ) , .ZN ( n165 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U63 ( .A1 ( n178 ) , .A2 ( n165 ) , 
    .ZN ( n189 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U64 ( .I ( n189 ) , .ZN ( n157 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U65 ( .A1 ( n157 ) , .A2 ( n185 ) , 
    .ZN ( n65 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U66 ( .I ( n65 ) , .ZN ( n13 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U67 ( .A1 ( n90 ) , .A2 ( n14 ) , 
    .B1 ( n74 ) , .B2 ( n13 ) , .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U68 ( .A1 ( n26 ) , .A2 ( n16 ) , 
    .A3 ( n15 ) , .ZN ( dq_out[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( read_data[6] ) , .A2 ( n18 ) , 
    .B1 ( n17 ) , .B2 ( n1 ) , .ZN ( n25 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U70 ( .A1 ( n38 ) , .A2 ( req_addr[6] ) , 
    .B1 ( n37 ) , .B2 ( req_addr[14] ) , .ZN ( n20 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U71 ( .A1 ( n40 ) , .A2 ( req_addr[2] ) , 
    .B1 ( n39 ) , .B2 ( req_addr[10] ) , .ZN ( n19 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U72 ( .A1 ( n20 ) , .A2 ( n19 ) , 
    .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U73 ( .I0 ( req_addr[22] ) , 
    .I1 ( req_addr[18] ) , .S ( n55 ) , .Z ( n21 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U74 ( .A1 ( n58 ) , .A2 ( n22 ) , 
    .B1 ( n44 ) , .B2 ( n21 ) , .ZN ( n46 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n46 ) , .ZN ( n23 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U76 ( .A1 ( n90 ) , .A2 ( n23 ) , 
    .B1 ( n74 ) , .B2 ( n189 ) , .ZN ( n24 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U77 ( .A1 ( n26 ) , .A2 ( n25 ) , 
    .A3 ( n24 ) , .ZN ( dq_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U78 ( .I ( n124 ) , .ZN ( n36 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( cycles_left[1] ) , 
    .A2 ( cycles_left[0] ) , .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U80 ( .I ( n29 ) , .ZN ( n27 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U81 ( .A1 ( cycles_left[2] ) , .A2 ( n27 ) , 
    .B ( state[3] ) , .C ( n96 ) , .ZN ( n35 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U82 ( .I ( cycles_left[0] ) , .ZN ( n95 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U83 ( .A1 ( n101 ) , .A2 ( n95 ) , 
    .ZN ( n86 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n86 ) , .ZN ( n103 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U85 ( .I ( cycles_left[2] ) , .ZN ( n28 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U86 ( .A1 ( cycles_left[1] ) , 
    .A2 ( write_reg ) , .B1 ( n95 ) , .B2 ( n28 ) , .ZN ( n32 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U87 ( .A1 ( n86 ) , .A2 ( n29 ) , 
    .ZN ( n98 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U88 ( .A1 ( n30 ) , .A2 ( n101 ) , 
    .B ( cycles_left[2] ) , .C ( n98 ) , .ZN ( n31 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U89 ( .A1 ( n157 ) , .A2 ( n32 ) , 
    .B1 ( n31 ) , .B2 ( n189 ) , .ZN ( n33 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U90 ( .A1 ( n103 ) , .A2 ( n185 ) , 
    .B ( chip[1] ) , .C ( n33 ) , .ZN ( n34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( n36 ) , .A2 ( read_data[4] ) , 
    .B1 ( n35 ) , .B2 ( n34 ) , .ZN ( n71 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U92 ( .A1 ( n38 ) , .A2 ( req_addr[5] ) , 
    .B1 ( n37 ) , .B2 ( req_addr[13] ) , .ZN ( n42 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( n40 ) , .A2 ( req_addr[1] ) , 
    .B1 ( n39 ) , .B2 ( req_addr[9] ) , .ZN ( n41 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U94 ( .A1 ( n42 ) , .A2 ( n41 ) , 
    .ZN ( n45 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U95 ( .I0 ( req_addr[21] ) , 
    .I1 ( req_addr[17] ) , .S ( n55 ) , .Z ( n43 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U96 ( .A1 ( n58 ) , .A2 ( n45 ) , 
    .B1 ( n44 ) , .B2 ( n43 ) , .ZN ( n72 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U97 ( .A1 ( cycles_left[1] ) , .A2 ( n72 ) , 
    .A3 ( n95 ) , .ZN ( n49 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U98 ( .A1 ( cycles_left[0] ) , .A2 ( n47 ) , 
    .B1 ( n95 ) , .B2 ( n46 ) , .C ( n101 ) , .ZN ( n48 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U99 ( .A1 ( n49 ) , .A2 ( n48 ) , 
    .B ( n90 ) , .C ( n1 ) , .ZN ( n70 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U100 ( .A1 ( n58 ) , .A2 ( n56 ) , 
    .ZN ( n57 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 ZCTSBUF_14530_62 ( .I ( ZCTSNET_4 ) , 
    .Z ( ZCTSNET_3 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_153 ( .A1 ( tmp_net42 ) , 
    .A2 ( n168 ) , .A3 ( tmp_net71 ) , .ZN ( n223 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_154 ( .A1 ( n171 ) , .A2 ( n170 ) , 
    .Z ( tmp_net42 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n58 ) , .ZN ( n53 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .B1 ( n53 ) , .B2 ( n52 ) , .ZN ( n64 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U106 ( .A1 ( n2 ) , .A2 ( n86 ) , 
    .ZN ( n63 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_35 ( .A1 ( req_addr[8] ) , 
    .A2 ( n56 ) , .B1 ( n58 ) , .B2 ( req_addr[16] ) , .C1 ( req_addr[0] ) , 
    .C2 ( n57 ) , .ZN ( n54 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_155 ( .A1 ( n145 ) , 
    .A2 ( tmp_net43 ) , .ZN ( n204 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_156 ( .A1 ( n159 ) , .A2 ( n185 ) , 
    .Z ( tmp_net43 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U110 ( .A1 ( n90 ) , .A2 ( n64 ) , 
    .A3 ( n63 ) , .A4 ( n62 ) , .ZN ( n69 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( n178 ) , .A2 ( n65 ) , 
    .B1 ( cycles_left[1] ) , .B2 ( n1 ) , .ZN ( n67 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U112 ( .A1 ( n74 ) , .A2 ( n67 ) , 
    .A3 ( n66 ) , .ZN ( n68 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_2 U113 ( .A1 ( n71 ) , .A2 ( n70 ) , 
    .A3 ( n69 ) , .A4 ( n68 ) , .ZN ( dq_out[0] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n72 ) , .ZN ( n73 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( n178 ) , .A2 ( n74 ) , 
    .B1 ( n90 ) , .B2 ( n73 ) , .ZN ( n75 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( read_data[5] ) , .ZN ( n138 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U117 ( .A1 ( write_reg ) , .A2 ( n2 ) , 
    .ZN ( n172 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n172 ) , .ZN ( n147 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U119 ( .I ( status_shift[0] ) , .ZN ( n151 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U120 ( .A1 ( n175 ) , .A2 ( n151 ) , 
    .ZN ( n174 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U121 ( .A1 ( operation[1] ) , 
    .A2 ( operation[0] ) , .ZN ( n173 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_32 ( .A1 ( n124 ) , 
    .A2 ( tmp_net33 ) , .ZN ( dq_oe[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U123 ( .A1 ( n77 ) , .A2 ( n79 ) , 
    .ZN ( n167 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U124 ( .A1 ( HFSNET_2 ) , .A2 ( n167 ) , 
    .ZN ( n180 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( n180 ) , .ZN ( n162 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1 ( n173 ) , .A2 ( n162 ) , 
    .ZN ( n78 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U127 ( .A1 ( n147 ) , .A2 ( n175 ) , 
    .B ( n174 ) , .C ( n78 ) , .ZN ( N318 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U128 ( .A1 ( state[3] ) , .A2 ( n79 ) , 
    .B ( rst_n ) , .ZN ( n84 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U129 ( .A1 ( state[2] ) , .A2 ( state[3] ) , 
    .ZN ( n80 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U130 ( .I ( state[1] ) , .ZN ( n227 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U131 ( .A1 ( state[0] ) , .A2 ( n80 ) , 
    .A3 ( n227 ) , .ZN ( n233 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U132 ( .A1 ( n81 ) , .A2 ( n84 ) , 
    .A3 ( n233 ) , .ZN ( n82 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U133 ( .I ( n81 ) , .ZN ( n91 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U134 ( .A1 ( n91 ) , .A2 ( HFSNET_2 ) , 
    .ZN ( n191 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U135 ( .I ( sck ) , .ZN ( n126 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U136 ( .A1 ( sck ) , .A2 ( n82 ) , 
    .B1 ( n191 ) , .B2 ( n126 ) , .ZN ( n222 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U137 ( .A1 ( n233 ) , .A2 ( psram_b_sc_n ) , 
    .ZN ( n85 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U138 ( .A1 ( chip[1] ) , .A2 ( n233 ) , 
    .ZN ( n231 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U139 ( .I ( n186 ) , .ZN ( n190 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U140 ( .A1 ( n83 ) , .A2 ( n190 ) , 
    .ZN ( n187 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U141 ( .A1 ( n84 ) , .A2 ( n187 ) , 
    .ZN ( n228 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U142 ( .A1 ( n231 ) , .A2 ( n228 ) , 
    .ZN ( n234 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U143 ( .A1 ( chip[0] ) , .A2 ( n233 ) , 
    .B ( n85 ) , .C ( n234 ) , .ZN ( n221 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U144 ( .A1 ( operation[1] ) , .A2 ( n178 ) , 
    .B ( n96 ) , .ZN ( n88 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U145 ( .A1 ( cycles_left[2] ) , .A2 ( n86 ) , 
    .ZN ( n108 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U146 ( .I ( cycles_left[4] ) , .ZN ( n87 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U147 ( .A1 ( n108 ) , .A2 ( n87 ) , 
    .A3 ( n115 ) , .ZN ( n170 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U148 ( .A1 ( n90 ) , .A2 ( n89 ) , 
    .A3 ( n88 ) , .A4 ( n170 ) , .ZN ( n92 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U149 ( .A1 ( sck ) , .A2 ( n91 ) , 
    .ZN ( n171 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U150 ( .A1 ( n92 ) , .A2 ( n171 ) , 
    .B ( HFSNET_2 ) , .C ( n233 ) , .ZN ( n102 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U151 ( .I ( n233 ) , .ZN ( n232 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U152 ( .A1 ( HFSNET_2 ) , .A2 ( n232 ) , 
    .ZN ( n105 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U153 ( .I ( n191 ) , .ZN ( n93 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U154 ( .A1 ( n93 ) , .A2 ( n102 ) , 
    .ZN ( n114 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U155 ( .I ( n114 ) , .ZN ( n111 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U156 ( .A1 ( n111 ) , .A2 ( n95 ) , 
    .ZN ( n94 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U157 ( .A1 ( n102 ) , .A2 ( n95 ) , 
    .B ( n105 ) , .C ( n94 ) , .ZN ( n220 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U158 ( .I ( n170 ) , .ZN ( n125 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U159 ( .A1 ( n125 ) , .A2 ( n114 ) , 
    .ZN ( n107 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U160 ( .I ( n96 ) , .ZN ( n177 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U161 ( .A1 ( n170 ) , .A2 ( n114 ) , 
    .ZN ( n99 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U162 ( .A1 ( n177 ) , .A2 ( n99 ) , 
    .ZN ( n118 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U163 ( .A1 ( chip[1] ) , .A2 ( n118 ) , 
    .B1 ( chip[1] ) , .B2 ( n178 ) , .C1 ( n118 ) , .C2 ( n105 ) , 
    .ZN ( n97 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U164 ( .A1 ( n107 ) , .A2 ( n98 ) , 
    .B ( n97 ) , .ZN ( n100 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U165 ( .A1 ( n99 ) , .A2 ( n190 ) , 
    .A3 ( n185 ) , .ZN ( n104 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U166 ( .A1 ( n102 ) , .A2 ( n101 ) , 
    .B ( n100 ) , .C ( n104 ) , .ZN ( n219 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U167 ( .A1 ( n103 ) , .A2 ( n191 ) , 
    .B ( n102 ) , .ZN ( n110 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U168 ( .A1 ( n105 ) , .A2 ( n104 ) , 
    .ZN ( n106 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U169 ( .A1 ( cycles_left[2] ) , 
    .A2 ( n110 ) , .B1 ( n1 ) , .B2 ( n106 ) , .ZN ( n109 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U170 ( .A1 ( n108 ) , .A2 ( n107 ) , 
    .ZN ( n112 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U171 ( .A1 ( n109 ) , .A2 ( n118 ) , 
    .A3 ( n112 ) , .ZN ( n218 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U172 ( .A1 ( cycles_left[2] ) , 
    .A2 ( n111 ) , .B ( n110 ) , .ZN ( n113 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U173 ( .A1 ( cycles_left[3] ) , 
    .A2 ( n113 ) , .B1 ( n112 ) , .B2 ( n115 ) , .ZN ( n217 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 ctmTdsLR_1_191 ( .A1 ( n159 ) , 
    .A2 ( tmp_net70 ) , .ZN ( n141 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U175 ( .A1 ( n116 ) , 
    .A2 ( cycles_left[4] ) , .ZN ( n117 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U176 ( .A1 ( chip[1] ) , .A2 ( n189 ) , 
    .A3 ( n118 ) , .B ( n117 ) , .ZN ( n216 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U177 ( .A1 ( n126 ) , .A2 ( n119 ) , 
    .ZN ( n122 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U178 ( .I ( n122 ) , .ZN ( n123 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U179 ( .I ( dq_in[1] ) , .ZN ( n120 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U180 ( .A1 ( n120 ) , .A2 ( n123 ) , 
    .B1 ( n122 ) , .B2 ( n151 ) , .C ( rst_n ) , .ZN ( n215 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U181 ( .I ( status_shift[1] ) , .ZN ( n121 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U182 ( .A1 ( n122 ) , .A2 ( n121 ) , 
    .B1 ( n123 ) , .B2 ( n151 ) , .C ( rst_n ) , .ZN ( n214 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_202 ( .A1 ( n163 ) , 
    .A2 ( tmp_net76 ) , .ZN ( tmp_net77 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U184 ( .A1 ( req_val ) , .A2 ( req_rdy ) , 
    .ZN ( n168 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U185 ( .A1 ( HFSNET_2 ) , .A2 ( n168 ) , 
    .ZN ( n159 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( n168 ) , .ZN ( n144 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U187 ( .A1 ( sck ) , .A2 ( n191 ) , 
    .A3 ( n129 ) , .ZN ( n133 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U188 ( .A1 ( n141 ) , .A2 ( read_data[0] ) , 
    .B1 ( n144 ) , .B2 ( req_data[0] ) , .C1 ( n133 ) , .C2 ( dq_in[0] ) , 
    .ZN ( n130 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U189 ( .I ( n130 ) , .ZN ( n213 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U190 ( .A1 ( n141 ) , .A2 ( read_data[1] ) , 
    .B1 ( n144 ) , .B2 ( req_data[1] ) , .C1 ( n133 ) , .C2 ( dq_in[1] ) , 
    .ZN ( n131 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U191 ( .I ( n131 ) , .ZN ( n212 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 ctmTdsLR_3_168_roptpi_226 ( .A1 ( n226 ) , 
    .A2 ( n227 ) , .Z ( tmp_net51 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U194 ( .A1 ( n141 ) , .A2 ( read_data[3] ) , 
    .B1 ( n144 ) , .B2 ( req_data[3] ) , .C1 ( n133 ) , .C2 ( dq_in[3] ) , 
    .ZN ( n134 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U195 ( .I ( n134 ) , .ZN ( n210 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U196 ( .A1 ( n141 ) , .A2 ( n191 ) , 
    .ZN ( n140 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U197 ( .A1 ( read_data[4] ) , .A2 ( n141 ) , 
    .B1 ( n144 ) , .B2 ( req_data[4] ) , .C1 ( n140 ) , .C2 ( read_data[0] ) , 
    .ZN ( n135 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U198 ( .I ( n135 ) , .ZN ( n209 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_180 ( .A1 ( n148 ) , 
    .A2 ( tmp_net61 ) , .ZN ( n163 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U200 ( .A1 ( n144 ) , .A2 ( req_data[5] ) , 
    .B1 ( n140 ) , .B2 ( read_data[1] ) , .ZN ( n136 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_181 ( .A1 ( n150 ) , .A2 ( n149 ) , 
    .Z ( tmp_net61 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U202 ( .A1 ( n141 ) , .A2 ( read_data[6] ) , 
    .B1 ( n144 ) , .B2 ( req_data[6] ) , .C1 ( n140 ) , .C2 ( read_data[2] ) , 
    .ZN ( n139 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U203 ( .I ( n139 ) , .ZN ( n207 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U204 ( .A1 ( n141 ) , .A2 ( read_data[7] ) , 
    .B1 ( n144 ) , .B2 ( req_data[7] ) , .C1 ( n140 ) , .C2 ( read_data[3] ) , 
    .ZN ( n142 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U205 ( .I ( n142 ) , .ZN ( n206 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U206 ( .I ( n159 ) , .ZN ( n148 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U207 ( .A1 ( req_addr[23] ) , .A2 ( n144 ) , 
    .B1 ( n148 ) , .B2 ( chip[0] ) , .ZN ( n143 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U208 ( .I ( n143 ) , .ZN ( n205 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U209 ( .A1 ( n144 ) , .A2 ( req_write ) , 
    .ZN ( n145 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_163 ( .A1 ( n136 ) , 
    .A2 ( tmp_net50 ) , .ZN ( n208 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U211 ( .I ( req_addr[24] ) , .ZN ( n154 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U212 ( .A1 ( n2 ) , .A2 ( n159 ) , 
    .B1 ( n168 ) , .B2 ( n154 ) , .ZN ( n203 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U213 ( .A1 ( status_shift[0] ) , 
    .A2 ( n165 ) , .B ( n173 ) , .ZN ( n146 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U214 ( .A1 ( n147 ) , .A2 ( n178 ) , 
    .B1 ( n146 ) , .B2 ( n175 ) , .ZN ( n150 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U215 ( .I ( n167 ) , .ZN ( n149 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_186 ( .A1 ( n113 ) , 
    .A2 ( tmp_net65 ) , .ZN ( n116 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_209 ( .A1 ( n158 ) , 
    .A2 ( tmp_net81 ) , .ZN ( n201 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U218 ( .A1 ( n165 ) , .A2 ( n180 ) , 
    .ZN ( n153 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U219 ( .A1 ( operation[0] ) , 
    .A2 ( status_shift[1] ) , .A3 ( n151 ) , .ZN ( n152 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U220 ( .A1 ( req_rdy ) , .A2 ( n154 ) , 
    .B1 ( n153 ) , .B2 ( n152 ) , .ZN ( n155 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_210 ( .A1 ( n159 ) , .A2 ( n175 ) , 
    .Z ( tmp_net81 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U222 ( .A1 ( n162 ) , .A2 ( n157 ) , 
    .A3 ( n163 ) , .ZN ( n158 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U224 ( .A1 ( n160 ) , .A2 ( n185 ) , 
    .ZN ( n161 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U225 ( .A1 ( n163 ) , .A2 ( n161 ) , 
    .ZN ( n166 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U226 ( .A1 ( n178 ) , .A2 ( n165 ) , 
    .B ( n162 ) , .ZN ( n164 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U227 ( .A1 ( n166 ) , .A2 ( n165 ) , 
    .B1 ( n164 ) , .B2 ( n163 ) , .ZN ( n200 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_203 ( .I ( n160 ) , 
    .ZN ( tmp_net76 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_164 ( .A1 ( n141 ) , 
    .A2 ( tmp_net49 ) , .ZN ( tmp_net50 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U230 ( .I ( n223 ) , .ZN ( n183 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U231 ( .A1 ( n173 ) , .A2 ( n172 ) , 
    .ZN ( n176 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U232 ( .A1 ( n176 ) , .A2 ( n175 ) , 
    .B1 ( n174 ) , .B2 ( n173 ) , .ZN ( n181 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U233 ( .A1 ( n178 ) , .A2 ( n177 ) , 
    .B ( state[2] ) , .ZN ( n179 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U234 ( .A1 ( n181 ) , .A2 ( n180 ) , 
    .B1 ( n179 ) , .B2 ( n191 ) , .ZN ( n182 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U235 ( .A1 ( n183 ) , .A2 ( req_rdy ) , 
    .A3 ( n182 ) , .B1 ( state[0] ) , .B2 ( n223 ) , .ZN ( n184 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U236 ( .A1 ( n186 ) , .A2 ( n191 ) , 
    .A3 ( n185 ) , .B ( n184 ) , .ZN ( n199 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U237 ( .A1 ( n187 ) , .A2 ( rst_n ) , 
    .ZN ( n198 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U238 ( .A1 ( n190 ) , .A2 ( n189 ) , 
    .B ( n223 ) , .ZN ( n192 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U239 ( .A1 ( n193 ) , .A2 ( n192 ) , 
    .B ( n191 ) , .ZN ( n197 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U240 ( .A1 ( state[0] ) , .A2 ( n223 ) , 
    .ZN ( n226 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_187 ( .A1 ( n114 ) , .A2 ( n115 ) , 
    .Z ( tmp_net65 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_2_192 ( .A1 ( n124 ) , 
    .A2 ( n125 ) , .A3 ( tmp_net68 ) , .B ( tmp_net69 ) , .ZN ( tmp_net70 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U243 ( .A1 ( n232 ) , .A2 ( flash_sc_n ) , 
    .ZN ( n230 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U244 ( .I ( n228 ) , .ZN ( n229 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U245 ( .A1 ( n231 ) , .A2 ( n230 ) , 
    .B ( n229 ) , .ZN ( n195 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U246 ( .A1 ( psram_a_sc_n ) , .A2 ( n233 ) , 
    .B1 ( chip[0] ) , .B2 ( n232 ) , .ZN ( n235 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U247 ( .A1 ( n235 ) , .A2 ( n234 ) , 
    .ZN ( n194 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_34 ( .A1 ( tmp_net34 ) , 
    .A2 ( n59 ) , .ZN ( n62 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_165 ( .I ( n138 ) , 
    .ZN ( tmp_net49 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 ctmTdsLR_1_166 ( .A1 ( tmp_net51 ) , 
    .A2 ( tmp_net53 ) , .A3 ( tmp_net55 ) , .ZN ( n196 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_4_169 ( .A1 ( n226 ) , .A2 ( n227 ) , 
    .ZN ( tmp_net53 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_5_170 ( .A1 ( HFSNET_2 ) , 
    .A2 ( tmp_net54 ) , .ZN ( tmp_net55 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_6_171 ( .I ( state[3] ) , 
    .ZN ( tmp_net54 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_193 ( .I ( sck ) , 
    .ZN ( tmp_net68 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_194 ( .A1 ( n127 ) , 
    .A2 ( n126 ) , .ZN ( tmp_net69 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 ctmTdsLR_1_195 ( .A1 ( n232 ) , .A2 ( n228 ) , 
    .A3 ( n167 ) , .ZN ( tmp_net71 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_211 ( .A1 ( tmp_net82 ) , 
    .A2 ( tmp_net83 ) , .A3 ( tmp_net84 ) , .ZN ( n211 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_212 ( .A1 ( n141 ) , 
    .A2 ( read_data[2] ) , .ZN ( tmp_net82 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_213 ( .A1 ( n133 ) , 
    .A2 ( dq_in[2] ) , .ZN ( tmp_net83 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_214 ( .A1 ( n144 ) , 
    .A2 ( req_data[2] ) , .ZN ( tmp_net84 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module mem_itf ( clk , rst_n , read_en , write_en , copy_en , rdy , src_addr , 
    dst_addr , write_data , read_data , read_data_val , qspi_req_val , 
    qspi_req_rdy , qspi_req_write , qspi_req_addr , qspi_req_data , 
    qspi_read_data , qspi_read_data_val , VDD , VSS , HFSNET_0 , ZCTSNET_0 ) ;
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
input  VDD ;
input  VSS ;
input  HFSNET_0 ;
input  ZCTSNET_0 ;

wire tmp_net35 ;
wire tmp_net56 ;
wire tmp_net57 ;
wire tmp_net62 ;
wire tmp_net63 ;
wire tmp_net64 ;
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
supply1 VDD ;
supply0 VSS ;

assign read_data[7] = qspi_read_data[7] ;
assign read_data[6] = qspi_read_data[6] ;
assign read_data[5] = qspi_read_data[5] ;
assign read_data[4] = qspi_read_data[4] ;
assign read_data[3] = qspi_read_data[3] ;
assign read_data[2] = qspi_read_data[2] ;
assign read_data[1] = qspi_read_data[1] ;
assign read_data[0] = qspi_read_data[0] ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 copy_pending_reg ( .D ( n42 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( copy_pending ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n41 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n40 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_write_reg ( .D ( n43 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_write ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N56 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_7_ ( .D ( n39 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[7] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_6_ ( .D ( n38 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[6] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_5_ ( .D ( n37 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[5] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_4_ ( .D ( n36 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[4] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_3_ ( .D ( n35 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[3] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_2_ ( .D ( n34 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_1_ ( .D ( n33 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[1] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_data_reg_0_ ( .D ( n32 ) , 
    .CLK ( clk ) , .Q ( qspi_req_data[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 ctmTdsLR_1_36 ( .A1 ( n17 ) , .A2 ( n23 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n16 ) , .ZN ( tmp_net35 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_37 ( .A1 ( n17 ) , .A2 ( n18 ) , 
    .B ( tmp_net35 ) , .ZN ( n41 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U5 ( .A1 ( n48 ) , .A2 ( rst_n ) , 
    .A3 ( n14 ) , .ZN ( n46 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 ctmTdsLR_1_40 ( .A1 ( n25 ) , 
    .A2 ( qspi_read_data_val ) , .A3 ( state[0] ) , .B1 ( n23 ) , 
    .B2 ( n26 ) , .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 ctmTdsLR_1_172 ( .A1 ( n13 ) , 
    .A2 ( tmp_net57 ) , .ZN ( n48 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 ctmTdsLR_2_173 ( .A1 ( n15 ) , .A2 ( n22 ) , 
    .A3 ( tmp_net56 ) , .ZN ( tmp_net57 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 ctmTdsLR_3_174 ( .I ( qspi_read_data_val ) , 
    .ZN ( tmp_net56 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_182 ( .A1 ( n13 ) , 
    .A2 ( tmp_net64 ) , .ZN ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_183 ( .A1 ( tmp_net62 ) , 
    .A2 ( tmp_net63 ) , .ZN ( tmp_net64 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_184 ( .A1 ( state[0] ) , 
    .A2 ( state[1] ) , .ZN ( tmp_net62 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_185 ( .A1 ( state[1] ) , 
    .A2 ( qspi_read_data_val ) , .ZN ( tmp_net63 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U16 ( .A1 ( state[1] ) , .A2 ( HFSNET_0 ) , 
    .ZN ( n25 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( qspi_req_write ) , .ZN ( n6 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_2 U18 ( .I ( n6 ) , .Z ( n5 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U20 ( .A1 ( qspi_read_data_val ) , 
    .A2 ( n5 ) , .ZN ( n3 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U21 ( .A1 ( state[0] ) , 
    .A2 ( copy_pending ) , .A3 ( n25 ) , .A4 ( n3 ) , .ZN ( N56 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U22 ( .I0 ( dst_addr[0] ) , 
    .I1 ( src_addr[0] ) , .S ( n5 ) , .Z ( qspi_req_addr[0] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U23 ( .I0 ( dst_addr[1] ) , 
    .I1 ( src_addr[1] ) , .S ( n5 ) , .Z ( qspi_req_addr[1] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U24 ( .I0 ( dst_addr[2] ) , 
    .I1 ( src_addr[2] ) , .S ( n5 ) , .Z ( qspi_req_addr[2] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U25 ( .I0 ( dst_addr[3] ) , 
    .I1 ( src_addr[3] ) , .S ( n5 ) , .Z ( qspi_req_addr[3] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U26 ( .I0 ( dst_addr[4] ) , 
    .I1 ( src_addr[4] ) , .S ( n5 ) , .Z ( qspi_req_addr[4] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0 ( dst_addr[5] ) , 
    .I1 ( src_addr[5] ) , .S ( n5 ) , .Z ( qspi_req_addr[5] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0 ( dst_addr[6] ) , 
    .I1 ( src_addr[6] ) , .S ( n5 ) , .Z ( qspi_req_addr[6] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U29 ( .I0 ( dst_addr[7] ) , 
    .I1 ( src_addr[7] ) , .S ( n5 ) , .Z ( qspi_req_addr[7] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U30 ( .I0 ( dst_addr[8] ) , 
    .I1 ( src_addr[8] ) , .S ( n5 ) , .Z ( qspi_req_addr[8] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U31 ( .I0 ( dst_addr[9] ) , 
    .I1 ( src_addr[9] ) , .S ( n5 ) , .Z ( qspi_req_addr[9] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U32 ( .I0 ( dst_addr[10] ) , 
    .I1 ( src_addr[10] ) , .S ( n6 ) , .Z ( qspi_req_addr[10] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U33 ( .I0 ( dst_addr[11] ) , 
    .I1 ( src_addr[11] ) , .S ( n5 ) , .Z ( qspi_req_addr[11] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U34 ( .I0 ( dst_addr[12] ) , 
    .I1 ( src_addr[12] ) , .S ( n5 ) , .Z ( qspi_req_addr[12] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U35 ( .I0 ( dst_addr[13] ) , 
    .I1 ( src_addr[13] ) , .S ( n5 ) , .Z ( qspi_req_addr[13] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U36 ( .I0 ( dst_addr[14] ) , 
    .I1 ( src_addr[14] ) , .S ( n5 ) , .Z ( qspi_req_addr[14] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U37 ( .I0 ( dst_addr[15] ) , 
    .I1 ( src_addr[15] ) , .S ( n6 ) , .Z ( qspi_req_addr[15] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U38 ( .I0 ( dst_addr[16] ) , 
    .I1 ( src_addr[16] ) , .S ( n6 ) , .Z ( qspi_req_addr[16] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U39 ( .I0 ( dst_addr[17] ) , 
    .I1 ( src_addr[17] ) , .S ( n6 ) , .Z ( qspi_req_addr[17] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U40 ( .I0 ( dst_addr[18] ) , 
    .I1 ( src_addr[18] ) , .S ( n5 ) , .Z ( qspi_req_addr[18] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U41 ( .I0 ( dst_addr[19] ) , 
    .I1 ( src_addr[19] ) , .S ( n6 ) , .Z ( qspi_req_addr[19] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U42 ( .I0 ( dst_addr[20] ) , 
    .I1 ( src_addr[20] ) , .S ( n6 ) , .Z ( qspi_req_addr[20] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U43 ( .I0 ( dst_addr[21] ) , 
    .I1 ( src_addr[21] ) , .S ( n6 ) , .Z ( qspi_req_addr[21] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U44 ( .I0 ( dst_addr[22] ) , 
    .I1 ( src_addr[22] ) , .S ( n5 ) , .Z ( qspi_req_addr[22] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U45 ( .I0 ( dst_addr[23] ) , 
    .I1 ( src_addr[23] ) , .S ( n6 ) , .Z ( qspi_req_addr[23] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U46 ( .I0 ( dst_addr[24] ) , 
    .I1 ( src_addr[24] ) , .S ( n6 ) , .Z ( qspi_req_addr[24] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U47 ( .I ( state[0] ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( state[1] ) , .ZN ( n22 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U49 ( .A1 ( n18 ) , .A2 ( n22 ) , 
    .ZN ( n14 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U50 ( .I ( n14 ) , .ZN ( rdy ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( copy_pending ) , .A2 ( n18 ) , 
    .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U53 ( .A1 ( write_en ) , .A2 ( read_en ) , 
    .A3 ( copy_en ) , .B ( rdy ) , .ZN ( n7 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U54 ( .A1 ( HFSNET_0 ) , .A2 ( n7 ) , 
    .ZN ( n13 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U56 ( .A1 ( write_en ) , .A2 ( n46 ) , 
    .B1 ( n48 ) , .B2 ( qspi_req_write ) , .ZN ( n11 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U57 ( .A1 ( n48 ) , .A2 ( n25 ) , 
    .ZN ( n47 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( n47 ) , .ZN ( n10 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U59 ( .A1 ( n11 ) , .A2 ( n10 ) , 
    .ZN ( n43 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U60 ( .A1 ( copy_pending ) , .A2 ( n48 ) , 
    .B1 ( copy_en ) , .B2 ( n46 ) , .ZN ( n12 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n12 ) , .ZN ( n42 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U63 ( .I ( qspi_req_rdy ) , .ZN ( n23 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U65 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .ZN ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U69 ( .A1 ( n22 ) , .A2 ( state[0] ) , 
    .A3 ( HFSNET_0 ) , .ZN ( n26 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U71 ( .I ( n26 ) , .ZN ( qspi_req_val ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U72 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[7] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[7] ) , 
    .C1 ( n46 ) , .C2 ( write_data[7] ) , .ZN ( n27 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U73 ( .I ( n27 ) , .ZN ( n39 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U74 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[6] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[6] ) , 
    .C1 ( n46 ) , .C2 ( write_data[6] ) , .ZN ( n28 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n28 ) , .ZN ( n38 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U76 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[5] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[5] ) , 
    .C1 ( n46 ) , .C2 ( write_data[5] ) , .ZN ( n29 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U77 ( .I ( n29 ) , .ZN ( n37 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U78 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[4] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[4] ) , 
    .C1 ( n46 ) , .C2 ( write_data[4] ) , .ZN ( n30 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U79 ( .I ( n30 ) , .ZN ( n36 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U80 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[3] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[3] ) , 
    .C1 ( n46 ) , .C2 ( write_data[3] ) , .ZN ( n31 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( n31 ) , .ZN ( n35 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U82 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[2] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[2] ) , 
    .C1 ( n46 ) , .C2 ( write_data[2] ) , .ZN ( n44 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U83 ( .I ( n44 ) , .ZN ( n34 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U84 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[1] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[1] ) , 
    .C1 ( n46 ) , .C2 ( write_data[1] ) , .ZN ( n45 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U85 ( .I ( n45 ) , .ZN ( n33 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U86 ( .A1 ( n48 ) , 
    .A2 ( qspi_req_data[0] ) , .B1 ( n47 ) , .B2 ( qspi_read_data[0] ) , 
    .C1 ( n46 ) , .C2 ( write_data[0] ) , .ZN ( n49 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U87 ( .I ( n49 ) , .ZN ( n32 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
endmodule


module act ( clk , rst_n , vpu_res_in , act_op_in , vpu_res_in_val , 
    act_res_out , act_res_out_val , VDD , VSS , HFSNET_1 ) ;
input  clk ;
input  rst_n ;
input  [7:0] vpu_res_in ;
input  [2:0] act_op_in ;
input  vpu_res_in_val ;
output [7:0] act_res_out ;
output act_res_out_val ;
input  VDD ;
input  VSS ;
input  HFSNET_1 ;

wire N85 ;
wire n40 ;
wire n41 ;
wire n42 ;
wire n43 ;
wire n44 ;
wire n45 ;
wire n46 ;
wire n47 ;
wire n2 ;
wire n3 ;
wire n4 ;
wire n5 ;
wire n6 ;
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
wire n48 ;
wire n49 ;
wire n50 ;
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
supply1 VDD ;
supply0 VSS ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_val_reg ( .D ( N85 ) , 
    .CLK ( clk ) , .Q ( act_res_out_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_7_ ( .D ( n47 ) , 
    .CLK ( clk ) , .Q ( act_res_out[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_6_ ( .D ( n46 ) , 
    .CLK ( clk ) , .Q ( act_res_out[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_5_ ( .D ( n45 ) , 
    .CLK ( clk ) , .Q ( act_res_out[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_4_ ( .D ( n44 ) , 
    .CLK ( clk ) , .Q ( act_res_out[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_3_ ( .D ( n43 ) , 
    .CLK ( clk ) , .Q ( act_res_out[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_2_ ( .D ( n42 ) , 
    .CLK ( clk ) , .Q ( act_res_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_1_ ( .D ( n41 ) , 
    .CLK ( clk ) , .Q ( act_res_out[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_res_out_reg_0_ ( .D ( n40 ) , 
    .CLK ( clk ) , .Q ( act_res_out[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U5 ( .A1 ( vpu_res_in_val ) , 
    .A2 ( HFSNET_1 ) , .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U6 ( .I ( n22 ) , .ZN ( N85 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U7 ( .A1 ( act_op_in[0] ) , 
    .A2 ( act_op_in[1] ) , .Z ( n6 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U8 ( .I ( vpu_res_in[5] ) , .ZN ( n3 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( vpu_res_in[7] ) , .ZN ( n9 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( vpu_res_in[4] ) , .ZN ( n35 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U11 ( .A1 ( vpu_res_in[4] ) , 
    .A2 ( vpu_res_in[6] ) , .B1 ( n9 ) , .B2 ( n35 ) , .ZN ( n2 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U12 ( .A1 ( vpu_res_in[6] ) , .A2 ( n3 ) , 
    .B1 ( n9 ) , .B2 ( vpu_res_in[5] ) , .C ( n2 ) , .ZN ( n28 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U13 ( .A1 ( act_op_in[0] ) , 
    .A2 ( act_op_in[1] ) , .ZN ( n5 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( act_op_in[2] ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U15 ( .A1 ( n18 ) , .A2 ( n5 ) , .ZN ( n4 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U16 ( .A1 ( n6 ) , .A2 ( n28 ) , 
    .B1 ( n5 ) , .B2 ( n18 ) , .C ( n4 ) , .ZN ( n10 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U17 ( .A1 ( N85 ) , .A2 ( act_op_in[0] ) , 
    .A3 ( act_op_in[1] ) , .A4 ( n18 ) , .ZN ( n27 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( n27 ) , .ZN ( n11 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U19 ( .A1 ( vpu_res_in_val ) , .A2 ( rst_n ) , 
    .ZN ( n50 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U20 ( .A1 ( vpu_res_in[7] ) , .A2 ( n11 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[7] ) , .ZN ( n8 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U21 ( .A1 ( n10 ) , .A2 ( n9 ) , 
    .A3 ( n22 ) , .B ( n8 ) , .ZN ( n47 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( act_op_in[1] ) , .ZN ( n21 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U23 ( .A1 ( n9 ) , .A2 ( n21 ) , 
    .ZN ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_2 U24 ( .A1 ( act_op_in[2] ) , .A2 ( n10 ) , 
    .B1 ( n17 ) , .B2 ( n10 ) , .C ( n22 ) , .ZN ( n51 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U25 ( .A1 ( vpu_res_in[6] ) , .A2 ( n51 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[6] ) , .ZN ( n12 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U26 ( .A1 ( vpu_res_in[7] ) , .A2 ( n11 ) , 
    .ZN ( n13 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U27 ( .A1 ( n12 ) , .A2 ( n13 ) , 
    .ZN ( n46 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U28 ( .A1 ( vpu_res_in[5] ) , .A2 ( n51 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[5] ) , .ZN ( n14 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U29 ( .A1 ( n14 ) , .A2 ( n13 ) , 
    .ZN ( n45 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U30 ( .A1 ( vpu_res_in[5] ) , 
    .A2 ( vpu_res_in[6] ) , .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U31 ( .A1 ( vpu_res_in[2] ) , 
    .A2 ( vpu_res_in[1] ) , .ZN ( n54 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U32 ( .A1 ( n15 ) , .A2 ( n54 ) , 
    .ZN ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U33 ( .A1 ( vpu_res_in[4] ) , 
    .A2 ( vpu_res_in[3] ) , .A3 ( vpu_res_in[0] ) , .A4 ( n16 ) , 
    .ZN ( n19 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U34 ( .A1 ( act_op_in[0] ) , .A2 ( n19 ) , 
    .A3 ( n18 ) , .A4 ( n17 ) , .ZN ( n20 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U35 ( .A1 ( N85 ) , .A2 ( n20 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[4] ) , .ZN ( n26 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( vpu_res_in[6] ) , .ZN ( n24 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U37 ( .A1 ( vpu_res_in[2] ) , 
    .A2 ( vpu_res_in[1] ) , .A3 ( vpu_res_in[3] ) , .ZN ( n39 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U38 ( .A1 ( n35 ) , .A2 ( n39 ) , 
    .ZN ( n38 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U39 ( .A1 ( vpu_res_in[5] ) , .A2 ( n38 ) , 
    .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U40 ( .A1 ( n24 ) , .A2 ( n29 ) , 
    .B ( vpu_res_in[7] ) , .ZN ( n30 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or4_1 U41 ( .A1 ( n22 ) , .A2 ( n21 ) , 
    .A3 ( act_op_in[0] ) , .A4 ( act_op_in[2] ) , .Z ( n23 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U42 ( .A1 ( n29 ) , .A2 ( vpu_res_in[7] ) , 
    .B1 ( n24 ) , .B2 ( vpu_res_in[7] ) , .C ( n23 ) , .ZN ( n32 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( vpu_res_in[4] ) , .A2 ( n51 ) , 
    .B1 ( n30 ) , .B2 ( n32 ) , .ZN ( n25 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U44 ( .A1 ( n28 ) , .A2 ( n27 ) , 
    .B ( n26 ) , .C ( n25 ) , .ZN ( n44 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U45 ( .A1 ( n38 ) , .A2 ( vpu_res_in[5] ) , 
    .B ( n29 ) , .ZN ( n34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U46 ( .I ( n30 ) , .ZN ( n31 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U47 ( .A1 ( n32 ) , .A2 ( n31 ) , 
    .ZN ( n53 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U48 ( .A1 ( vpu_res_in[3] ) , .A2 ( n51 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[3] ) , .ZN ( n33 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U49 ( .A1 ( n34 ) , .A2 ( n53 ) , 
    .B ( n33 ) , .ZN ( n43 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U50 ( .A1 ( n35 ) , .A2 ( n39 ) , .Z ( n37 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U51 ( .A1 ( vpu_res_in[2] ) , .A2 ( n51 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[2] ) , .ZN ( n36 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U52 ( .A1 ( n38 ) , .A2 ( n37 ) , 
    .A3 ( n53 ) , .B ( n36 ) , .ZN ( n42 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U53 ( .A1 ( vpu_res_in[2] ) , 
    .A2 ( vpu_res_in[1] ) , .Z ( n55 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U54 ( .A1 ( n55 ) , .A2 ( vpu_res_in[3] ) , 
    .B ( n39 ) , .ZN ( n49 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U55 ( .A1 ( vpu_res_in[1] ) , .A2 ( n51 ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[1] ) , .ZN ( n48 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U56 ( .A1 ( n53 ) , .A2 ( n49 ) , 
    .B ( n48 ) , .ZN ( n41 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U57 ( .A1 ( n51 ) , .A2 ( vpu_res_in[0] ) , 
    .B1 ( n50 ) , .B2 ( act_res_out[0] ) , .ZN ( n52 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U58 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .A3 ( n53 ) , .B ( n52 ) , .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module vpu ( clk , rst_n , exe_inst_in , exe_inst_in_val , weight_data , 
    weight_data_val , input_data , input_data_val , vpu_res_out , act_op_out , 
    vpu_res_out_val , VDD , VSS , HFSNET_1 , ZCTSNET_0 ) ;
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
input  VDD ;
input  VSS ;
input  HFSNET_1 ;
input  ZCTSNET_0 ;

supply1 VDD ;
wire N132 ;
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
wire intadd_0_A_4_ ;
wire intadd_0_A_3_ ;
wire intadd_0_A_1_ ;
wire intadd_0_A_0_ ;
wire intadd_0_B_4_ ;
wire intadd_0_B_3_ ;
wire tmp_net75 ;
wire intadd_0_B_1_ ;
wire intadd_0_B_0_ ;
wire intadd_0_CI ;
wire intadd_0_SUM_4_ ;
wire intadd_0_SUM_3_ ;
wire intadd_0_SUM_1_ ;
wire intadd_0_SUM_0_ ;
wire intadd_0_n5 ;
wire intadd_0_n4 ;
wire intadd_0_n3 ;
wire intadd_0_n2 ;
wire intadd_0_n1 ;
wire intadd_1_A_2_ ;
wire intadd_1_A_1_ ;
wire intadd_1_A_0_ ;
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
wire intadd_2_A_0_ ;
wire intadd_2_B_2_ ;
wire intadd_2_B_1_ ;
wire intadd_2_B_0_ ;
wire intadd_2_CI ;
wire intadd_2_SUM_2_ ;
wire intadd_2_SUM_1_ ;
wire intadd_2_SUM_0_ ;
wire intadd_2_n3 ;
wire intadd_2_n2 ;
wire intadd_2_n1 ;
wire tmp_net28 ;
wire n2 ;
wire n3 ;
wire n4 ;
wire tmp_net29 ;
wire tmp_net30 ;
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
wire n75 ;
wire n76 ;
wire n77 ;
wire n78 ;
wire n79 ;
wire n80 ;
wire n81 ;
wire n82 ;
wire n83 ;
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
wire n151 ;
wire n152 ;
wire n153 ;
wire n156 ;
wire n157 ;
wire n158 ;
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
wire n172 ;
wire n174 ;
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
wire n214 ;
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
wire n227 ;
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
wire n251 ;
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
wire n264 ;
wire n265 ;
wire n266 ;
wire n267 ;
wire n268 ;
wire n269 ;
wire n270 ;
wire n271 ;
wire n272 ;
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
wire n287 ;
wire n288 ;
wire n289 ;
wire n290 ;
wire n291 ;
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
wire n304 ;
wire n305 ;
wire n306 ;
wire n307 ;
wire n309 ;
wire n310 ;
wire n311 ;
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
wire [7:0] x ;
wire [7:0] w ;
supply0 VSS ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_val_reg ( .D ( N132 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out_val ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_4_ ( .D ( n90 ) , .CLK ( clk ) , 
    .Q ( w[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_3_ ( .D ( n91 ) , .CLK ( clk ) , 
    .Q ( w[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_1_ ( .D ( n93 ) , .CLK ( clk ) , 
    .Q ( w[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_6_ ( .D ( n103 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_4_ ( .D ( n105 ) , .CLK ( clk ) , 
    .Q ( x[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_2_ ( .D ( n107 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_1_ ( .D ( n108 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( x[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_0_ ( .D ( n109 ) , .CLK ( clk ) , 
    .Q ( x[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_7_ ( .D ( n101 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_6_ ( .D ( n95 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_5_ ( .D ( n96 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_4_ ( .D ( n97 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_3_ ( .D ( n98 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_2_ ( .D ( n99 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_1_ ( .D ( n100 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 vpu_res_out_reg_0_ ( .D ( n110 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( vpu_res_out[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_2_ ( .D ( n86 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_1_ ( .D ( n85 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 act_op_out_reg_0_ ( .D ( n84 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( act_op_out[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U6 ( .A ( intadd_0_A_0_ ) , 
    .B ( intadd_0_B_0_ ) , .CI ( intadd_0_CI ) , .CO ( intadd_0_n5 ) , 
    .S ( intadd_0_SUM_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U5 ( .A ( intadd_0_A_1_ ) , 
    .B ( intadd_0_B_1_ ) , .CI ( intadd_0_n5 ) , .CO ( intadd_0_n4 ) , 
    .S ( intadd_0_SUM_1_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_199 ( .A1 ( n241 ) , 
    .A2 ( tmp_net75 ) , .ZN ( n302 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U3 ( .A ( intadd_0_A_3_ ) , 
    .B ( intadd_0_B_3_ ) , .CI ( intadd_0_n3 ) , .CO ( intadd_0_n2 ) , 
    .S ( intadd_0_SUM_3_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_0_U2 ( .A ( intadd_0_A_4_ ) , 
    .B ( intadd_0_B_4_ ) , .CI ( intadd_0_n2 ) , .CO ( intadd_0_n1 ) , 
    .S ( intadd_0_SUM_4_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U4 ( .A ( intadd_1_A_0_ ) , 
    .B ( intadd_1_B_0_ ) , .CI ( intadd_1_CI ) , .CO ( intadd_1_n3 ) , 
    .S ( intadd_1_SUM_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U3 ( .A ( intadd_1_CI ) , 
    .B ( intadd_1_A_1_ ) , .CI ( intadd_1_n3 ) , .CO ( intadd_1_n2 ) , 
    .S ( intadd_1_SUM_1_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_1_U2 ( .A ( intadd_1_CI ) , 
    .B ( intadd_1_A_2_ ) , .CI ( intadd_1_n2 ) , .CO ( intadd_1_n1 ) , 
    .S ( intadd_1_SUM_2_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U4 ( .A ( intadd_2_A_0_ ) , 
    .B ( intadd_2_B_0_ ) , .CI ( intadd_2_CI ) , .CO ( intadd_2_n3 ) , 
    .S ( intadd_2_SUM_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U3 ( .A ( intadd_2_A_1_ ) , 
    .B ( intadd_2_B_1_ ) , .CI ( intadd_2_n3 ) , .CO ( intadd_2_n2 ) , 
    .S ( intadd_2_SUM_1_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 intadd_2_U2 ( .A ( intadd_2_A_2_ ) , 
    .B ( intadd_2_B_2_ ) , .CI ( intadd_2_n2 ) , .CO ( intadd_2_n1 ) , 
    .S ( intadd_2_SUM_2_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_7_ ( .D ( n87 ) , .CLK ( clk ) , 
    .Q ( w[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_6_ ( .D ( n88 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_5_ ( .D ( n89 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_2_ ( .D ( n92 ) , .CLK ( clk ) , 
    .Q ( w[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 weights_reg_0_ ( .D ( n94 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( w[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_7_ ( .D ( n102 ) , .CLK ( clk ) , 
    .Q ( x[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_5_ ( .D ( n104 ) , .CLK ( clk ) , 
    .Q ( x[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_3_ ( .D ( n106 ) , .CLK ( clk ) , 
    .Q ( x[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_20 ( .A1 ( n10 ) , .A2 ( n4 ) , 
    .ZN ( tmp_net28 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( w[0] ) , .ZN ( n2 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( n2 ) , .ZN ( n3 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U6 ( .I ( n7 ) , .ZN ( n4 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 ctmTdsLR_2_21 ( .A1 ( n9 ) , .A2 ( x[4] ) , 
    .B1 ( n7 ) , .B2 ( n206 ) , .ZN ( tmp_net29 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 ctmTdsLR_3_22 ( .A1 ( tmp_net28 ) , 
    .A2 ( tmp_net29 ) , .Z ( n148 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( x[5] ) , .ZN ( n7 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( n4 ) , .ZN ( n8 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( x[3] ) , .ZN ( n9 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( n9 ) , .ZN ( n10 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( exe_inst_in[1] ) , .ZN ( n11 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( exe_inst_in[1] ) , .ZN ( n12 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 ctmTdsLR_1_23 ( .I ( intadd_0_n4 ) , 
    .ZN ( tmp_net30 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( exe_inst_in[1] ) , .ZN ( n210 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U17 ( .A1 ( exe_inst_in[0] ) , .A2 ( n210 ) , 
    .ZN ( n235 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U18 ( .A1 ( n235 ) , .A2 ( exe_inst_in[2] ) , 
    .Z ( n205 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U19 ( .A1 ( vpu_res_out[7] ) , .A2 ( n205 ) , 
    .B1 ( w[7] ) , .B2 ( n11 ) , .ZN ( n14 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( x[7] ) , .ZN ( n264 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U21 ( .A1 ( n12 ) , .A2 ( n264 ) , 
    .B ( exe_inst_in[0] ) , .C ( n14 ) , .ZN ( n13 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U22 ( .A1 ( n14 ) , .A2 ( exe_inst_in[0] ) , 
    .B ( n13 ) , .ZN ( intadd_1_CI ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U23 ( .I ( x[4] ) , .ZN ( n206 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U24 ( .I ( n10 ) , .ZN ( n198 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U25 ( .A1 ( x[3] ) , .A2 ( x[4] ) , 
    .B1 ( n206 ) , .B2 ( n9 ) , .ZN ( n147 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U26 ( .I ( w[7] ) , .ZN ( n152 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U27 ( .A1 ( n152 ) , .A2 ( n4 ) , 
    .B1 ( n8 ) , .B2 ( w[7] ) , .ZN ( n146 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U28 ( .I ( w[6] ) , .ZN ( n150 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U29 ( .A1 ( x[5] ) , .A2 ( w[6] ) , 
    .B1 ( n150 ) , .B2 ( n7 ) , .ZN ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U30 ( .A1 ( n147 ) , .A2 ( n146 ) , 
    .B1 ( n148 ) , .B2 ( n17 ) , .ZN ( n158 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( n158 ) , .ZN ( intadd_2_A_1_ ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U32 ( .I ( x[1] ) , .ZN ( n182 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( x[2] ) , .ZN ( n195 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U34 ( .A1 ( x[2] ) , .A2 ( n182 ) , 
    .B1 ( x[1] ) , .B2 ( n195 ) , .ZN ( n113 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U35 ( .A1 ( w[7] ) , .A2 ( n9 ) , 
    .B1 ( x[3] ) , .B2 ( n152 ) , .ZN ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U36 ( .A1 ( x[2] ) , .A2 ( n10 ) , 
    .B1 ( n9 ) , .B2 ( n195 ) , .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U37 ( .A1 ( n15 ) , .A2 ( n113 ) , 
    .ZN ( n111 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U38 ( .A1 ( w[6] ) , .A2 ( n198 ) , 
    .B1 ( n10 ) , .B2 ( n150 ) , .ZN ( n112 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U39 ( .A1 ( n113 ) , .A2 ( n16 ) , 
    .B1 ( n111 ) , .B2 ( n112 ) , .ZN ( n134 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( n134 ) , .ZN ( intadd_2_A_0_ ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U41 ( .A1 ( n113 ) , .A2 ( n111 ) , 
    .B ( n16 ) , .ZN ( intadd_2_B_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( w[5] ) , .ZN ( n64 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( n4 ) , .A2 ( w[5] ) , 
    .B1 ( n64 ) , .B2 ( n8 ) , .ZN ( n127 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U44 ( .A1 ( n17 ) , .A2 ( n147 ) , 
    .B1 ( n127 ) , .B2 ( n148 ) , .ZN ( intadd_2_CI ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U45 ( .A1 ( x[7] ) , .A2 ( w[5] ) , 
    .B1 ( n64 ) , .B2 ( n264 ) , .ZN ( n151 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U46 ( .I ( x[6] ) , .ZN ( n168 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U47 ( .A1 ( x[6] ) , .A2 ( n8 ) , 
    .B1 ( n4 ) , .B2 ( n168 ) , .ZN ( n117 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( n117 ) , .ZN ( n222 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U49 ( .I ( w[4] ) , .ZN ( n203 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U50 ( .A1 ( x[7] ) , .A2 ( w[4] ) , 
    .B1 ( n203 ) , .B2 ( n264 ) , .ZN ( n131 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( x[6] ) , .A2 ( x[7] ) , 
    .ZN ( n18 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 U52 ( .A1 ( x[7] ) , .A2 ( x[5] ) , 
    .B1 ( x[6] ) , .B2 ( n7 ) , .C ( n18 ) , .ZN ( n116 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( n116 ) , .ZN ( n223 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U54 ( .A1 ( n151 ) , .A2 ( n222 ) , 
    .B1 ( n131 ) , .B2 ( n223 ) , .ZN ( intadd_2_B_1_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U55 ( .I ( n113 ) , .ZN ( n68 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U56 ( .I ( w[3] ) , .ZN ( n199 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U57 ( .A1 ( n199 ) , .A2 ( x[3] ) , 
    .B1 ( n9 ) , .B2 ( w[3] ) , .ZN ( n50 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( n111 ) , .ZN ( n66 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( w[2] ) , .ZN ( n114 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U60 ( .A1 ( w[2] ) , .A2 ( n10 ) , 
    .B1 ( n198 ) , .B2 ( n114 ) , .ZN ( n28 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U61 ( .A1 ( n68 ) , .A2 ( n50 ) , 
    .B1 ( n66 ) , .B2 ( n28 ) , .ZN ( n19 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U62 ( .I ( n19 ) , .ZN ( n47 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U63 ( .A1 ( w[0] ) , .A2 ( n8 ) , 
    .ZN ( n21 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U64 ( .A1 ( n10 ) , .A2 ( x[4] ) , 
    .A3 ( n7 ) , .ZN ( n20 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U65 ( .A1 ( n21 ) , .A2 ( n147 ) , 
    .B ( n20 ) , .ZN ( n24 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U66 ( .I ( w[1] ) , .ZN ( n57 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U67 ( .A1 ( n4 ) , .A2 ( w[1] ) , 
    .B1 ( n57 ) , .B2 ( n8 ) , .ZN ( n52 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U68 ( .A1 ( n4 ) , .A2 ( n3 ) , .B1 ( n2 ) , 
    .B2 ( n7 ) , .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( n52 ) , .A2 ( n147 ) , 
    .B1 ( n148 ) , .B2 ( n22 ) , .ZN ( n23 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U70 ( .A1 ( n23 ) , .A2 ( n24 ) , 
    .ZN ( n79 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U71 ( .A1 ( n24 ) , .A2 ( n23 ) , 
    .B ( n79 ) , .ZN ( n46 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U72 ( .I ( x[0] ) , .ZN ( n25 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U73 ( .A1 ( x[1] ) , .A2 ( n25 ) , 
    .ZN ( n70 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U74 ( .A1 ( n182 ) , .A2 ( x[0] ) , 
    .ZN ( n82 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n82 ) , .ZN ( n73 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U76 ( .A1 ( n25 ) , .A2 ( n182 ) , 
    .ZN ( n72 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U77 ( .A1 ( w[5] ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n64 ) , .ZN ( n26 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U78 ( .A1 ( w[4] ) , .A2 ( n70 ) , 
    .B ( n26 ) , .ZN ( n45 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_200 ( .A1 ( n245 ) , 
    .A2 ( exe_inst_in[7] ) , .Z ( tmp_net75 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U80 ( .A1 ( x[3] ) , .A2 ( w[1] ) , 
    .B1 ( n57 ) , .B2 ( n9 ) , .ZN ( n32 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U81 ( .A1 ( n68 ) , .A2 ( n28 ) , 
    .B1 ( n66 ) , .B2 ( n32 ) , .ZN ( intadd_0_A_0_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U82 ( .A1 ( w[0] ) , .A2 ( n147 ) , 
    .ZN ( intadd_0_B_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U83 ( .A1 ( w[3] ) , .A2 ( n70 ) , 
    .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U84 ( .A1 ( n73 ) , .A2 ( w[4] ) , 
    .B1 ( n72 ) , .B2 ( n203 ) , .C ( n29 ) , .ZN ( intadd_0_CI ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U85 ( .A1 ( w[2] ) , .A2 ( n70 ) , 
    .ZN ( n30 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U86 ( .A1 ( n73 ) , .A2 ( w[3] ) , 
    .B1 ( n72 ) , .B2 ( n199 ) , .C ( n30 ) , .ZN ( n39 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U87 ( .A1 ( x[3] ) , .A2 ( w[0] ) , 
    .B1 ( n2 ) , .B2 ( n198 ) , .ZN ( n31 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U88 ( .A1 ( n68 ) , .A2 ( n32 ) , 
    .B1 ( n66 ) , .B2 ( n31 ) , .ZN ( n38 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U89 ( .A1 ( n39 ) , .A2 ( n38 ) , 
    .ZN ( n187 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U90 ( .A1 ( n113 ) , .A2 ( n3 ) , 
    .B ( n111 ) , .ZN ( n33 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U91 ( .A1 ( n10 ) , .A2 ( n33 ) , 
    .ZN ( n186 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U92 ( .I ( n186 ) , .ZN ( n42 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( w[2] ) , .A2 ( n72 ) , 
    .B1 ( n3 ) , .B2 ( n113 ) , .ZN ( n36 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U94 ( .A1 ( x[0] ) , .A2 ( n3 ) , 
    .ZN ( n34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U95 ( .A1 ( n182 ) , .A2 ( n34 ) , 
    .B1 ( n182 ) , .B2 ( n114 ) , .C1 ( n34 ) , .C2 ( w[1] ) , .ZN ( n35 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U96 ( .A1 ( n36 ) , .A2 ( n35 ) , 
    .ZN ( n185 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U97 ( .I ( n185 ) , .ZN ( n41 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U98 ( .A1 ( n42 ) , .A2 ( n41 ) , 
    .B1 ( n39 ) , .B2 ( n38 ) , .ZN ( n37 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U99 ( .A1 ( n39 ) , .A2 ( n38 ) , 
    .B ( n37 ) , .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U100 ( .A1 ( n42 ) , .A2 ( n41 ) , 
    .B ( n40 ) , .ZN ( n188 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U101 ( .I ( n188 ) , .ZN ( n44 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( intadd_0_SUM_0_ ) , .ZN ( n43 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U103 ( .A1 ( n187 ) , .A2 ( n44 ) , 
    .B1 ( n187 ) , .B2 ( n43 ) , .C1 ( n44 ) , .C2 ( n43 ) , 
    .ZN ( intadd_0_A_1_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U104 ( .A ( n47 ) , .B ( n46 ) , .CI ( n45 ) , 
    .CO ( n27 ) , .S ( n48 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U105 ( .I ( n48 ) , .ZN ( intadd_0_B_1_ ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U106 ( .A1 ( n3 ) , .A2 ( n222 ) , 
    .ZN ( n63 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U107 ( .A1 ( w[5] ) , .A2 ( n70 ) , 
    .ZN ( n49 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U108 ( .A1 ( n73 ) , .A2 ( w[6] ) , 
    .B1 ( n72 ) , .B2 ( n150 ) , .C ( n49 ) , .ZN ( n62 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U109 ( .A1 ( n10 ) , .A2 ( w[4] ) , 
    .B1 ( n203 ) , .B2 ( n9 ) , .ZN ( n65 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U110 ( .A1 ( n68 ) , .A2 ( n65 ) , 
    .B1 ( n66 ) , .B2 ( n50 ) , .ZN ( n61 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U111 ( .I ( n51 ) , .ZN ( n78 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U112 ( .A1 ( n8 ) , .A2 ( w[2] ) , 
    .B1 ( n114 ) , .B2 ( n4 ) , .ZN ( n69 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( n147 ) , .A2 ( n69 ) , 
    .B1 ( n148 ) , .B2 ( n52 ) , .ZN ( n53 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n53 ) , .ZN ( n77 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor3_1 ctmTdsLR_1_30 ( .A1 ( n272 ) , .A2 ( n274 ) , 
    .A3 ( n271 ) , .Z ( n276 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U116 ( .A1 ( x[7] ) , .A2 ( n2 ) , 
    .ZN ( n56 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U117 ( .A1 ( x[7] ) , .A2 ( n168 ) , 
    .A3 ( n7 ) , .ZN ( n55 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U118 ( .A1 ( n117 ) , .A2 ( n56 ) , 
    .B ( n55 ) , .ZN ( n60 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U119 ( .A1 ( x[7] ) , .A2 ( n57 ) , 
    .B1 ( w[1] ) , .B2 ( n264 ) , .ZN ( n115 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U120 ( .A1 ( x[7] ) , .A2 ( n2 ) , 
    .B1 ( w[0] ) , .B2 ( n264 ) , .ZN ( n58 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U121 ( .A1 ( n117 ) , .A2 ( n115 ) , 
    .B1 ( n116 ) , .B2 ( n58 ) , .ZN ( n59 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U122 ( .A1 ( n59 ) , .A2 ( n60 ) , 
    .ZN ( n125 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U123 ( .A1 ( n60 ) , .A2 ( n59 ) , 
    .B ( n125 ) , .ZN ( n76 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U124 ( .A ( n63 ) , .B ( n62 ) , .CI ( n61 ) , 
    .CO ( n75 ) , .S ( n51 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U125 ( .A1 ( x[3] ) , .A2 ( n64 ) , 
    .B1 ( w[5] ) , .B2 ( n9 ) , .ZN ( n83 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U126 ( .I ( n83 ) , .ZN ( n67 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U127 ( .A1 ( n68 ) , .A2 ( n67 ) , 
    .B1 ( n66 ) , .B2 ( n65 ) , .ZN ( n122 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U128 ( .A1 ( n4 ) , .A2 ( w[3] ) , 
    .B1 ( n199 ) , .B2 ( n7 ) , .ZN ( n81 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U129 ( .A1 ( n81 ) , .A2 ( n147 ) , 
    .B1 ( n69 ) , .B2 ( n148 ) , .ZN ( n121 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U130 ( .A1 ( w[6] ) , .A2 ( n70 ) , 
    .ZN ( n71 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U131 ( .A1 ( n73 ) , .A2 ( w[7] ) , 
    .B1 ( n72 ) , .B2 ( n152 ) , .C ( n71 ) , .ZN ( n120 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U132 ( .A ( n76 ) , .B ( n75 ) , .CI ( n74 ) , 
    .CO ( intadd_0_A_4_ ) , .S ( intadd_0_A_3_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U133 ( .A ( n79 ) , .B ( n78 ) , .CI ( n77 ) , 
    .CO ( n80 ) , .S ( n54 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U134 ( .I ( n80 ) , .ZN ( intadd_0_B_3_ ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U135 ( .A1 ( x[5] ) , .A2 ( w[4] ) , 
    .B1 ( n203 ) , .B2 ( n8 ) , .ZN ( n126 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U136 ( .A1 ( n126 ) , .A2 ( n147 ) , 
    .B1 ( n81 ) , .B2 ( n148 ) , .ZN ( n124 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U137 ( .A1 ( w[7] ) , .A2 ( n82 ) , 
    .B1 ( n182 ) , .B2 ( n152 ) , .ZN ( n123 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U138 ( .A1 ( n113 ) , .A2 ( n112 ) , 
    .B1 ( n111 ) , .B2 ( n83 ) , .ZN ( n119 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U139 ( .A1 ( x[7] ) , .A2 ( n114 ) , 
    .B1 ( w[2] ) , .B2 ( n264 ) , .ZN ( n128 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U140 ( .A1 ( n117 ) , .A2 ( n128 ) , 
    .B1 ( n116 ) , .B2 ( n115 ) , .ZN ( n118 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U141 ( .A1 ( n119 ) , .A2 ( n118 ) , 
    .ZN ( n137 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U142 ( .A1 ( n119 ) , .A2 ( n118 ) , 
    .B ( n137 ) , .ZN ( n139 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U143 ( .A ( n122 ) , .B ( n121 ) , 
    .CI ( n120 ) , .CO ( n138 ) , .S ( n74 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U144 ( .A ( n125 ) , .B ( n124 ) , 
    .CI ( n123 ) , .CO ( n136 ) , .S ( n140 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U145 ( .A1 ( n127 ) , .A2 ( n147 ) , 
    .B1 ( n126 ) , .B2 ( n148 ) , .ZN ( n133 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U146 ( .A1 ( x[7] ) , .A2 ( w[3] ) , 
    .B1 ( n199 ) , .B2 ( n264 ) , .ZN ( n130 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U147 ( .I ( n128 ) , .ZN ( n129 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U148 ( .A1 ( n130 ) , .A2 ( n222 ) , 
    .B1 ( n129 ) , .B2 ( n223 ) , .ZN ( n132 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U149 ( .A1 ( n131 ) , .A2 ( n222 ) , 
    .B1 ( n130 ) , .B2 ( n223 ) , .ZN ( n143 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U150 ( .A ( n134 ) , .B ( n133 ) , 
    .CI ( n132 ) , .CO ( n142 ) , .S ( n135 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U151 ( .A ( n137 ) , .B ( n136 ) , 
    .CI ( n135 ) , .CO ( n212 ) , .S ( n174 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U152 ( .A ( n140 ) , .B ( n139 ) , 
    .CI ( n138 ) , .CO ( n172 ) , .S ( intadd_0_B_4_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U153 ( .A1 ( n174 ) , .A2 ( n172 ) , 
    .B1 ( n174 ) , .B2 ( intadd_0_n1 ) , .C1 ( n172 ) , .C2 ( intadd_0_n1 ) , 
    .ZN ( n211 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U154 ( .I ( n211 ) , .ZN ( n141 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U155 ( .A1 ( n212 ) , .A2 ( n214 ) , 
    .B1 ( n212 ) , .B2 ( n141 ) , .C1 ( n214 ) , .C2 ( n141 ) , .ZN ( n162 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U156 ( .A ( intadd_2_SUM_0_ ) , .B ( n143 ) , 
    .CI ( n142 ) , .CO ( n144 ) , .S ( n214 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U157 ( .I ( n144 ) , .ZN ( n161 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U158 ( .I ( intadd_2_SUM_1_ ) , .ZN ( n145 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U159 ( .A1 ( n161 ) , .A2 ( n162 ) , 
    .Z ( n163 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U160 ( .A1 ( n162 ) , .A2 ( n161 ) , 
    .B1 ( n145 ) , .B2 ( n163 ) , .ZN ( intadd_2_A_2_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U161 ( .A1 ( n148 ) , .A2 ( n147 ) , 
    .B ( n146 ) , .ZN ( n149 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U162 ( .I ( n149 ) , .ZN ( n157 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U163 ( .A1 ( x[7] ) , .A2 ( w[6] ) , 
    .B1 ( n150 ) , .B2 ( n264 ) , .ZN ( n153 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U164 ( .A1 ( n153 ) , .A2 ( n222 ) , 
    .B1 ( n151 ) , .B2 ( n223 ) , .ZN ( n156 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U165 ( .A1 ( n152 ) , .A2 ( x[7] ) , 
    .B1 ( n264 ) , .B2 ( w[7] ) , .ZN ( n221 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U166 ( .A1 ( n221 ) , .A2 ( n222 ) , 
    .B1 ( n153 ) , .B2 ( n223 ) , .ZN ( n227 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor3_1 ctmTdsLR_1_42 ( .A1 ( n228 ) , .A2 ( n227 ) , 
    .A3 ( intadd_2_n1 ) , .ZN ( n160 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor3_1 ctmTdsLR_1_152 ( .A1 ( n172 ) , 
    .A2 ( n174 ) , .A3 ( intadd_0_n1 ) , .ZN ( n176 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U170 ( .A ( n158 ) , .B ( n157 ) , 
    .CI ( n156 ) , .CO ( n228 ) , .S ( intadd_2_B_2_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U172 ( .I ( n235 ) , .ZN ( n202 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U173 ( .A1 ( exe_inst_in[0] ) , 
    .A2 ( exe_inst_in[1] ) , .ZN ( n204 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U174 ( .I ( n204 ) , .ZN ( n209 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U175 ( .A1 ( n209 ) , .A2 ( w[7] ) , 
    .B1 ( x[7] ) , .B2 ( n11 ) , .ZN ( n236 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U176 ( .A1 ( n160 ) , .A2 ( n202 ) , 
    .B ( n236 ) , .ZN ( intadd_1_A_2_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U177 ( .A1 ( intadd_2_SUM_2_ ) , 
    .A2 ( n202 ) , .B ( n236 ) , .ZN ( intadd_1_A_1_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U178 ( .A1 ( n162 ) , .A2 ( n161 ) , 
    .ZN ( n164 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U179 ( .A1 ( n164 ) , .A2 ( n163 ) , 
    .ZN ( n166 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U180 ( .A1 ( intadd_2_SUM_1_ ) , 
    .A2 ( n166 ) , .ZN ( n165 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U181 ( .A1 ( intadd_2_SUM_1_ ) , 
    .A2 ( n166 ) , .B ( n235 ) , .C ( n165 ) , .ZN ( n167 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U182 ( .A1 ( n236 ) , .A2 ( n167 ) , 
    .ZN ( intadd_1_A_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U183 ( .A1 ( vpu_res_out[6] ) , 
    .A2 ( n205 ) , .B1 ( w[6] ) , .B2 ( n210 ) , .ZN ( n170 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U184 ( .A1 ( n210 ) , .A2 ( n168 ) , 
    .B ( exe_inst_in[0] ) , .C ( n170 ) , .ZN ( n169 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U185 ( .A1 ( n170 ) , 
    .A2 ( exe_inst_in[0] ) , .B ( n169 ) , .ZN ( n301 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( n301 ) , .ZN ( n220 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor3_1 ctmTdsLR_1_38 ( .A1 ( n285 ) , .A2 ( n287 ) , 
    .A3 ( n284 ) , .ZN ( n289 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor3_1 ctmTdsLR_1_39 ( .A1 ( n293 ) , .A2 ( n291 ) , 
    .A3 ( n290 ) , .Z ( n295 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U191 ( .A1 ( n176 ) , .A2 ( n235 ) , 
    .B1 ( w[5] ) , .B2 ( n209 ) , .C1 ( n210 ) , .C2 ( x[5] ) , .ZN ( n291 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U192 ( .A1 ( n12 ) , .A2 ( n7 ) , 
    .B ( exe_inst_in[0] ) , .ZN ( n178 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U193 ( .A1 ( vpu_res_out[5] ) , 
    .A2 ( n205 ) , .B1 ( w[5] ) , .B2 ( n11 ) , .ZN ( n177 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U194 ( .I0 ( exe_inst_in[0] ) , .I1 ( n178 ) , 
    .S ( n177 ) , .Z ( n293 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U195 ( .A1 ( vpu_res_out[3] ) , 
    .A2 ( n205 ) , .B1 ( w[3] ) , .B2 ( n12 ) , .ZN ( n180 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U196 ( .A1 ( n11 ) , .A2 ( n9 ) , 
    .B ( n180 ) , .ZN ( n179 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U197 ( .I0 ( n180 ) , .I1 ( n179 ) , 
    .S ( exe_inst_in[0] ) , .Z ( n281 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U198 ( .A1 ( exe_inst_in[1] ) , 
    .A2 ( n182 ) , .B1 ( intadd_0_SUM_1_ ) , .B2 ( n202 ) , .ZN ( n181 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U199 ( .A1 ( n209 ) , .A2 ( w[1] ) , 
    .B ( n181 ) , .ZN ( n268 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U200 ( .A1 ( vpu_res_out[1] ) , 
    .A2 ( n205 ) , .B1 ( w[1] ) , .B2 ( n12 ) , .ZN ( n184 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U201 ( .A1 ( n11 ) , .A2 ( n182 ) , 
    .B ( n184 ) , .ZN ( n183 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U202 ( .I0 ( n184 ) , .I1 ( n183 ) , 
    .S ( exe_inst_in[0] ) , .Z ( n267 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U203 ( .A1 ( n11 ) , .A2 ( n3 ) , 
    .B1 ( n205 ) , .B2 ( vpu_res_out[0] ) , .C1 ( x[0] ) , .C2 ( n209 ) , 
    .ZN ( n244 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U204 ( .A1 ( n186 ) , .A2 ( n185 ) , 
    .ZN ( n189 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U205 ( .I0 ( n189 ) , .I1 ( n188 ) , 
    .S ( n187 ) , .Z ( n190 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U206 ( .A1 ( n190 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .Z ( n192 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U207 ( .A1 ( w[0] ) , .A2 ( n209 ) , 
    .B1 ( x[0] ) , .B2 ( n210 ) , .ZN ( n191 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U208 ( .A1 ( n202 ) , .A2 ( n192 ) , 
    .B ( n191 ) , .ZN ( n243 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U209 ( .I ( n244 ) , .ZN ( n193 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U210 ( .A1 ( n244 ) , 
    .A2 ( exe_inst_in[0] ) , .B1 ( n243 ) , .B2 ( n193 ) , .ZN ( n266 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U212 ( .A1 ( n194 ) , .A2 ( n235 ) , 
    .B1 ( n209 ) , .B2 ( w[2] ) , .C1 ( n210 ) , .C2 ( x[2] ) , .ZN ( n271 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U213 ( .A1 ( vpu_res_out[2] ) , 
    .A2 ( n205 ) , .B1 ( w[2] ) , .B2 ( n12 ) , .ZN ( n197 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U214 ( .A1 ( n11 ) , .A2 ( n195 ) , 
    .B ( n197 ) , .ZN ( n196 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U215 ( .I0 ( n197 ) , .I1 ( n196 ) , 
    .S ( exe_inst_in[0] ) , .Z ( n274 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U216 ( .A1 ( n272 ) , .A2 ( n271 ) , 
    .B1 ( n272 ) , .B2 ( n274 ) , .C1 ( n271 ) , .C2 ( n274 ) , .ZN ( n201 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 U217 ( .A1 ( n204 ) , .A2 ( n199 ) , 
    .B1 ( n198 ) , .B2 ( exe_inst_in[1] ) , .C1 ( n202 ) , 
    .C2 ( intadd_0_SUM_3_ ) , .ZN ( n200 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U218 ( .A1 ( n201 ) , .A2 ( n200 ) , 
    .ZN ( n277 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U219 ( .A1 ( n201 ) , .A2 ( n200 ) , 
    .ZN ( n279 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U220 ( .A1 ( n281 ) , .A2 ( n277 ) , 
    .B ( n279 ) , .ZN ( n285 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 U221 ( .A1 ( n204 ) , .A2 ( n203 ) , 
    .B1 ( n206 ) , .B2 ( exe_inst_in[1] ) , .C1 ( n202 ) , 
    .C2 ( intadd_0_SUM_4_ ) , .ZN ( n284 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U222 ( .A1 ( vpu_res_out[4] ) , 
    .A2 ( n205 ) , .B1 ( w[4] ) , .B2 ( n210 ) , .ZN ( n208 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U223 ( .A1 ( n206 ) , .A2 ( n12 ) , 
    .B ( exe_inst_in[0] ) , .C ( n208 ) , .ZN ( n207 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U224 ( .A1 ( n208 ) , 
    .A2 ( exe_inst_in[0] ) , .B ( n207 ) , .ZN ( n287 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U225 ( .A1 ( n285 ) , .A2 ( n284 ) , 
    .B1 ( n285 ) , .B2 ( n287 ) , .C1 ( n284 ) , .C2 ( n287 ) , .ZN ( n290 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U226 ( .A1 ( n291 ) , .A2 ( n293 ) , 
    .B1 ( n291 ) , .B2 ( n290 ) , .C1 ( n293 ) , .C2 ( n290 ) , .ZN ( n219 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U227 ( .A1 ( x[6] ) , .A2 ( n12 ) , 
    .B1 ( n209 ) , .B2 ( w[6] ) , .ZN ( n217 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U228 ( .A1 ( n212 ) , .A2 ( n211 ) , 
    .Z ( n215 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U229 ( .A1 ( n215 ) , .A2 ( n214 ) , 
    .ZN ( n213 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U230 ( .A1 ( n215 ) , .A2 ( n214 ) , 
    .B ( n235 ) , .C ( n213 ) , .ZN ( n216 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U231 ( .A1 ( n217 ) , .A2 ( n216 ) , 
    .ZN ( n218 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U232 ( .A1 ( n219 ) , .A2 ( n218 ) , 
    .ZN ( n299 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U233 ( .I ( n218 ) , .ZN ( n297 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U234 ( .I ( n219 ) , .ZN ( n296 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U235 ( .A1 ( n220 ) , .A2 ( n299 ) , 
    .B1 ( n297 ) , .B2 ( n296 ) , .ZN ( intadd_1_B_0_ ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U236 ( .A1 ( n223 ) , .A2 ( n222 ) , 
    .B ( n221 ) , .ZN ( n225 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U237 ( .A1 ( n227 ) , .A2 ( n228 ) , 
    .A3 ( intadd_2_n1 ) , .ZN ( n224 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U238 ( .A1 ( n228 ) , .A2 ( n227 ) , 
    .A3 ( intadd_2_n1 ) , .ZN ( n226 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U239 ( .A1 ( n225 ) , .A2 ( n224 ) , 
    .B ( n226 ) , .ZN ( n234 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U240 ( .I ( intadd_1_CI ) , .ZN ( n239 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U241 ( .A1 ( intadd_1_n1 ) , .A2 ( n239 ) , 
    .ZN ( n233 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U242 ( .I ( n225 ) , .ZN ( n231 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U243 ( .A1 ( n228 ) , .A2 ( n227 ) , 
    .A3 ( intadd_2_n1 ) , .B ( n226 ) , .ZN ( n230 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U244 ( .A1 ( n231 ) , .A2 ( n230 ) , 
    .ZN ( n229 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U245 ( .A1 ( n231 ) , .A2 ( n230 ) , 
    .B ( n235 ) , .C ( n229 ) , .ZN ( n232 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U246 ( .A1 ( n236 ) , .A2 ( n232 ) , 
    .Z ( n238 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U247 ( .A1 ( n235 ) , .A2 ( n234 ) , 
    .B1 ( n233 ) , .B2 ( n238 ) , .ZN ( n237 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U248 ( .A1 ( n237 ) , .A2 ( n236 ) , 
    .B1 ( intadd_1_n1 ) , .B2 ( n239 ) , .ZN ( n261 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor3_1 U249 ( .A1 ( n239 ) , .A2 ( intadd_1_n1 ) , 
    .A3 ( n238 ) , .Z ( n246 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U250 ( .A1 ( n246 ) , 
    .A2 ( intadd_1_SUM_1_ ) , .A3 ( intadd_1_SUM_2_ ) , 
    .A4 ( intadd_1_SUM_0_ ) , .ZN ( n240 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U251 ( .A1 ( n261 ) , .A2 ( n240 ) , 
    .ZN ( n242 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_2_24 ( .A1 ( n27 ) , .A2 ( n54 ) , 
    .B1 ( n27 ) , .B2 ( tmp_net30 ) , .C1 ( n54 ) , .C2 ( tmp_net30 ) , 
    .ZN ( intadd_0_n3 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U253 ( .A1 ( HFSNET_1 ) , 
    .A2 ( exe_inst_in[8] ) , .ZN ( n245 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U254 ( .A1 ( rst_n ) , 
    .A2 ( exe_inst_in_val ) , .ZN ( n323 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U255 ( .I ( n323 ) , .ZN ( n241 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U257 ( .A1 ( exe_inst_in[7] ) , 
    .A2 ( rst_n ) , .A3 ( n302 ) , .ZN ( n262 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U258 ( .A1 ( n242 ) , .A2 ( n262 ) , 
    .ZN ( n307 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U259 ( .A1 ( n244 ) , .A2 ( n243 ) , 
    .Z ( n250 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U260 ( .A1 ( n245 ) , .A2 ( n302 ) , 
    .ZN ( n303 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U261 ( .A1 ( x[0] ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[0] ) , .B2 ( n302 ) , .ZN ( n249 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U262 ( .I ( n261 ) , .ZN ( n248 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or4_1 U263 ( .A1 ( n246 ) , .A2 ( intadd_1_SUM_1_ ) , 
    .A3 ( intadd_1_SUM_2_ ) , .A4 ( intadd_1_SUM_0_ ) , .Z ( n247 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U264 ( .A1 ( n262 ) , .A2 ( n248 ) , 
    .A3 ( n247 ) , .ZN ( n304 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U265 ( .A1 ( n307 ) , .A2 ( n250 ) , 
    .B ( n249 ) , .C ( n304 ) , .ZN ( n110 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U266 ( .A1 ( input_data_val ) , 
    .A2 ( rst_n ) , .ZN ( n259 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U267 ( .A1 ( n259 ) , .A2 ( rst_n ) , 
    .ZN ( n258 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U268 ( .A1 ( x[0] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[0] ) , .ZN ( n251 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U269 ( .I ( n251 ) , .ZN ( n109 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U270 ( .A1 ( x[1] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[1] ) , .ZN ( n252 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U271 ( .I ( n252 ) , .ZN ( n108 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U272 ( .A1 ( x[2] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[2] ) , .ZN ( n253 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U273 ( .I ( n253 ) , .ZN ( n107 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U274 ( .A1 ( x[3] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[3] ) , .ZN ( n254 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U275 ( .I ( n254 ) , .ZN ( n106 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U276 ( .A1 ( x[4] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[4] ) , .ZN ( n255 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U277 ( .I ( n255 ) , .ZN ( n105 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U278 ( .A1 ( x[5] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[5] ) , .ZN ( n256 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U279 ( .I ( n256 ) , .ZN ( n104 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U280 ( .A1 ( x[6] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[6] ) , .ZN ( n257 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U281 ( .I ( n257 ) , .ZN ( n103 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U282 ( .A1 ( x[7] ) , .A2 ( n259 ) , 
    .B1 ( n258 ) , .B2 ( input_data[7] ) , .ZN ( n260 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U283 ( .I ( n260 ) , .ZN ( n102 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U284 ( .I ( n303 ) , .ZN ( n265 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U285 ( .A1 ( n262 ) , .A2 ( n261 ) , 
    .B1 ( vpu_res_out[7] ) , .B2 ( n302 ) , .ZN ( n263 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U286 ( .A1 ( n265 ) , .A2 ( n264 ) , 
    .B ( n263 ) , .ZN ( n101 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U287 ( .A ( n268 ) , .B ( n267 ) , 
    .CI ( n266 ) , .CO ( n272 ) , .S ( n270 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U288 ( .A1 ( x[1] ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[1] ) , .B2 ( n302 ) , .ZN ( n269 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U289 ( .A1 ( n270 ) , .A2 ( n307 ) , 
    .B ( n269 ) , .C ( n304 ) , .ZN ( n100 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U292 ( .A1 ( x[2] ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[2] ) , .B2 ( n302 ) , .ZN ( n275 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U293 ( .A1 ( n307 ) , .A2 ( n276 ) , 
    .B ( n275 ) , .C ( n304 ) , .ZN ( n99 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U294 ( .I ( n277 ) , .ZN ( n278 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U295 ( .A1 ( n279 ) , .A2 ( n278 ) , 
    .ZN ( n280 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U296 ( .A1 ( n281 ) , .A2 ( n280 ) , 
    .Z ( n283 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U297 ( .A1 ( n10 ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[3] ) , .B2 ( n302 ) , .ZN ( n282 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U298 ( .A1 ( n307 ) , .A2 ( n283 ) , 
    .B ( n282 ) , .C ( n304 ) , .ZN ( n98 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U301 ( .A1 ( x[4] ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[4] ) , .B2 ( n302 ) , .ZN ( n288 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U302 ( .A1 ( n307 ) , .A2 ( n289 ) , 
    .B ( n288 ) , .C ( n304 ) , .ZN ( n97 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U305 ( .A1 ( n4 ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[5] ) , .B2 ( n302 ) , .ZN ( n294 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U306 ( .A1 ( n307 ) , .A2 ( n295 ) , 
    .B ( n294 ) , .C ( n304 ) , .ZN ( n96 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U307 ( .A1 ( n297 ) , .A2 ( n296 ) , 
    .ZN ( n298 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U308 ( .A1 ( n299 ) , .A2 ( n298 ) , 
    .ZN ( n300 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U309 ( .A1 ( n301 ) , .A2 ( n300 ) , 
    .Z ( n306 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U310 ( .A1 ( x[6] ) , .A2 ( n303 ) , 
    .B1 ( vpu_res_out[6] ) , .B2 ( n302 ) , .ZN ( n305 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U311 ( .A1 ( n307 ) , .A2 ( n306 ) , 
    .B ( n305 ) , .C ( n304 ) , .ZN ( n95 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U312 ( .A1 ( weight_data_val ) , 
    .A2 ( rst_n ) , .ZN ( n317 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U313 ( .A1 ( n317 ) , .A2 ( rst_n ) , 
    .ZN ( n316 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U314 ( .A1 ( n3 ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[0] ) , .ZN ( n309 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U315 ( .I ( n309 ) , .ZN ( n94 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U316 ( .A1 ( w[1] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[1] ) , .ZN ( n310 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U317 ( .I ( n310 ) , .ZN ( n93 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U318 ( .A1 ( w[2] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[2] ) , .ZN ( n311 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U319 ( .I ( n311 ) , .ZN ( n92 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U320 ( .A1 ( w[3] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[3] ) , .ZN ( n312 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U321 ( .I ( n312 ) , .ZN ( n91 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U322 ( .A1 ( w[4] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[4] ) , .ZN ( n313 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U323 ( .I ( n313 ) , .ZN ( n90 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U324 ( .A1 ( w[5] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[5] ) , .ZN ( n314 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U325 ( .I ( n314 ) , .ZN ( n89 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U326 ( .A1 ( w[6] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[6] ) , .ZN ( n315 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U327 ( .I ( n315 ) , .ZN ( n88 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U328 ( .A1 ( w[7] ) , .A2 ( n317 ) , 
    .B1 ( n316 ) , .B2 ( weight_data[7] ) , .ZN ( n318 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U329 ( .I ( n318 ) , .ZN ( n87 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U330 ( .I ( exe_inst_in[8] ) , .ZN ( n319 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U331 ( .A1 ( HFSNET_1 ) , 
    .A2 ( exe_inst_in_val ) , .ZN ( n325 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U332 ( .A1 ( exe_inst_in[7] ) , 
    .A2 ( n319 ) , .B ( n325 ) , .ZN ( n322 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U333 ( .A1 ( n323 ) , .A2 ( act_op_out[2] ) , 
    .B1 ( n322 ) , .B2 ( exe_inst_in[5] ) , .ZN ( n320 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U334 ( .I ( n320 ) , .ZN ( n86 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U335 ( .A1 ( n323 ) , .A2 ( act_op_out[1] ) , 
    .B1 ( n322 ) , .B2 ( exe_inst_in[4] ) , .ZN ( n321 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U336 ( .I ( n321 ) , .ZN ( n85 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U337 ( .A1 ( n323 ) , .A2 ( act_op_out[0] ) , 
    .B1 ( n322 ) , .B2 ( exe_inst_in[3] ) , .ZN ( n324 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U338 ( .I ( n324 ) , .ZN ( n84 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U339 ( .I ( n325 ) , .ZN ( N132 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor3_1 ctmTdsLR_3_25 ( .A1 ( n27 ) , .A2 ( n54 ) , 
    .A3 ( intadd_0_n4 ) , .ZN ( n194 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module mem_ctrl ( clk , rst_n , mem_inst_in , mem_inst_in_val , mem_rdy , 
    mem_itf_rdy , read_en , write_en , copy_en , src_addr , dst_addr , 
    write_data , read_data , read_data_val , weight_data , weight_data_val , 
    input_data , input_data_val , act_res_in , VDD , VSS , HFSNET_1 , 
    ZCTSNET_0 , ZCTSNET_1 , ZCTSNET_2 ) ;
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
input  VDD ;
input  VSS ;
input  HFSNET_1 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;
input  ZCTSNET_2 ;

wire tmp_net78 ;
wire tmp_net79 ;
wire tmp_net80 ;
wire tmp_net87 ;
wire tmp_net88 ;
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
wire tmp_net89 ;
wire tmp_net90 ;
wire tmp_net91 ;
wire tmp_net92 ;
wire n11 ;
wire n12 ;
wire HFSNET_0 ;
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
wire n75 ;
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
wire n175 ;
wire [2:0] state ;
supply1 VDD ;
supply0 VSS ;

assign write_data[7] = act_res_in[7] ;
assign write_data[6] = act_res_in[6] ;
assign write_data[5] = act_res_in[5] ;
assign write_data[4] = act_res_in[4] ;
assign write_data[3] = act_res_in[3] ;
assign write_data[2] = act_res_in[2] ;
assign write_data[1] = act_res_in[1] ;
assign write_data[0] = act_res_in[0] ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n150 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 force_weight_reg ( .D ( n149 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( force_weight ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n147 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_2_ ( .D ( n148 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( state[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_0_ ( .D ( n146 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_12_ ( .D ( n145 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[12] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_11_ ( .D ( n144 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[11] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_10_ ( .D ( n143 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[10] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_9_ ( .D ( n142 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[9] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_8_ ( .D ( n141 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[8] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_7_ ( .D ( n140 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_6_ ( .D ( n139 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_5_ ( .D ( n138 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_4_ ( .D ( n137 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_3_ ( .D ( n136 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_2_ ( .D ( n135 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_1_ ( .D ( n134 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_0_ ( .D ( n121 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_12_ ( .D ( n120 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[12] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_11_ ( .D ( n119 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[11] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_10_ ( .D ( n118 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[10] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_9_ ( .D ( n117 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[9] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_8_ ( .D ( n116 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[8] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_7_ ( .D ( n115 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_6_ ( .D ( n114 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_5_ ( .D ( n113 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_4_ ( .D ( n112 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_3_ ( .D ( n111 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_2_ ( .D ( n110 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_1_ ( .D ( n109 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_13_ ( .D ( n133 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[13] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_24_ ( .D ( n132 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[24] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_23_ ( .D ( n131 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[23] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_22_ ( .D ( n130 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[22] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_21_ ( .D ( n129 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[21] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_20_ ( .D ( n128 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[20] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_19_ ( .D ( n127 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[19] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_18_ ( .D ( n126 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[18] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_17_ ( .D ( n125 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( src_addr[17] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_16_ ( .D ( n124 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[16] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_15_ ( .D ( n123 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[15] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 src_addr_reg_14_ ( .D ( n122 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( src_addr[14] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_13_ ( .D ( n108 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[13] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_24_ ( .D ( n107 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[24] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_23_ ( .D ( n106 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[23] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_22_ ( .D ( n105 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[22] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_21_ ( .D ( n104 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( dst_addr[21] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_20_ ( .D ( n103 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[20] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_19_ ( .D ( n102 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[19] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_18_ ( .D ( n101 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[18] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_17_ ( .D ( n100 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( dst_addr[17] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_16_ ( .D ( n99 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[16] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_15_ ( .D ( n98 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[15] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 dst_addr_reg_14_ ( .D ( n97 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( dst_addr[14] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_204 ( .A1 ( n29 ) , .A2 ( n30 ) , 
    .B ( tmp_net79 ) , .ZN ( n149 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_205 ( .A1 ( n29 ) , 
    .A2 ( tmp_net78 ) , .ZN ( tmp_net79 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_3_206 ( .A1 ( rst_n ) , 
    .A2 ( n171 ) , .ZN ( tmp_net78 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_207 ( .A1 ( n92 ) , 
    .A2 ( tmp_net80 ) , .B ( HFSNET_1 ) , .ZN ( n43 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_208 ( .A1 ( mem_inst_in[14] ) , 
    .A2 ( mem_inst_in[13] ) , .Z ( tmp_net80 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_218 ( .A1 ( tmp_net87 ) , 
    .A2 ( tmp_net89 ) , .ZN ( n148 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_219 ( .A1 ( n37 ) , .A2 ( n36 ) , 
    .Z ( tmp_net87 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_220 ( .A1 ( n37 ) , 
    .A2 ( tmp_net88 ) , .ZN ( tmp_net89 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_4_221 ( .A1 ( n32 ) , .A2 ( n33 ) , 
    .ZN ( tmp_net88 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_222 ( .A1 ( tmp_net92 ) , 
    .A2 ( HFSNET_1 ) , .ZN ( n72 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U13 ( .I ( n43 ) , .ZN ( n11 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U14 ( .I ( n75 ) , .ZN ( n12 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_541_5 ( .I ( n173 ) , .Z ( HFSNET_0 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( read_data[5] ) , .ZN ( n21 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( read_data[0] ) , .ZN ( n16 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( read_data[6] ) , .ZN ( n15 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( n19 ) , .ZN ( input_data[3] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n16 ) , .ZN ( input_data[0] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( n15 ) , .ZN ( input_data[6] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_223 ( .A1 ( tmp_net90 ) , 
    .A2 ( tmp_net91 ) , .ZN ( tmp_net92 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_224 ( .I ( n92 ) , 
    .ZN ( tmp_net90 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_225 ( .I ( n59 ) , 
    .ZN ( tmp_net91 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( read_data[7] ) , .ZN ( n14 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( n14 ) , .ZN ( weight_data[7] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U32 ( .I ( n14 ) , .ZN ( input_data[7] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( n15 ) , .ZN ( weight_data[6] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( n16 ) , .ZN ( weight_data[0] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U35 ( .I ( read_data[1] ) , .ZN ( n17 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( n17 ) , .ZN ( weight_data[1] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U37 ( .I ( n17 ) , .ZN ( input_data[1] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( read_data[2] ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U39 ( .I ( n18 ) , .ZN ( weight_data[2] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( n18 ) , .ZN ( input_data[2] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( read_data[3] ) , .ZN ( n19 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( n19 ) , .ZN ( weight_data[3] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U43 ( .I ( read_data[4] ) , .ZN ( n20 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( n20 ) , .ZN ( weight_data[4] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U45 ( .I ( n20 ) , .ZN ( input_data[4] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U46 ( .I ( n21 ) , .ZN ( weight_data[5] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U47 ( .I ( n21 ) , .ZN ( input_data[5] ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( state[1] ) , .ZN ( n23 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U49 ( .I ( state[0] ) , .ZN ( n28 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U50 ( .A1 ( n23 ) , .A2 ( n28 ) , 
    .ZN ( n24 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U51 ( .A1 ( state[2] ) , .A2 ( n24 ) , 
    .ZN ( mem_rdy ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U52 ( .I ( force_weight ) , .ZN ( n30 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( src_addr[24] ) , .ZN ( n61 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U56 ( .I ( n24 ) , .ZN ( n33 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U57 ( .A1 ( HFSNET_1 ) , .A2 ( state[2] ) , 
    .A3 ( read_data_val ) , .A4 ( n33 ) , .ZN ( n22 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U58 ( .A1 ( src_addr[23] ) , .A2 ( n30 ) , 
    .B1 ( n61 ) , .B2 ( n30 ) , .C ( n22 ) , .ZN ( weight_data_val ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( src_addr[23] ) , .ZN ( n62 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U60 ( .A1 ( force_weight ) , .A2 ( n62 ) , 
    .A3 ( n61 ) , .A4 ( n22 ) , .ZN ( input_data_val ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( state[2] ) , .ZN ( n36 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U62 ( .A1 ( HFSNET_1 ) , .A2 ( n36 ) , 
    .ZN ( n32 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U63 ( .A1 ( state[1] ) , .A2 ( n28 ) , 
    .A3 ( n32 ) , .ZN ( read_en ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U64 ( .A1 ( state[0] ) , .A2 ( n23 ) , 
    .A3 ( n32 ) , .ZN ( write_en ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U65 ( .A1 ( n23 ) , .A2 ( n28 ) , 
    .A3 ( n32 ) , .ZN ( copy_en ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U66 ( .A1 ( read_data_val ) , .A2 ( n28 ) , 
    .B ( state[1] ) , .ZN ( n25 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U67 ( .A1 ( mem_rdy ) , 
    .A2 ( mem_inst_in_val ) , .ZN ( n41 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U68 ( .A1 ( mem_inst_in[15] ) , .A2 ( n41 ) , 
    .B ( HFSNET_1 ) , .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U69 ( .A1 ( mem_itf_rdy ) , .A2 ( n24 ) , 
    .B ( n29 ) , .ZN ( n35 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U70 ( .A1 ( n25 ) , .A2 ( n36 ) , 
    .B ( n35 ) , .ZN ( n37 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U71 ( .I ( mem_inst_in[13] ) , .ZN ( n94 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U72 ( .A1 ( mem_inst_in[14] ) , .A2 ( n94 ) , 
    .ZN ( n59 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U73 ( .A1 ( mem_rdy ) , .A2 ( n59 ) , 
    .B1 ( state[1] ) , .B2 ( n36 ) , .ZN ( n27 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U74 ( .A1 ( n37 ) , .A2 ( HFSNET_1 ) , 
    .ZN ( n26 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U75 ( .A1 ( n37 ) , .A2 ( n28 ) , 
    .B1 ( n27 ) , .B2 ( n26 ) , .ZN ( n150 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U77 ( .I ( mem_inst_in[2] ) , .ZN ( n171 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U81 ( .A1 ( n36 ) , .A2 ( state[1] ) , 
    .A3 ( n35 ) , .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U83 ( .I ( mem_inst_in[14] ) , .ZN ( n93 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U84 ( .A1 ( mem_inst_in[13] ) , .A2 ( n93 ) , 
    .ZN ( n74 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U85 ( .A1 ( mem_rdy ) , .A2 ( HFSNET_1 ) , 
    .A3 ( n37 ) , .A4 ( n74 ) , .ZN ( n39 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U86 ( .A1 ( n40 ) , .A2 ( n39 ) , 
    .ZN ( n147 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U87 ( .I ( n41 ) , .ZN ( n42 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U88 ( .A1 ( n42 ) , .A2 ( mem_inst_in[15] ) , 
    .ZN ( n92 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U90 ( .I ( n43 ) , .ZN ( n57 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U91 ( .A1 ( rst_n ) , .A2 ( n57 ) , 
    .ZN ( n56 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U92 ( .A1 ( n57 ) , .A2 ( src_addr[0] ) , 
    .B1 ( mem_inst_in[0] ) , .B2 ( n56 ) , .ZN ( n44 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U93 ( .I ( n44 ) , .ZN ( n146 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U94 ( .A1 ( n57 ) , .A2 ( src_addr[12] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[12] ) , .ZN ( n45 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U95 ( .I ( n45 ) , .ZN ( n145 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U96 ( .A1 ( n57 ) , .A2 ( src_addr[11] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[11] ) , .ZN ( n46 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U97 ( .I ( n46 ) , .ZN ( n144 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U98 ( .A1 ( n57 ) , .A2 ( src_addr[10] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[10] ) , .ZN ( n47 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U99 ( .I ( n47 ) , .ZN ( n143 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U100 ( .A1 ( n57 ) , .A2 ( src_addr[9] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[9] ) , .ZN ( n48 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U101 ( .I ( n48 ) , .ZN ( n142 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U102 ( .A1 ( n57 ) , .A2 ( src_addr[8] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[8] ) , .ZN ( n49 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U103 ( .I ( n49 ) , .ZN ( n141 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U104 ( .A1 ( n57 ) , .A2 ( src_addr[7] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[7] ) , .ZN ( n50 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U105 ( .I ( n50 ) , .ZN ( n140 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U106 ( .A1 ( n57 ) , .A2 ( src_addr[6] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[6] ) , .ZN ( n51 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U107 ( .I ( n51 ) , .ZN ( n139 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U108 ( .A1 ( n57 ) , .A2 ( src_addr[5] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[5] ) , .ZN ( n52 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U109 ( .I ( n52 ) , .ZN ( n138 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U110 ( .A1 ( n11 ) , .A2 ( src_addr[4] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[4] ) , .ZN ( n53 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U111 ( .I ( n53 ) , .ZN ( n137 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U112 ( .A1 ( n11 ) , .A2 ( src_addr[3] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[3] ) , .ZN ( n54 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U113 ( .I ( n54 ) , .ZN ( n136 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U114 ( .A1 ( n11 ) , .A2 ( src_addr[2] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[2] ) , .ZN ( n55 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U115 ( .I ( n55 ) , .ZN ( n135 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U116 ( .A1 ( n11 ) , .A2 ( src_addr[1] ) , 
    .B1 ( n56 ) , .B2 ( mem_inst_in[1] ) , .ZN ( n58 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U117 ( .I ( n58 ) , .ZN ( n134 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( mem_inst_in[0] ) , .ZN ( n151 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U120 ( .A1 ( HFSNET_1 ) , .A2 ( n72 ) , 
    .ZN ( n73 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U121 ( .I ( src_addr[13] ) , .ZN ( n60 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U122 ( .A1 ( n151 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n60 ) , .ZN ( n133 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U123 ( .I ( mem_inst_in[11] ) , .ZN ( n153 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U124 ( .A1 ( n153 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n61 ) , .ZN ( n132 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( mem_inst_in[10] ) , .ZN ( n155 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U126 ( .A1 ( n155 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n62 ) , .ZN ( n131 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U127 ( .I ( mem_inst_in[9] ) , .ZN ( n157 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U128 ( .I ( src_addr[22] ) , .ZN ( n63 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U129 ( .A1 ( n72 ) , .A2 ( n63 ) , 
    .B1 ( n73 ) , .B2 ( n157 ) , .ZN ( n130 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U130 ( .I ( mem_inst_in[8] ) , .ZN ( n159 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U131 ( .I ( src_addr[21] ) , .ZN ( n64 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U132 ( .A1 ( n159 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n64 ) , .ZN ( n129 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U133 ( .I ( mem_inst_in[7] ) , .ZN ( n161 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U134 ( .I ( src_addr[20] ) , .ZN ( n65 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U135 ( .A1 ( n72 ) , .A2 ( n65 ) , 
    .B1 ( n73 ) , .B2 ( n161 ) , .ZN ( n128 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U136 ( .I ( mem_inst_in[6] ) , .ZN ( n163 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U137 ( .I ( src_addr[19] ) , .ZN ( n66 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U138 ( .A1 ( n163 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n66 ) , .ZN ( n127 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U139 ( .I ( mem_inst_in[5] ) , .ZN ( n165 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U140 ( .I ( src_addr[18] ) , .ZN ( n67 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U141 ( .A1 ( n165 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n67 ) , .ZN ( n126 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U142 ( .I ( mem_inst_in[4] ) , .ZN ( n167 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U143 ( .I ( src_addr[17] ) , .ZN ( n68 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U144 ( .A1 ( n167 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n68 ) , .ZN ( n125 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U145 ( .I ( mem_inst_in[3] ) , .ZN ( n169 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U146 ( .I ( src_addr[16] ) , .ZN ( n69 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U147 ( .A1 ( n169 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n69 ) , .ZN ( n124 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U148 ( .I ( src_addr[15] ) , .ZN ( n70 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U149 ( .A1 ( n171 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n70 ) , .ZN ( n123 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U150 ( .I ( mem_inst_in[1] ) , .ZN ( n175 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U151 ( .I ( src_addr[14] ) , .ZN ( n71 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U152 ( .A1 ( n175 ) , .A2 ( n73 ) , 
    .B1 ( n72 ) , .B2 ( n71 ) , .ZN ( n122 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U153 ( .A1 ( n74 ) , .A2 ( n92 ) , 
    .B ( HFSNET_1 ) , .ZN ( n75 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U154 ( .I ( n75 ) , .ZN ( n89 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U155 ( .A1 ( rst_n ) , .A2 ( n89 ) , 
    .ZN ( n90 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U156 ( .A1 ( mem_inst_in[0] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[0] ) , .ZN ( n77 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U157 ( .I ( n77 ) , .ZN ( n121 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U158 ( .A1 ( mem_inst_in[12] ) , 
    .A2 ( n90 ) , .B1 ( n89 ) , .B2 ( dst_addr[12] ) , .ZN ( n78 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U159 ( .I ( n78 ) , .ZN ( n120 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U160 ( .A1 ( mem_inst_in[11] ) , 
    .A2 ( n90 ) , .B1 ( n89 ) , .B2 ( dst_addr[11] ) , .ZN ( n79 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U161 ( .I ( n79 ) , .ZN ( n119 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U162 ( .A1 ( mem_inst_in[10] ) , 
    .A2 ( n90 ) , .B1 ( n89 ) , .B2 ( dst_addr[10] ) , .ZN ( n80 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U163 ( .I ( n80 ) , .ZN ( n118 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U164 ( .A1 ( mem_inst_in[9] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[9] ) , .ZN ( n81 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U165 ( .I ( n81 ) , .ZN ( n117 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U166 ( .A1 ( mem_inst_in[8] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[8] ) , .ZN ( n82 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U167 ( .I ( n82 ) , .ZN ( n116 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U168 ( .A1 ( mem_inst_in[7] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[7] ) , .ZN ( n83 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U169 ( .I ( n83 ) , .ZN ( n115 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U170 ( .A1 ( mem_inst_in[6] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[6] ) , .ZN ( n84 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U171 ( .I ( n84 ) , .ZN ( n114 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U172 ( .A1 ( mem_inst_in[5] ) , .A2 ( n90 ) , 
    .B1 ( n89 ) , .B2 ( dst_addr[5] ) , .ZN ( n85 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U173 ( .I ( n85 ) , .ZN ( n113 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U174 ( .A1 ( mem_inst_in[4] ) , .A2 ( n90 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[4] ) , .ZN ( n86 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U175 ( .I ( n86 ) , .ZN ( n112 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U176 ( .A1 ( mem_inst_in[3] ) , .A2 ( n90 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[3] ) , .ZN ( n87 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U177 ( .I ( n87 ) , .ZN ( n111 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U178 ( .A1 ( mem_inst_in[2] ) , .A2 ( n90 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[2] ) , .ZN ( n88 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U179 ( .I ( n88 ) , .ZN ( n110 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U180 ( .A1 ( mem_inst_in[1] ) , .A2 ( n90 ) , 
    .B1 ( n12 ) , .B2 ( dst_addr[1] ) , .ZN ( n91 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U181 ( .I ( n91 ) , .ZN ( n109 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U182 ( .A1 ( n94 ) , .A2 ( n93 ) , 
    .A3 ( n92 ) , .B ( HFSNET_1 ) , .ZN ( n173 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U183 ( .A1 ( HFSNET_1 ) , .A2 ( HFSNET_0 ) , 
    .ZN ( n174 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U184 ( .I ( dst_addr[13] ) , .ZN ( n96 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U185 ( .A1 ( n151 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n96 ) , .ZN ( n108 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( dst_addr[24] ) , .ZN ( n152 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U187 ( .A1 ( HFSNET_0 ) , .A2 ( n152 ) , 
    .B1 ( n174 ) , .B2 ( n153 ) , .ZN ( n107 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U188 ( .I ( dst_addr[23] ) , .ZN ( n154 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U189 ( .A1 ( n155 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n154 ) , .ZN ( n106 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U190 ( .I ( dst_addr[22] ) , .ZN ( n156 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U191 ( .A1 ( n157 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n156 ) , .ZN ( n105 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U192 ( .I ( dst_addr[21] ) , .ZN ( n158 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U193 ( .A1 ( n159 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n158 ) , .ZN ( n104 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U194 ( .I ( dst_addr[20] ) , .ZN ( n160 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U195 ( .A1 ( n161 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n160 ) , .ZN ( n103 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U196 ( .I ( dst_addr[19] ) , .ZN ( n162 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U197 ( .A1 ( n163 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n162 ) , .ZN ( n102 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U198 ( .I ( dst_addr[18] ) , .ZN ( n164 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U199 ( .A1 ( n165 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n164 ) , .ZN ( n101 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U200 ( .I ( dst_addr[17] ) , .ZN ( n166 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U201 ( .A1 ( HFSNET_0 ) , .A2 ( n166 ) , 
    .B1 ( n174 ) , .B2 ( n167 ) , .ZN ( n100 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U202 ( .I ( dst_addr[16] ) , .ZN ( n168 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U203 ( .A1 ( n169 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n168 ) , .ZN ( n99 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U204 ( .I ( dst_addr[15] ) , .ZN ( n170 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U205 ( .A1 ( n171 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n170 ) , .ZN ( n98 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U206 ( .I ( dst_addr[14] ) , .ZN ( n172 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U207 ( .A1 ( n175 ) , .A2 ( n174 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( n172 ) , .ZN ( n97 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
endmodule


module decoder ( rst_n , inst_in , inst_in_val , core_rdy , mem_rdy , 
    exe_rdy , mem_inst_out , mem_inst_out_val , exe_inst_out , 
    exe_inst_out_val , VDD , VSS , HFSNET_0 ) ;
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
input  VDD ;
input  VSS ;
input  HFSNET_0 ;

wire tmp_net32 ;
wire tmp_net44 ;
wire tmp_net45 ;
wire tmp_net46 ;
wire tmp_net47 ;
wire tmp_net48 ;
supply1 VDD ;
wire n3 ;
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
wire n16 ;
wire n17 ;
wire n18 ;
wire n19 ;
wire n20 ;
wire n21 ;
supply0 VSS ;

assign mem_inst_out[8] = inst_in[8] ;
assign mem_inst_out[7] = inst_in[7] ;
assign mem_inst_out[6] = inst_in[6] ;
assign mem_inst_out[5] = inst_in[5] ;
assign mem_inst_out[4] = inst_in[4] ;
assign mem_inst_out[3] = inst_in[3] ;
assign mem_inst_out[2] = inst_in[2] ;
assign mem_inst_out[1] = inst_in[1] ;
assign mem_inst_out[0] = inst_in[0] ;

gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_1_28 ( .I ( inst_in[14] ) , 
    .ZN ( tmp_net32 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or4_1 ctmTdsLR_2_29 ( .A1 ( mem_inst_out[15] ) , 
    .A2 ( tmp_net32 ) , .A3 ( inst_in[13] ) , .A4 ( inst_in[12] ) , 
    .Z ( n6 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_1_157 ( .I ( tmp_net48 ) , 
    .ZN ( core_rdy ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 ctmTdsLR_2_158 ( .A1 ( tmp_net44 ) , 
    .A2 ( tmp_net45 ) , .B ( tmp_net46 ) , .C ( tmp_net47 ) , 
    .ZN ( tmp_net48 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_159 ( .I ( n10 ) , 
    .ZN ( tmp_net44 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_160 ( .I ( n9 ) , 
    .ZN ( tmp_net45 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_5_161 ( .I ( n7 ) , 
    .ZN ( tmp_net46 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_6_162 ( .I ( rst_n ) , 
    .ZN ( tmp_net47 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( inst_in[15] ) , .ZN ( n21 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( inst_in[11] ) , .ZN ( n20 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .ZN ( mem_inst_out[15] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( inst_in[10] ) , .ZN ( n19 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U20 ( .A1 ( n19 ) , .A2 ( n6 ) , 
    .ZN ( exe_inst_out[8] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( inst_in[9] ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U22 ( .A1 ( n18 ) , .A2 ( n6 ) , 
    .ZN ( exe_inst_out[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U23 ( .A1 ( exe_inst_out[8] ) , 
    .A2 ( exe_inst_out[7] ) , .ZN ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U24 ( .A1 ( n17 ) , .A2 ( mem_inst_out[1] ) , 
    .Z ( exe_inst_out[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U25 ( .A1 ( n17 ) , .A2 ( mem_inst_out[0] ) , 
    .Z ( exe_inst_out[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U26 ( .I ( exe_rdy ) , .ZN ( n3 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U28 ( .A1 ( HFSNET_0 ) , 
    .A2 ( inst_in_val ) , .ZN ( n13 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U29 ( .A1 ( n3 ) , .A2 ( n6 ) , .A3 ( n13 ) , 
    .ZN ( exe_inst_out_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U30 ( .A1 ( inst_in[14] ) , 
    .A2 ( inst_in[13] ) , .A3 ( inst_in[12] ) , .A4 ( n19 ) , .ZN ( n4 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U31 ( .A1 ( inst_in[9] ) , .A2 ( mem_rdy ) , 
    .B ( n20 ) , .C ( n4 ) , .ZN ( n10 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U32 ( .A1 ( inst_in[15] ) , .A2 ( exe_rdy ) , 
    .B ( n18 ) , .ZN ( n9 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U33 ( .A1 ( inst_in[14] ) , 
    .A2 ( inst_in[13] ) , .A3 ( inst_in[12] ) , .A4 ( inst_in[11] ) , 
    .ZN ( n5 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U34 ( .A1 ( inst_in[15] ) , .A2 ( n5 ) , 
    .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U35 ( .A1 ( mem_rdy ) , .A2 ( n15 ) , 
    .B1 ( exe_rdy ) , .B2 ( n6 ) , .ZN ( n7 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( inst_in[13] ) , .ZN ( n11 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U37 ( .A1 ( inst_in[15] ) , .A2 ( n11 ) , 
    .B1 ( n18 ) , .B2 ( n21 ) , .ZN ( mem_inst_out[13] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( inst_in[14] ) , .ZN ( n12 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U39 ( .A1 ( inst_in[15] ) , .A2 ( n12 ) , 
    .B1 ( n19 ) , .B2 ( n21 ) , .ZN ( mem_inst_out[14] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( mem_rdy ) , .ZN ( n14 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U41 ( .A1 ( n15 ) , .A2 ( n14 ) , 
    .A3 ( n13 ) , .ZN ( mem_inst_out_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U42 ( .A1 ( n17 ) , .A2 ( mem_inst_out[2] ) , 
    .Z ( exe_inst_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U43 ( .A1 ( exe_inst_out[7] ) , .A2 ( n19 ) , 
    .ZN ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U44 ( .A1 ( mem_inst_out[3] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U45 ( .A1 ( mem_inst_out[4] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U46 ( .A1 ( mem_inst_out[5] ) , .A2 ( n16 ) , 
    .Z ( exe_inst_out[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U48 ( .A1 ( n18 ) , .A2 ( n21 ) , 
    .ZN ( mem_inst_out[9] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n21 ) , .A2 ( n19 ) , 
    .ZN ( mem_inst_out[10] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .ZN ( mem_inst_out[11] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U51 ( .A1 ( inst_in[15] ) , 
    .A2 ( inst_in[12] ) , .Z ( mem_inst_out[12] ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
endmodule


module inst_fifo_WORD_WIDTH16 ( clk , rst_n , inst , inst_val , fifo_rdy , 
    core_rdy , inst_out , inst_out_val , VDD , VSS , ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  [15:0] inst ;
input  inst_val ;
output fifo_rdy ;
input  core_rdy ;
output [15:0] inst_out ;
output inst_out_val ;
input  VDD ;
input  VSS ;
input  ZCTSNET_0 ;

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
wire tmp_net60 ;
wire n3 ;
wire n4 ;
wire n23 ;
wire n24 ;
supply1 VDD ;
supply0 VSS ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 count_reg_0_ ( .D ( n22 ) , .CLK ( clk ) , 
    .Q ( count_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__0_ ( .D ( n21 ) , .CLK ( clk ) , 
    .Q ( inst_out[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__1_ ( .D ( n20 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__2_ ( .D ( n19 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__3_ ( .D ( n18 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__4_ ( .D ( n17 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__5_ ( .D ( n16 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__6_ ( .D ( n15 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__7_ ( .D ( n14 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__8_ ( .D ( n13 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[8] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__9_ ( .D ( n12 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[9] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__10_ ( .D ( n11 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[10] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__11_ ( .D ( n10 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[11] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__12_ ( .D ( n9 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[12] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__13_ ( .D ( n8 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[13] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__14_ ( .D ( n7 ) , .CLK ( clk ) , 
    .Q ( inst_out[14] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__15_ ( .D ( n6 ) , .CLK ( clk ) , 
    .Q ( inst_out[15] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_2 ctmTdsLR_1_178 ( .A1 ( n4 ) , 
    .A2 ( tmp_net60 ) , .Z ( n24 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_179 ( .I ( inst_val ) , 
    .ZN ( tmp_net60 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( count_0_ ) , .ZN ( n3 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U6 ( .A1 ( n3 ) , .A2 ( rst_n ) , 
    .ZN ( n4 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U7 ( .A1 ( inst_val ) , .A2 ( n4 ) , 
    .ZN ( fifo_rdy ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U8 ( .A1 ( count_0_ ) , .A2 ( rst_n ) , 
    .ZN ( n23 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U11 ( .A1 ( core_rdy ) , .A2 ( n23 ) , 
    .B ( n24 ) , .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( n23 ) , .ZN ( inst_out_val ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U13 ( .I0 ( inst[0] ) , .I1 ( inst_out[0] ) , 
    .S ( n24 ) , .Z ( n21 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U14 ( .I0 ( inst[1] ) , .I1 ( inst_out[1] ) , 
    .S ( n24 ) , .Z ( n20 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U15 ( .I0 ( inst[2] ) , .I1 ( inst_out[2] ) , 
    .S ( n24 ) , .Z ( n19 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U16 ( .I0 ( inst[3] ) , .I1 ( inst_out[3] ) , 
    .S ( n24 ) , .Z ( n18 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U17 ( .I0 ( inst[4] ) , .I1 ( inst_out[4] ) , 
    .S ( n24 ) , .Z ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U18 ( .I0 ( inst[5] ) , .I1 ( inst_out[5] ) , 
    .S ( n24 ) , .Z ( n16 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U19 ( .I0 ( inst[6] ) , .I1 ( inst_out[6] ) , 
    .S ( n24 ) , .Z ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U20 ( .I0 ( inst[7] ) , .I1 ( inst_out[7] ) , 
    .S ( n24 ) , .Z ( n14 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U21 ( .I0 ( inst[8] ) , .I1 ( inst_out[8] ) , 
    .S ( n24 ) , .Z ( n13 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U22 ( .I0 ( inst[9] ) , .I1 ( inst_out[9] ) , 
    .S ( n24 ) , .Z ( n12 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U23 ( .I0 ( inst[10] ) , 
    .I1 ( inst_out[10] ) , .S ( n24 ) , .Z ( n11 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U24 ( .I0 ( inst[11] ) , 
    .I1 ( inst_out[11] ) , .S ( n24 ) , .Z ( n10 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U25 ( .I0 ( inst[12] ) , 
    .I1 ( inst_out[12] ) , .S ( n24 ) , .Z ( n9 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U26 ( .I0 ( inst[13] ) , 
    .I1 ( inst_out[13] ) , .S ( n24 ) , .Z ( n8 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0 ( inst[14] ) , 
    .I1 ( inst_out[14] ) , .S ( n24 ) , .Z ( n7 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0 ( inst[15] ) , 
    .I1 ( inst_out[15] ) , .S ( n24 ) , .Z ( n6 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
endmodule


module uart_tx ( clk , rst_n , inst_fifo_rdy , tx , VDD , VSS , HFSNET_0 ) ;
input  clk ;
input  rst_n ;
input  inst_fifo_rdy ;
output tx ;
input  VDD ;
input  VSS ;
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
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire n59 ;
wire n61 ;
wire n62 ;
wire n63 ;
wire n64 ;
wire n66 ;
wire n67 ;
wire n68 ;
wire [3:0] bit_idx ;
wire [6:0] clk_cnt ;
supply1 VDD ;
supply0 VSS ;
wire tmp_net58 ;
wire tmp_net72 ;
wire tmp_net73 ;
wire tmp_net74 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_0_ ( .D ( n53 ) , .CLK ( clk ) , 
    .Q ( bit_idx[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg ( .D ( n41 ) , .CLK ( clk ) , 
    .Q ( state ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 ready_sent_reg ( .D ( n52 ) , .CLK ( clk ) , 
    .Q ( ready_sent ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_6_ ( .D ( n42 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_0_ ( .D ( n48 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_1_ ( .D ( n47 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_2_ ( .D ( n46 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_3_ ( .D ( n45 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_4_ ( .D ( n44 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_5_ ( .D ( n43 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_1_ ( .D ( n51 ) , .CLK ( clk ) , 
    .Q ( bit_idx[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_2_ ( .D ( n50 ) , .CLK ( clk ) , 
    .Q ( bit_idx[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_3_ ( .D ( n49 ) , .CLK ( clk ) , 
    .Q ( bit_idx[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I ( bit_idx[2] ) , .ZN ( n17 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( bit_idx[1] ) , .ZN ( n10 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U5 ( .A1 ( bit_idx[0] ) , .A2 ( n17 ) , 
    .A3 ( n10 ) , .ZN ( n61 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U6 ( .A1 ( state ) , .A2 ( n61 ) , 
    .ZN ( tx ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_175 ( .A1 ( n18 ) , 
    .A2 ( tmp_net58 ) , .A3 ( state ) , .ZN ( n8 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U8 ( .A1 ( HFSNET_0 ) , .A2 ( state ) , 
    .ZN ( n33 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U9 ( .I ( inst_fifo_rdy ) , .ZN ( n1 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U10 ( .A1 ( ready_sent ) , .A2 ( n1 ) , 
    .B ( HFSNET_0 ) , .ZN ( n64 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( bit_idx[3] ) , .ZN ( n63 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U12 ( .I ( clk_cnt[4] ) , .ZN ( n35 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U13 ( .I ( clk_cnt[5] ) , .ZN ( n54 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U14 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( clk_cnt[6] ) , .A4 ( n54 ) , .ZN ( n2 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U15 ( .A1 ( clk_cnt[3] ) , 
    .A2 ( clk_cnt[0] ) , .A3 ( n35 ) , .A4 ( n2 ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_196 ( .A1 ( n40 ) , 
    .A2 ( tmp_net72 ) , .ZN ( tmp_net73 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( n8 ) , .ZN ( n3 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U18 ( .A1 ( n33 ) , .A2 ( n64 ) , .B ( n3 ) , 
    .ZN ( n7 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U19 ( .A1 ( n33 ) , .A2 ( bit_idx[0] ) , 
    .ZN ( n6 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U20 ( .A1 ( bit_idx[0] ) , .A2 ( n7 ) , 
    .B1 ( n3 ) , .B2 ( n6 ) , .ZN ( n4 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( n4 ) , .ZN ( n53 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U22 ( .I ( state ) , .ZN ( n66 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U23 ( .A1 ( n66 ) , .A2 ( ready_sent ) , 
    .B ( HFSNET_0 ) , .C ( inst_fifo_rdy ) , .ZN ( n5 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U24 ( .I ( n5 ) , .ZN ( n52 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( n7 ) , .A2 ( n6 ) , .ZN ( n11 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U26 ( .A1 ( n33 ) , .A2 ( n8 ) , .ZN ( n12 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U27 ( .A1 ( bit_idx[0] ) , .A2 ( n12 ) , 
    .A3 ( n10 ) , .ZN ( n9 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U28 ( .A1 ( n11 ) , .A2 ( n10 ) , .B ( n9 ) , 
    .ZN ( n51 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U29 ( .A1 ( bit_idx[1] ) , .A2 ( n33 ) , 
    .B ( n11 ) , .ZN ( n14 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U30 ( .I ( n14 ) , .ZN ( n13 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U31 ( .A1 ( bit_idx[1] ) , 
    .A2 ( bit_idx[0] ) , .A3 ( n12 ) , .ZN ( n16 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U32 ( .A1 ( bit_idx[2] ) , .A2 ( n13 ) , 
    .B1 ( n16 ) , .B2 ( n17 ) , .ZN ( n50 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U33 ( .I ( n33 ) , .ZN ( n57 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U34 ( .A1 ( n57 ) , .A2 ( n17 ) , 
    .B ( n14 ) , .ZN ( n15 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U35 ( .A1 ( bit_idx[3] ) , .A2 ( n17 ) , 
    .A3 ( n16 ) , .B1 ( n15 ) , .B2 ( n63 ) , .ZN ( n49 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U36 ( .A1 ( HFSNET_0 ) , .A2 ( n66 ) , 
    .ZN ( n36 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U37 ( .I ( clk_cnt[0] ) , .ZN ( n21 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( n18 ) , .ZN ( n62 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U39 ( .A1 ( n62 ) , .A2 ( n57 ) , 
    .ZN ( n39 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U40 ( .I ( n39 ) , .ZN ( n55 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U41 ( .A1 ( n55 ) , .A2 ( n21 ) , 
    .ZN ( n19 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U42 ( .A1 ( n36 ) , .A2 ( n21 ) , 
    .B ( n19 ) , .ZN ( n48 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U43 ( .A1 ( n36 ) , .A2 ( n19 ) , 
    .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U44 ( .I ( n22 ) , .ZN ( n20 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U45 ( .I ( clk_cnt[1] ) , .ZN ( n23 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U46 ( .A1 ( clk_cnt[1] ) , .A2 ( n33 ) , 
    .A3 ( n21 ) , .B1 ( n20 ) , .B2 ( n23 ) , .ZN ( n47 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U47 ( .A1 ( clk_cnt[0] ) , 
    .A2 ( clk_cnt[1] ) , .ZN ( n25 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U48 ( .A1 ( n57 ) , .A2 ( n23 ) , 
    .B ( n22 ) , .ZN ( n24 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U49 ( .I ( clk_cnt[2] ) , .ZN ( n26 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U50 ( .A1 ( clk_cnt[2] ) , .A2 ( n33 ) , 
    .A3 ( n25 ) , .B1 ( n24 ) , .B2 ( n26 ) , .ZN ( n46 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U51 ( .A1 ( n25 ) , .A2 ( n26 ) , 
    .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U52 ( .I ( n29 ) , .ZN ( n28 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U53 ( .A1 ( n29 ) , .A2 ( n39 ) , 
    .B ( n36 ) , .ZN ( n30 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U54 ( .I ( n30 ) , .ZN ( n27 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U55 ( .I ( clk_cnt[3] ) , .ZN ( n31 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U56 ( .A1 ( clk_cnt[3] ) , .A2 ( n39 ) , 
    .A3 ( n28 ) , .B1 ( n27 ) , .B2 ( n31 ) , .ZN ( n45 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U57 ( .A1 ( clk_cnt[3] ) , .A2 ( n29 ) , 
    .ZN ( n34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U58 ( .A1 ( n55 ) , .A2 ( n31 ) , 
    .B ( n30 ) , .ZN ( n32 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U59 ( .A1 ( clk_cnt[4] ) , .A2 ( n33 ) , 
    .A3 ( n34 ) , .B1 ( n32 ) , .B2 ( n35 ) , .ZN ( n44 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U60 ( .A1 ( n35 ) , .A2 ( n34 ) , 
    .ZN ( n56 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n56 ) , .ZN ( n38 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U62 ( .A1 ( n56 ) , .A2 ( n39 ) , 
    .B ( n36 ) , .ZN ( n40 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U63 ( .I ( n40 ) , .ZN ( n37 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U64 ( .A1 ( clk_cnt[5] ) , .A2 ( n39 ) , 
    .A3 ( n38 ) , .B1 ( n37 ) , .B2 ( n54 ) , .ZN ( n43 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_3_177_roptpi_227 ( .A1 ( n61 ) , 
    .A2 ( n63 ) , .Z ( tmp_net58 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U66 ( .A1 ( n57 ) , .A2 ( clk_cnt[5] ) , 
    .A3 ( n56 ) , .ZN ( n59 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U67 ( .I ( clk_cnt[6] ) , .ZN ( n58 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U68 ( .A1 ( tmp_net73 ) , .A2 ( tmp_net74 ) , 
    .B1 ( n59 ) , .B2 ( n58 ) , .ZN ( n42 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U69 ( .A1 ( n63 ) , .A2 ( n62 ) , 
    .A3 ( n61 ) , .ZN ( n68 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U70 ( .I ( n64 ) , .ZN ( n67 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U71 ( .A1 ( n68 ) , .A2 ( state ) , 
    .B1 ( n67 ) , .B2 ( n66 ) , .C ( rst_n ) , .ZN ( n41 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_197 ( .I ( clk_cnt[6] ) , 
    .ZN ( tmp_net72 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_198 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .ZN ( tmp_net74 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module uart_rx_WORD_WIDTH16 ( clk , rst_n , inst , inst_val , rx , VDD , VSS , 
    HFSNET_3 , ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
output [15:0] inst ;
output inst_val ;
input  rx ;
input  VDD ;
input  VSS ;
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
wire tmp_net66 ;
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
wire tmp_net67 ;
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
supply1 VDD ;
supply0 VSS ;
wire HFSNET_1 ;
wire tmp_net85 ;
wire tmp_net86 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_meta_reg ( .D ( N143 ) , .CLK ( clk ) , 
    .Q ( rx_meta ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_sync_reg ( .D ( N144 ) , .CLK ( clk ) , 
    .Q ( rx_sync ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_0_ ( .D ( n102 ) , .CLK ( clk ) , 
    .Q ( bit_idx[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n104 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_0_ ( .D ( n98 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_1_ ( .D ( n97 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_2_ ( .D ( n96 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_3_ ( .D ( n95 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_4_ ( .D ( n94 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_5_ ( .D ( n93 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_6_ ( .D ( n92 ) , .CLK ( clk ) , 
    .Q ( clk_cnt[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_1_ ( .D ( n101 ) , .CLK ( clk ) , 
    .Q ( bit_idx[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_2_ ( .D ( n100 ) , .CLK ( clk ) , 
    .Q ( bit_idx[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_3_ ( .D ( n99 ) , .CLK ( clk ) , 
    .Q ( bit_idx[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n103 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_15_ ( .D ( n76 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[15] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_14_ ( .D ( n77 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[14] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_13_ ( .D ( n78 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[13] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_12_ ( .D ( n79 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[12] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_11_ ( .D ( n80 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[11] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_10_ ( .D ( n81 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[10] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_9_ ( .D ( n82 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[9] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_8_ ( .D ( n83 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[8] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_7_ ( .D ( n84 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[7] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_6_ ( .D ( n85 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[6] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_5_ ( .D ( n86 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[5] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_4_ ( .D ( n87 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[4] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_3_ ( .D ( n88 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[3] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_2_ ( .D ( n89 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[2] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_1_ ( .D ( n90 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[1] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_0_ ( .D ( n91 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst[0] ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 byte_idx_reg_0_ ( .D ( n105 ) , .CLK ( clk ) , 
    .Q ( byte_idx_0_ ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_val_reg ( .D ( n75 ) , .CLK ( clk ) , 
    .Q ( inst_val ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_1_188 ( .A1 ( n17 ) , .A2 ( n44 ) , 
    .B1 ( n15 ) , .B2 ( state[0] ) , .C ( tmp_net67 ) , .ZN ( n26 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_189 ( .A1 ( n14 ) , .A2 ( n18 ) , 
    .B ( tmp_net66 ) , .ZN ( tmp_net67 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 HFSBUF_637_9 ( .I ( n117 ) , 
    .Z ( HFSNET_2 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_190 ( .I ( state[1] ) , 
    .ZN ( tmp_net66 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_1_215 ( .A1 ( n26 ) , .A2 ( n44 ) , 
    .A3 ( state[1] ) , .B ( tmp_net86 ) , .ZN ( n103 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U8 ( .A1 ( HFSNET_3 ) , .A2 ( rx_meta ) , 
    .Z ( N144 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U9 ( .A1 ( HFSNET_3 ) , .A2 ( rx ) , 
    .Z ( N143 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U10 ( .A1 ( bit_idx[2] ) , 
    .A2 ( bit_idx[1] ) , .A3 ( bit_idx[0] ) , .ZN ( n4 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( bit_idx[3] ) , .ZN ( n6 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U12 ( .A1 ( n4 ) , .A2 ( n6 ) , .ZN ( n28 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U13 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[6] ) , .ZN ( n5 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U14 ( .A1 ( clk_cnt[0] ) , 
    .A2 ( clk_cnt[5] ) , .A3 ( clk_cnt[3] ) , .A4 ( n5 ) , .ZN ( n7 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( bit_idx[2] ) , .ZN ( n39 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( bit_idx[1] ) , .ZN ( n35 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U17 ( .I ( bit_idx[0] ) , .ZN ( n30 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U18 ( .A1 ( n30 ) , .A2 ( n35 ) , 
    .A3 ( n39 ) , .A4 ( n6 ) , .ZN ( n11 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U19 ( .A1 ( clk_cnt[4] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( n7 ) , .A4 ( n11 ) , .ZN ( n27 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n27 ) , .ZN ( n42 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U21 ( .A1 ( n28 ) , .A2 ( n42 ) , 
    .A3 ( rx_sync ) , .ZN ( n121 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U22 ( .A1 ( state[1] ) , .A2 ( n121 ) , 
    .ZN ( n20 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U23 ( .A1 ( n20 ) , .A2 ( rst_n ) , 
    .ZN ( n10 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( HFSNET_3 ) , .A2 ( state[1] ) , 
    .ZN ( n123 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( n123 ) , .A2 ( state[0] ) , 
    .ZN ( n119 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U26 ( .I ( n119 ) , .ZN ( n43 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U27 ( .A1 ( state[0] ) , .A2 ( HFSNET_3 ) , 
    .ZN ( n44 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U28 ( .I ( n44 ) , .ZN ( n58 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U29 ( .A1 ( n10 ) , .A2 ( n58 ) , 
    .B ( byte_idx_0_ ) , .ZN ( n9 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U30 ( .A1 ( byte_idx_0_ ) , .A2 ( n10 ) , 
    .A3 ( n43 ) , .B ( n9 ) , .ZN ( n105 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U31 ( .I ( clk_cnt[0] ) , .ZN ( n46 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U32 ( .A1 ( clk_cnt[5] ) , .A2 ( n46 ) , 
    .ZN ( n13 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U33 ( .I ( n11 ) , .ZN ( n21 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( clk_cnt[6] ) , .ZN ( n66 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U35 ( .A1 ( clk_cnt[1] ) , .A2 ( n21 ) , 
    .A3 ( clk_cnt[3] ) , .A4 ( n66 ) , .ZN ( n12 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U36 ( .A1 ( clk_cnt[4] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( n13 ) , .A4 ( n12 ) , .ZN ( n41 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U37 ( .I ( state[1] ) , .ZN ( n24 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U38 ( .A1 ( n41 ) , .A2 ( n24 ) , 
    .ZN ( n29 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U39 ( .I ( rx_sync ) , .ZN ( n15 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U40 ( .A1 ( n29 ) , .A2 ( n15 ) , 
    .B ( HFSNET_3 ) , .ZN ( n17 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U41 ( .I ( state[0] ) , .ZN ( n18 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U42 ( .A1 ( n28 ) , .A2 ( n42 ) , 
    .ZN ( n14 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_216 ( .A1 ( n26 ) , 
    .A2 ( tmp_net85 ) , .ZN ( tmp_net86 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_217 ( .I ( n24 ) , 
    .ZN ( tmp_net85 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U45 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .B ( HFSNET_3 ) , .C ( n18 ) , .ZN ( n23 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U46 ( .A1 ( n26 ) , .A2 ( state[0] ) , 
    .ZN ( n22 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U47 ( .A1 ( n26 ) , .A2 ( n23 ) , 
    .B ( n22 ) , .ZN ( n104 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n28 ) , .A2 ( n27 ) , 
    .ZN ( n69 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U51 ( .A1 ( n69 ) , .A2 ( n123 ) , 
    .B ( n44 ) , .ZN ( n117 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U52 ( .A1 ( rx_sync ) , .A2 ( n29 ) , 
    .B ( HFSNET_2 ) , .ZN ( n31 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U53 ( .I ( n31 ) , .ZN ( n37 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U54 ( .A1 ( n30 ) , .A2 ( n119 ) , 
    .B ( n37 ) , .ZN ( n32 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U55 ( .A1 ( n37 ) , .A2 ( n30 ) , 
    .B ( n32 ) , .ZN ( n102 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U56 ( .A1 ( n31 ) , .A2 ( bit_idx[0] ) , 
    .A3 ( n119 ) , .ZN ( n34 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U57 ( .A1 ( bit_idx[1] ) , .A2 ( n32 ) , 
    .B1 ( n34 ) , .B2 ( n35 ) , .ZN ( n101 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U58 ( .A1 ( n43 ) , .A2 ( bit_idx[1] ) , 
    .B ( n32 ) , .ZN ( n33 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U59 ( .I ( n33 ) , .ZN ( n36 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U60 ( .A1 ( n35 ) , .A2 ( n34 ) , .Z ( n40 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U61 ( .A1 ( bit_idx[2] ) , .A2 ( n36 ) , 
    .B1 ( n40 ) , .B2 ( n39 ) , .ZN ( n100 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U62 ( .A1 ( n119 ) , .A2 ( n37 ) , 
    .B ( bit_idx[3] ) , .ZN ( n38 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U63 ( .A1 ( n40 ) , .A2 ( n39 ) , 
    .B ( n38 ) , .ZN ( n99 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U66 ( .A1 ( clk_cnt[0] ) , .A2 ( n44 ) , 
    .B1 ( n65 ) , .B2 ( n46 ) , .ZN ( n98 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U67 ( .A1 ( HFSNET_1 ) , .A2 ( n46 ) , 
    .B ( n58 ) , .ZN ( n45 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U68 ( .I ( clk_cnt[1] ) , .ZN ( n47 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U69 ( .A1 ( clk_cnt[1] ) , .A2 ( n46 ) , 
    .A3 ( n65 ) , .B1 ( n45 ) , .B2 ( n47 ) , .ZN ( n97 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U70 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[0] ) , .ZN ( n49 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U71 ( .A1 ( n47 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n46 ) , .B2 ( HFSNET_1 ) , .C ( n58 ) , .ZN ( n48 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U72 ( .I ( clk_cnt[2] ) , .ZN ( n50 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U73 ( .A1 ( clk_cnt[2] ) , .A2 ( n65 ) , 
    .A3 ( n49 ) , .B1 ( n48 ) , .B2 ( n50 ) , .ZN ( n96 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U74 ( .A1 ( n49 ) , .A2 ( n50 ) , 
    .ZN ( n52 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U75 ( .I ( n52 ) , .ZN ( n53 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U76 ( .A1 ( HFSNET_1 ) , .A2 ( n53 ) , 
    .B ( n58 ) , .ZN ( n51 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U77 ( .I ( clk_cnt[3] ) , .ZN ( n54 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U78 ( .A1 ( clk_cnt[3] ) , .A2 ( n65 ) , 
    .A3 ( n53 ) , .B1 ( n51 ) , .B2 ( n54 ) , .ZN ( n95 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( n52 ) , .A2 ( clk_cnt[3] ) , 
    .ZN ( n56 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U80 ( .A1 ( n54 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n53 ) , .B2 ( HFSNET_1 ) , .C ( n58 ) , .ZN ( n55 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( clk_cnt[4] ) , .ZN ( n57 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U82 ( .A1 ( n65 ) , .A2 ( n56 ) , 
    .A3 ( clk_cnt[4] ) , .B1 ( n55 ) , .B2 ( n57 ) , .ZN ( n94 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U83 ( .A1 ( n57 ) , .A2 ( n56 ) , 
    .ZN ( n64 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n64 ) , .ZN ( n60 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U85 ( .A1 ( n60 ) , .A2 ( HFSNET_1 ) , 
    .B ( n58 ) , .ZN ( n61 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U86 ( .I ( clk_cnt[5] ) , .ZN ( n59 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U87 ( .A1 ( clk_cnt[5] ) , .A2 ( n65 ) , 
    .A3 ( n60 ) , .B1 ( n61 ) , .B2 ( n59 ) , .ZN ( n93 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U88 ( .A1 ( n65 ) , .A2 ( clk_cnt[5] ) , 
    .B ( n61 ) , .ZN ( n63 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U89 ( .I ( n63 ) , .ZN ( n68 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U90 ( .A1 ( clk_cnt[5] ) , .A2 ( HFSNET_1 ) , 
    .A3 ( n64 ) , .ZN ( n67 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( n68 ) , .A2 ( clk_cnt[6] ) , 
    .B1 ( n67 ) , .B2 ( n66 ) , .ZN ( n92 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_2 U92 ( .A1 ( n119 ) , .A2 ( n69 ) , 
    .Z ( n116 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( inst[1] ) , .A2 ( n116 ) , 
    .B1 ( inst[0] ) , .B2 ( HFSNET_2 ) , .ZN ( n70 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n70 ) , .ZN ( n91 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U95 ( .A1 ( inst[2] ) , .A2 ( n116 ) , 
    .B1 ( inst[1] ) , .B2 ( HFSNET_2 ) , .ZN ( n71 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U96 ( .I ( n71 ) , .ZN ( n90 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U97 ( .A1 ( inst[3] ) , .A2 ( n116 ) , 
    .B1 ( inst[2] ) , .B2 ( HFSNET_2 ) , .ZN ( n72 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n72 ) , .ZN ( n89 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U99 ( .A1 ( inst[4] ) , .A2 ( n116 ) , 
    .B1 ( inst[3] ) , .B2 ( HFSNET_2 ) , .ZN ( n73 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U100 ( .I ( n73 ) , .ZN ( n88 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U101 ( .A1 ( inst[5] ) , .A2 ( n116 ) , 
    .B1 ( inst[4] ) , .B2 ( HFSNET_2 ) , .ZN ( n74 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( n74 ) , .ZN ( n87 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U103 ( .A1 ( inst[6] ) , .A2 ( n116 ) , 
    .B1 ( inst[5] ) , .B2 ( HFSNET_2 ) , .ZN ( n106 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n106 ) , .ZN ( n86 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( inst[7] ) , .A2 ( n116 ) , 
    .B1 ( inst[6] ) , .B2 ( HFSNET_2 ) , .ZN ( n107 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U106 ( .I ( n107 ) , .ZN ( n85 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U107 ( .A1 ( inst[8] ) , .A2 ( n116 ) , 
    .B1 ( inst[7] ) , .B2 ( HFSNET_2 ) , .ZN ( n108 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U108 ( .I ( n108 ) , .ZN ( n84 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U109 ( .A1 ( inst[9] ) , .A2 ( n116 ) , 
    .B1 ( inst[8] ) , .B2 ( HFSNET_2 ) , .ZN ( n109 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U110 ( .I ( n109 ) , .ZN ( n83 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( inst[10] ) , .A2 ( n116 ) , 
    .B1 ( inst[9] ) , .B2 ( HFSNET_2 ) , .ZN ( n110 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U112 ( .I ( n110 ) , .ZN ( n82 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( inst[11] ) , .A2 ( n116 ) , 
    .B1 ( inst[10] ) , .B2 ( HFSNET_2 ) , .ZN ( n111 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n111 ) , .ZN ( n81 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( inst[12] ) , .A2 ( n116 ) , 
    .B1 ( inst[11] ) , .B2 ( HFSNET_2 ) , .ZN ( n112 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( n112 ) , .ZN ( n80 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U117 ( .A1 ( inst[13] ) , .A2 ( n116 ) , 
    .B1 ( inst[12] ) , .B2 ( HFSNET_2 ) , .ZN ( n113 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n113 ) , .ZN ( n79 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U119 ( .A1 ( inst[14] ) , .A2 ( n116 ) , 
    .B1 ( inst[13] ) , .B2 ( HFSNET_2 ) , .ZN ( n114 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U120 ( .I ( n114 ) , .ZN ( n78 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U121 ( .A1 ( inst[15] ) , .A2 ( n116 ) , 
    .B1 ( inst[14] ) , .B2 ( HFSNET_2 ) , .ZN ( n115 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U122 ( .I ( n115 ) , .ZN ( n77 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U123 ( .A1 ( HFSNET_2 ) , .A2 ( inst[15] ) , 
    .B1 ( n116 ) , .B2 ( rx_sync ) , .ZN ( n118 ) , .VDD ( VDD ) , 
    .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U124 ( .I ( n118 ) , .ZN ( n76 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( inst_val ) , .ZN ( n122 ) , 
    .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1 ( n119 ) , .A2 ( byte_idx_0_ ) , 
    .ZN ( n120 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U127 ( .A1 ( n123 ) , .A2 ( n122 ) , 
    .B1 ( n121 ) , .B2 ( n120 ) , .ZN ( n75 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 HFSINV_324_7 ( .I ( n65 ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or3_1 U64 ( .A1 ( n43 ) , .A2 ( n42 ) , .A3 ( n41 ) , 
    .Z ( n65 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
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
inout  VPWR ;
inout  VGND ;

wire ZCTSNET_0 ;
wire ZCTSNET_1 ;
wire ZCTSNET_2 ;
wire ZCTSNET_3 ;
wire optlc_net_93 ;
wire optlc_net_94 ;
wire optlc_net_95 ;
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
wire HFSNET_1 ;
wire n19 ;
wire HFSNET_2 ;
wire [1:0] reset_sync ;
wire [15:0] rx_inst ;
wire [15:0] host_inst ;
wire [15:0] mem_inst ;
wire [8:0] exe_inst ;
supply1 VPWR ;
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
supply0 VGND ;
wire SYNOPSYS_UNCONNECTED_1 ;
wire SYNOPSYS_UNCONNECTED_2 ;


uart_rx_WORD_WIDTH16 receiver ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .inst ( rx_inst ) , .inst_val ( rx_inst_val ) , .rx ( ui_in[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) , .HFSNET_3 ( HFSNET_2 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_3 ) ) ;
uart_tx transmitter ( .clk ( ZCTSNET_2 ) , .rst_n ( HFSNET_1 ) , 
    .inst_fifo_rdy ( fifo_rdy ) , .tx ( uo_out[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) , .HFSNET_0 ( HFSNET_2 ) ) ;
inst_fifo_WORD_WIDTH16 fifo ( .clk ( ZCTSNET_1 ) , .rst_n ( HFSNET_2 ) , 
    .inst ( rx_inst ) , .inst_val ( rx_inst_val ) , .fifo_rdy ( fifo_rdy ) , 
    .core_rdy ( uo_out[0] ) , .inst_out ( host_inst ) , 
    .inst_out_val ( host_inst_val ) , .VDD ( VPWR ) , .VSS ( VGND ) , 
    .ZCTSNET_0 ( ZCTSNET_3 ) ) ;
decoder decode ( .rst_n ( HFSNET_1 ) , .inst_in ( host_inst ) , 
    .inst_in_val ( host_inst_val ) , .core_rdy ( uo_out[0] ) , 
    .mem_rdy ( mem_rdy ) , .exe_rdy ( n5 ) , .mem_inst_out ( mem_inst ) , 
    .mem_inst_out_val ( mem_inst_val ) ,
    .exe_inst_out ( { exe_inst[8] , exe_inst[7] , SYNOPSYS_UNCONNECTED_1 , 
        exe_inst[5] , exe_inst[4] , exe_inst[3] , exe_inst[2] , exe_inst[1] , 
        exe_inst[0] } ) ,
    .exe_inst_out_val ( exe_inst_val ) , .VDD ( VPWR ) , .VSS ( VGND ) , 
    .HFSNET_0 ( HFSNET_2 ) ) ;
mem_ctrl memory ( .clk ( ZCTSNET_1 ) , .rst_n ( HFSNET_1 ) , 
    .mem_inst_in ( mem_inst ) , .mem_inst_in_val ( mem_inst_val ) , 
    .mem_rdy ( mem_rdy ) , .mem_itf_rdy ( mem_itf_rdy ) , 
    .read_en ( read_en ) , .write_en ( write_en ) , .copy_en ( copy_en ) , 
    .src_addr ( src_addr ) , .dst_addr ( dst_addr ) , 
    .write_data ( write_data ) , .read_data ( read_data ) , 
    .read_data_val ( read_data_val ) , .weight_data ( weight_data ) , 
    .weight_data_val ( weight_data_val ) , .input_data ( input_data ) , 
    .input_data_val ( input_data_val ) , .act_res_in ( act_result ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) , .HFSNET_1 ( HFSNET_2 ) , 
    .ZCTSNET_0 ( ZCTSNET_2 ) , .ZCTSNET_1 ( ZCTSNET_3 ) , .ZCTSNET_2 ( clk ) ) ;
vpu compute ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) ,
    .exe_inst_in ( { exe_inst[8] , exe_inst[7] , SYNOPSYS_UNCONNECTED_2 , 
        exe_inst[5] , exe_inst[4] , exe_inst[3] , exe_inst[2] , exe_inst[1] , 
        exe_inst[0] } ) ,
    .exe_inst_in_val ( exe_inst_val ) , .weight_data ( weight_data ) , 
    .weight_data_val ( weight_data_val ) , .input_data ( input_data ) , 
    .input_data_val ( input_data_val ) , .vpu_res_out ( vpu_result ) , 
    .act_op_out ( act_op ) , .vpu_res_out_val ( vpu_result_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) , .HFSNET_1 ( HFSNET_2 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) ) ;
act activation ( .clk ( ZCTSNET_1 ) , .rst_n ( HFSNET_1 ) , 
    .vpu_res_in ( vpu_result ) , .act_op_in ( act_op ) , 
    .vpu_res_in_val ( vpu_result_val ) , .act_res_out ( act_result ) , 
    .act_res_out_val ( act_result_val ) , .VDD ( VPWR ) , .VSS ( VGND ) , 
    .HFSNET_1 ( HFSNET_2 ) ) ;
mem_itf itf ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .read_en ( read_en ) , .write_en ( write_en ) , .copy_en ( copy_en ) , 
    .rdy ( mem_itf_rdy ) , .src_addr ( src_addr ) , .dst_addr ( dst_addr ) , 
    .write_data ( write_data ) , .read_data ( read_data ) , 
    .read_data_val ( read_data_val ) , .qspi_req_val ( qspi_req_val ) , 
    .qspi_req_rdy ( qspi_req_rdy ) , .qspi_req_write ( qspi_req_write ) , 
    .qspi_req_addr ( qspi_req_addr ) , .qspi_req_data ( qspi_req_data ) , 
    .qspi_read_data ( qspi_read_data ) , 
    .qspi_read_data_val ( qspi_read_data_val ) , .VDD ( VPWR ) , .VSS ( VGND ) , 
    .HFSNET_0 ( HFSNET_2 ) , .ZCTSNET_0 ( ZCTSNET_1 ) ) ;
qspi_ctrl serial_memory ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .req_val ( qspi_req_val ) , .req_rdy ( qspi_req_rdy ) , 
    .req_write ( qspi_req_write ) , .req_addr ( qspi_req_addr ) , 
    .req_data ( qspi_req_data ) , .read_data ( qspi_read_data ) , 
    .read_data_val ( qspi_read_data_val ) , .sck ( uio_out[3] ) , 
    .flash_sc_n ( uio_out[0] ) , .psram_a_sc_n ( uio_out[6] ) , 
    .psram_b_sc_n ( uio_out[7] ) ,
    .dq_in ( { uio_in[5] , uio_in[4] , uio_in[2] , uio_in[1] } ) ,
    .dq_out ( { uio_out[5] , uio_out[4] , uio_out[2] , uio_out[1] } ) ,
    .dq_oe ( { uio_oe[5] , uio_oe[4] , uio_oe[2] , uio_oe[1] } ) ,
    .VDD ( VPWR ) , .VSS ( VGND ) , .HFSNET_2 ( HFSNET_2 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_2 ) , 
    .ZCTSNET_2 ( ZCTSNET_3 ) , .ZCTSNET_4 ( clk ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_0_ ( .D ( optlc_net_94 ) , 
    .CLK ( ZCTSNET_1 ) , .RN ( rst_n ) , .Q ( reset_sync[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_1_ ( .D ( reset_sync[0] ) , 
    .CLK ( ZCTSNET_1 ) , .RN ( rst_n ) , .Q ( reset_sync[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exe_active_reg ( .D ( n4 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( exe_active ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( optlc_net_93 ) , .ZN ( uio_oe[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( optlc_net_93 ) , .ZN ( uio_oe[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( optlc_net_93 ) , .ZN ( uio_oe[6] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( optlc_net_93 ) , .ZN ( uio_oe[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( optlc_net_95 ) , .ZN ( uo_out[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( optlc_net_95 ) , .ZN ( uo_out[2] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( optlc_net_95 ) , .ZN ( uo_out[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( optlc_net_94 ) , .ZN ( uo_out[5] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( optlc_net_94 ) , .ZN ( uo_out[6] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( optlc_net_94 ) , .ZN ( uo_out[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_4 HFSINV_1762_10 ( .I ( reset_sync[1] ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_3 HFSBUF_1649_11 ( .I ( reset_sync[1] ) , 
    .Z ( HFSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U23 ( .I ( exe_active ) , .ZN ( n5 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U24 ( .I ( exe_inst_val ) , .ZN ( n19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U25 ( .A1 ( act_result_val ) , .A2 ( n19 ) , 
    .B1 ( n5 ) , .B2 ( n19 ) , .C ( HFSNET_1 ) , .ZN ( n4 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_10349_59 ( .I ( clk ) , 
    .Z ( ZCTSNET_0 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 ZCTSBUF_7701_60 ( .I ( clk ) , 
    .Z ( ZCTSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_17453_61 ( .I ( clk ) , 
    .Z ( ZCTSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 ZCTSBUF_14453_63 ( .I ( clk ) , 
    .Z ( ZCTSNET_3 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tiel optlc_233 ( .ZN ( optlc_net_93 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_234 ( .Z ( optlc_net_94 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_235 ( .Z ( optlc_net_95 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
endmodule


