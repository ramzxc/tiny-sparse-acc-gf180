// IC Compiler II Version Y-2026.03 Verilog Writer
// Generated on 11/19/2026 at 1:42:21
// Library Name: core.ndm
// Block Name: tt_um_tiny_sparse_acc_ramzxc
// User Label: metal3_repaired
// Write Command: write_verilog -exclude { all_physical_cells } /docker/projects/tapeout/tiny-sparse-acc-gf180/pnr/exports/20261119_014221_1795020141302947/core.v
module qspi_ctrl ( clk , rst_n , req_val , req_rdy , req_write , req_addr , 
    req_device , req_data , read_data , read_data_val , sck , flash_sc_n , 
    psram_a_sc_n , psram_b_sc_n , dq_in , dq_out , dq_oe , VPWR , VGND , 
    HFSNET_0 , ZCTSNET_0 , ZCTSNET_1 ) ;
input  clk ;
input  rst_n ;
input  req_val ;
output req_rdy ;
input  req_write ;
input  [23:0] req_addr ;
input  [1:0] req_device ;
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
input  HFSNET_0 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;

wire copt_gre_net_114 ;
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
wire n51 ;
wire n52 ;
wire n53 ;
wire n54 ;
wire n55 ;
wire n56 ;
wire n57 ;
wire n58 ;
wire tmp_net68 ;
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
wire copt_gre_net_113 ;
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
wire tmp_net45 ;
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
wire tmp_net46 ;
wire tmp_net69 ;
wire tmp_net70 ;
wire tmp_net71 ;
wire tmp_net72 ;
wire tmp_net73 ;
wire tmp_net74 ;
wire tmp_net75 ;
wire tmp_net76 ;
wire tmp_net78 ;
wire tmp_net79 ;
wire tmp_net80 ;
wire tmp_net84 ;
wire tmp_net85 ;
wire tmp_net86 ;
wire tmp_net91 ;
wire tmp_net101 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n196 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_0_ ( .D ( n205 ) , .CLK ( clk ) , 
    .Q ( chip[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_reg_reg ( .D ( n204 ) , .CLK ( clk ) , 
    .Q ( write_reg ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_1_ ( .D ( n200 ) , 
    .CLK ( clk ) , .Q ( operation[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_2_ ( .D ( n197 ) , .CLK ( clk ) , 
    .Q ( state[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n199 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_2_ ( .D ( n201 ) , 
    .CLK ( clk ) , .Q ( operation[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_0_ ( .D ( n215 ) , 
    .CLK ( clk ) , .Q ( status_shift[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N318 ) , 
    .CLK ( clk ) , .Q ( read_data_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 status_shift_reg_1_ ( .D ( n214 ) , 
    .CLK ( clk ) , .Q ( status_shift[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 operation_reg_0_ ( .D ( n202 ) , 
    .CLK ( clk ) , .Q ( operation[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_0_ ( .D ( n213 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_1_ ( .D ( n212 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_2_ ( .D ( n211 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_3_ ( .D ( n210 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_4_ ( .D ( n209 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_5_ ( .D ( n208 ) , 
    .CLK ( clk ) , .Q ( read_data[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_6_ ( .D ( n207 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_shift_reg_7_ ( .D ( n206 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( read_data[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
    .CLK ( clk ) , .Q ( psram_b_sc_n ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 psram_a_sc_n_reg ( .D ( n194 ) , 
    .CLK ( clk ) , .Q ( psram_a_sc_n ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 sck_reg ( .D ( n222 ) , .CLK ( clk ) , 
    .Q ( sck ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_3_ ( .D ( n198 ) , .CLK ( clk ) , 
    .Q ( state[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 chip_reg_1_ ( .D ( n203 ) , .CLK ( clk ) , 
    .Q ( chip[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I ( chip[1] ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_39 ( .A1 ( n56 ) , 
    .A2 ( req_addr[4] ) , .B1 ( n55 ) , .B2 ( req_addr[12] ) , .C1 ( n57 ) , 
    .C2 ( req_addr[20] ) , .ZN ( tmp_net46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_2 U5 ( .A1 ( n74 ) , .A2 ( n1 ) , 
    .B1 ( n123 ) , .B2 ( n137 ) , .ZN ( dq_out[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_180 ( .A1 ( n158 ) , 
    .A2 ( tmp_net101 ) , .ZN ( n201 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( state[0] ) , .ZN ( n9 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U14 ( .A1 ( n76 ) , .A2 ( state[2] ) , 
    .ZN ( n2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U15 ( .A1 ( n9 ) , .A2 ( n2 ) , 
    .A3 ( state[1] ) , .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U16 ( .A1 ( write_reg ) , .A2 ( n14 ) , 
    .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( n2 ) , .ZN ( n82 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U18 ( .A1 ( n9 ) , .A2 ( state[1] ) , 
    .A3 ( n82 ) , .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U19 ( .A1 ( n75 ) , .A2 ( n123 ) , 
    .A3 ( n4 ) , .ZN ( dq_oe[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_1_37 ( .A1 ( n145 ) , .A2 ( n75 ) , 
    .Z ( tmp_net45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U21 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n88 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U22 ( .A1 ( n88 ) , .A2 ( n193 ) , 
    .ZN ( n78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U23 ( .A1 ( state[3] ) , .A2 ( rst_n ) , 
    .A3 ( n78 ) , .ZN ( copt_gre_net_114 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( state[0] ) , .A2 ( state[1] ) , 
    .ZN ( n186 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U25 ( .I ( n75 ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U26 ( .A1 ( n82 ) , .A2 ( n186 ) , 
    .B ( n13 ) , .ZN ( n80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U27 ( .I ( write_reg ) , .ZN ( n185 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U28 ( .A1 ( n185 ) , .A2 ( n14 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U33 ( .A1 ( read_data[6] ) , .A2 ( n14 ) , 
    .B1 ( n13 ) , .B2 ( n1 ) , .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U34 ( .A1 ( n9 ) , .A2 ( n75 ) , .ZN ( n89 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U39 ( .A1 ( chip[1] ) , .A2 ( n100 ) , 
    .B1 ( n114 ) , .B2 ( n1 ) , .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U40 ( .A1 ( copt_gre_net_113 ) , .A2 ( n51 ) , 
    .ZN ( n37 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( n51 ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U42 ( .A1 ( n55 ) , .A2 ( copt_gre_net_113 ) , 
    .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U43 ( .A1 ( n37 ) , .A2 ( req_addr[6] ) , 
    .B1 ( n36 ) , .B2 ( req_addr[14] ) , .ZN ( n6 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( copt_gre_net_113 ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U45 ( .A1 ( n51 ) , .A2 ( n58 ) , 
    .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U46 ( .A1 ( n55 ) , .A2 ( n58 ) , 
    .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U47 ( .A1 ( n39 ) , .A2 ( req_addr[2] ) , 
    .B1 ( n38 ) , .B2 ( req_addr[10] ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U48 ( .A1 ( n6 ) , .A2 ( n5 ) , .ZN ( n8 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n57 ) , .A2 ( n51 ) , 
    .ZN ( n43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U50 ( .I0 ( req_addr[22] ) , 
    .I1 ( req_addr[18] ) , .S ( n54 ) , .Z ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U51 ( .A1 ( n57 ) , .A2 ( n8 ) , 
    .B1 ( n43 ) , .B2 ( n7 ) , .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U52 ( .I ( n45 ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U53 ( .A1 ( n193 ) , .A2 ( n9 ) , 
    .A3 ( state[1] ) , .ZN ( n95 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U54 ( .A1 ( cycles_left[0] ) , 
    .A2 ( state[3] ) , .A3 ( n95 ) , .ZN ( n73 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U55 ( .I ( operation[2] ) , .ZN ( n175 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U56 ( .I ( operation[0] ) , .ZN ( n160 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U57 ( .A1 ( n175 ) , .A2 ( n160 ) , 
    .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( n29 ) , .ZN ( n178 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( operation[1] ) , .ZN ( n165 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U60 ( .A1 ( n178 ) , .A2 ( n165 ) , 
    .ZN ( n189 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U61 ( .A1 ( n89 ) , .A2 ( n10 ) , 
    .B1 ( n73 ) , .B2 ( n189 ) , .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U62 ( .A1 ( n25 ) , .A2 ( n12 ) , 
    .A3 ( n11 ) , .ZN ( dq_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U63 ( .A1 ( read_data[7] ) , .A2 ( n14 ) , 
    .B1 ( n13 ) , .B2 ( n145 ) , .ZN ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U64 ( .A1 ( n37 ) , .A2 ( req_addr[7] ) , 
    .B1 ( n36 ) , .B2 ( req_addr[15] ) , .ZN ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U65 ( .A1 ( n39 ) , .A2 ( req_addr[3] ) , 
    .B1 ( n38 ) , .B2 ( req_addr[11] ) , .ZN ( n15 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U66 ( .A1 ( n16 ) , .A2 ( n15 ) , 
    .ZN ( n20 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U67 ( .A1 ( n1 ) , .A2 ( cycles_left[2] ) , 
    .ZN ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U68 ( .I ( n65 ) , .ZN ( n17 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( n17 ) , .A2 ( req_addr[23] ) , 
    .B1 ( copt_gre_net_113 ) , .B2 ( req_addr[19] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U70 ( .I ( n18 ) , .ZN ( n19 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U71 ( .A1 ( n57 ) , .A2 ( n20 ) , 
    .B1 ( n43 ) , .B2 ( n19 ) , .ZN ( n46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U72 ( .I ( n46 ) , .ZN ( n22 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U73 ( .I ( n189 ) , .ZN ( n157 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U74 ( .A1 ( n157 ) , .A2 ( n185 ) , 
    .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U75 ( .I ( n64 ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U76 ( .A1 ( n89 ) , .A2 ( n22 ) , 
    .B1 ( n73 ) , .B2 ( n21 ) , .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U77 ( .A1 ( n25 ) , .A2 ( n24 ) , 
    .A3 ( n23 ) , .ZN ( dq_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
    .I1 ( req_addr[17] ) , .S ( copt_gre_net_113 ) , .Z ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_1_131 ( .A1 ( n168 ) , 
    .A2 ( tmp_net68 ) , .A3 ( n169 ) , .ZN ( n223 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_132 ( .A1 ( n171 ) , .A2 ( n170 ) , 
    .Z ( tmp_net68 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n57 ) , .ZN ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( n54 ) , .A2 ( n53 ) , 
    .B1 ( n52 ) , .B2 ( n51 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U106 ( .A1 ( n1 ) , .A2 ( n85 ) , 
    .ZN ( n62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai222_1 ctmTdsLR_1_43 ( .A1 ( n55 ) , 
    .A2 ( req_addr[8] ) , .B1 ( n57 ) , .B2 ( req_addr[16] ) , .C1 ( n56 ) , 
    .C2 ( req_addr[0] ) , .ZN ( n53 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_133 ( .A1 ( n144 ) , 
    .A2 ( tmp_net69 ) , .ZN ( n204 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_134 ( .A1 ( n159 ) , .A2 ( n185 ) , 
    .Z ( tmp_net69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_38 ( .A1 ( n123 ) , 
    .A2 ( tmp_net45 ) , .ZN ( dq_oe[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U123 ( .A1 ( n76 ) , .A2 ( n78 ) , 
    .ZN ( n167 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U124 ( .A1 ( n167 ) , .A2 ( HFSNET_0 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U134 ( .A1 ( n90 ) , .A2 ( HFSNET_0 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U142 ( .A1 ( n231 ) , .A2 ( n228 ) , 
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
    .B ( HFSNET_0 ) , .C ( n233 ) , .ZN ( n101 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U151 ( .I ( n233 ) , .ZN ( n232 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U152 ( .A1 ( n232 ) , .A2 ( HFSNET_0 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_140 ( .A1 ( n148 ) , 
    .A2 ( tmp_net74 ) , .ZN ( n163 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U173 ( .A1 ( cycles_left[3] ) , 
    .A2 ( n112 ) , .B1 ( n111 ) , .B2 ( n114 ) , .ZN ( n217 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_181 ( .A1 ( n159 ) , .A2 ( n175 ) , 
    .Z ( tmp_net101 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__buf_1 copt_gre_mt_inst_201 ( .I ( n54 ) , 
    .Z ( copt_gre_net_113 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U184 ( .A1 ( req_val ) , .A2 ( req_rdy ) , 
    .ZN ( n168 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U185 ( .A1 ( HFSNET_0 ) , .A2 ( n168 ) , 
    .ZN ( n159 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U186 ( .I ( n168 ) , .ZN ( n143 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U187 ( .A1 ( sck ) , .A2 ( n191 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_147 ( .A1 ( req_rdy ) , 
    .A2 ( n154 ) , .B ( tmp_net80 ) , .ZN ( n155 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U200 ( .A1 ( n143 ) , .A2 ( req_data[5] ) , 
    .B1 ( n139 ) , .B2 ( read_data[1] ) , .ZN ( n135 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_148 ( .A1 ( n180 ) , 
    .A2 ( tmp_net79 ) , .ZN ( tmp_net80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U207 ( .A1 ( n143 ) , .A2 ( req_device[0] ) , 
    .B1 ( n148 ) , .B2 ( chip[0] ) , .ZN ( n142 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U208 ( .I ( n142 ) , .ZN ( n205 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U209 ( .A1 ( n143 ) , .A2 ( req_write ) , 
    .ZN ( n144 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_135 ( .A1 ( n226 ) , .A2 ( n227 ) , 
    .ZN ( tmp_net70 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U211 ( .I ( req_device[1] ) , .ZN ( n154 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_149 ( .A1 ( tmp_net78 ) , 
    .A2 ( n152 ) , .ZN ( tmp_net79 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U217 ( .I ( n163 ) , .ZN ( n156 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 ctmTdsLR_1_156 ( .A1 ( n159 ) , 
    .A2 ( tmp_net86 ) , .ZN ( n140 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U219 ( .A1 ( operation[0] ) , 
    .A2 ( status_shift[1] ) , .A3 ( n151 ) , .ZN ( n152 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_2_157 ( .A1 ( n123 ) , 
    .A2 ( n124 ) , .A3 ( tmp_net84 ) , .B ( tmp_net85 ) , .ZN ( tmp_net86 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U221 ( .A1 ( n156 ) , .A2 ( n160 ) , 
    .B1 ( n155 ) , .B2 ( n163 ) , .ZN ( n202 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U222 ( .A1 ( n162 ) , .A2 ( n157 ) , 
    .A3 ( n163 ) , .ZN ( n158 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 copt_gre_mt_inst_202 ( 
    .I ( copt_gre_net_114 ) , .Z ( req_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_136 ( .A1 ( HFSNET_0 ) , 
    .A2 ( tmp_net71 ) , .ZN ( tmp_net72 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U235 ( .A1 ( n183 ) , 
    .A2 ( copt_gre_net_114 ) , .A3 ( n182 ) , .B1 ( state[0] ) , 
    .B2 ( n223 ) , .ZN ( n184 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_141 ( .A1 ( n150 ) , .A2 ( n149 ) , 
    .Z ( tmp_net74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U242 ( .A1 ( n226 ) , .A2 ( n227 ) , 
    .B ( tmp_net70 ) , .C ( tmp_net72 ) , .ZN ( n196 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_40 ( .A1 ( tmp_net46 ) , 
    .A2 ( n58 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_137 ( .I ( state[3] ) , 
    .ZN ( tmp_net71 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_138 ( .A1 ( tmp_net73 ) , 
    .A2 ( n101 ) , .ZN ( n109 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_139 ( .A1 ( n191 ) , .A2 ( n102 ) , 
    .Z ( tmp_net73 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_142 ( .A1 ( n135 ) , 
    .A2 ( tmp_net76 ) , .ZN ( n208 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_143 ( .A1 ( n140 ) , 
    .A2 ( tmp_net75 ) , .ZN ( tmp_net76 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_144 ( .I ( n137 ) , 
    .ZN ( tmp_net75 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_150 ( .I ( n165 ) , 
    .ZN ( tmp_net78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_158 ( .I ( sck ) , 
    .ZN ( tmp_net84 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_159 ( .A1 ( n126 ) , 
    .A2 ( n125 ) , .ZN ( tmp_net85 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_166 ( .A1 ( n112 ) , 
    .A2 ( tmp_net91 ) , .ZN ( n115 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_167 ( .A1 ( n113 ) , .A2 ( n114 ) , 
    .Z ( tmp_net91 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module mem_itf ( clk , rst_n , read_en , write_en , rdy , addr , device , 
    write_data , read_data , read_data_val , qspi_req_val , qspi_req_rdy , 
    qspi_req_write , qspi_req_addr , qspi_req_device , qspi_req_data , 
    qspi_read_data , qspi_read_data_val , VPWR , VGND , HFSNET_0 , ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  read_en ;
input  write_en ;
output rdy ;
input  [23:0] addr ;
input  [1:0] device ;
input  [7:0] write_data ;
output [7:0] read_data ;
output read_data_val ;
output qspi_req_val ;
input  qspi_req_rdy ;
output qspi_req_write ;
output [23:0] qspi_req_addr ;
output [1:0] qspi_req_device ;
output [7:0] qspi_req_data ;
input  [7:0] qspi_read_data ;
input  qspi_read_data_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_0 ;
input  ZCTSNET_0 ;

wire tmp_net81 ;
wire tmp_net88 ;
wire tmp_net89 ;
wire tmp_net90 ;
wire tmp_net95 ;
wire tmp_net96 ;
wire copt_gre_net_118 ;
wire N60 ;
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
wire n1 ;
wire n3 ;
wire n4 ;
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
wire [1:0] state ;
supply1 VPWR ;
supply0 VGND ;

assign qspi_req_addr[23] = addr[23] ;
assign qspi_req_addr[22] = addr[22] ;
assign qspi_req_addr[21] = addr[21] ;
assign qspi_req_addr[20] = addr[20] ;
assign qspi_req_addr[19] = addr[19] ;
assign qspi_req_addr[18] = addr[18] ;
assign qspi_req_addr[17] = addr[17] ;
assign qspi_req_addr[16] = addr[16] ;
assign qspi_req_addr[15] = addr[15] ;
assign qspi_req_addr[14] = addr[14] ;
assign qspi_req_addr[13] = addr[13] ;
assign qspi_req_addr[12] = addr[12] ;
assign qspi_req_addr[11] = addr[11] ;
assign qspi_req_addr[10] = addr[10] ;
assign qspi_req_addr[9] = addr[9] ;
assign qspi_req_addr[8] = addr[8] ;
assign qspi_req_addr[7] = addr[7] ;
assign qspi_req_addr[6] = addr[6] ;
assign qspi_req_addr[5] = addr[5] ;
assign qspi_req_addr[4] = addr[4] ;
assign qspi_req_addr[3] = addr[3] ;
assign qspi_req_addr[2] = addr[2] ;
assign qspi_req_addr[1] = addr[1] ;
assign qspi_req_addr[0] = addr[0] ;
assign qspi_req_device[1] = device[1] ;
assign qspi_req_device[0] = device[0] ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n55 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n54 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 qspi_req_write_reg ( .D ( n56 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_write ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_7_ ( .D ( n53 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_6_ ( .D ( n52 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[6] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_5_ ( .D ( n51 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[5] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_4_ ( .D ( n50 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_3_ ( .D ( n49 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_2_ ( .D ( n48 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_1_ ( .D ( n47 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_0_ ( .D ( n46 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( qspi_req_data[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_7_ ( .D ( n45 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_6_ ( .D ( n44 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_5_ ( .D ( n43 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_4_ ( .D ( n42 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_3_ ( .D ( n41 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_2_ ( .D ( n40 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_1_ ( .D ( n39 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_reg_0_ ( .D ( n38 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 read_data_val_reg ( .D ( N60 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( read_data_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_1_151 ( .A1 ( n11 ) , 
    .A2 ( tmp_net81 ) , .B ( HFSNET_0 ) , .ZN ( n4 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_152 ( .A1 ( state[0] ) , 
    .A2 ( state[1] ) , .Z ( tmp_net81 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_162 ( .A1 ( n4 ) , 
    .A2 ( tmp_net90 ) , .ZN ( n6 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_163 ( .A1 ( tmp_net88 ) , 
    .A2 ( tmp_net89 ) , .ZN ( tmp_net90 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_164 ( .A1 ( qspi_req_rdy ) , 
    .A2 ( state[0] ) , .ZN ( tmp_net88 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_4_165 ( .A1 ( state[0] ) , 
    .A2 ( state[1] ) , .ZN ( tmp_net89 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_171 ( .A1 ( tmp_net95 ) , 
    .A2 ( tmp_net96 ) , .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_172 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_write ) , .ZN ( tmp_net95 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_173 ( .A1 ( write_en ) , 
    .A2 ( rdy ) , .ZN ( tmp_net96 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 copt_gre_mt_inst_206 ( .I ( n19 ) , 
    .Z ( copt_gre_net_118 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( state[0] ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( qspi_req_write ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U32 ( .A1 ( state[1] ) , 
    .A2 ( qspi_read_data_val ) , .A3 ( n3 ) , .A4 ( n1 ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U33 ( .A1 ( rst_n ) , .A2 ( n23 ) , 
    .ZN ( N60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U34 ( .I ( state[1] ) , .ZN ( n7 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U36 ( .A1 ( n3 ) , .A2 ( n7 ) , 
    .A3 ( HFSNET_0 ) , .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U37 ( .I ( n10 ) , .ZN ( rdy ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U38 ( .A1 ( read_en ) , .A2 ( write_en ) , 
    .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U41 ( .I ( n6 ) , .ZN ( n8 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U42 ( .I0 ( state[0] ) , .I1 ( rdy ) , 
    .S ( n8 ) , .Z ( n55 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U43 ( .I ( n4 ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U46 ( .A1 ( n7 ) , .A2 ( state[0] ) , 
    .A3 ( HFSNET_0 ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U47 ( .A1 ( n8 ) , 
    .A2 ( qspi_read_data_val ) , .A3 ( n7 ) , .B1 ( n6 ) , .B2 ( n9 ) , 
    .ZN ( n54 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( n9 ) , .ZN ( qspi_req_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U49 ( .A1 ( n11 ) , .A2 ( n10 ) , 
    .ZN ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U50 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[7] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[7] ) , .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U51 ( .I ( n12 ) , .ZN ( n53 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U52 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[6] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[6] ) , .ZN ( n13 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( n13 ) , .ZN ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U54 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[5] ) , .B1 ( n19 ) , .B2 ( write_data[5] ) , 
    .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U55 ( .I ( n14 ) , .ZN ( n51 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U56 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[4] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[4] ) , .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U57 ( .I ( n15 ) , .ZN ( n50 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U58 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[3] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[3] ) , .ZN ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( n16 ) , .ZN ( n49 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U60 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[2] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[2] ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U61 ( .I ( n17 ) , .ZN ( n48 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U62 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[1] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[1] ) , .ZN ( n18 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U63 ( .I ( n18 ) , .ZN ( n47 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U64 ( .A1 ( n20 ) , 
    .A2 ( qspi_req_data[0] ) , .B1 ( copt_gre_net_118 ) , 
    .B2 ( write_data[0] ) , .ZN ( n21 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U65 ( .I ( n21 ) , .ZN ( n46 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U66 ( .A1 ( n23 ) , .A2 ( HFSNET_0 ) , 
    .Z ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U67 ( .A1 ( n31 ) , .A2 ( read_data[7] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[7] ) , .ZN ( n24 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U68 ( .I ( n24 ) , .ZN ( n45 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U69 ( .A1 ( n31 ) , .A2 ( read_data[6] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[6] ) , .ZN ( n25 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U70 ( .I ( n25 ) , .ZN ( n44 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U71 ( .A1 ( n31 ) , .A2 ( read_data[5] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[5] ) , .ZN ( n26 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U72 ( .I ( n26 ) , .ZN ( n43 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U73 ( .A1 ( n31 ) , .A2 ( read_data[4] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[4] ) , .ZN ( n27 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U74 ( .I ( n27 ) , .ZN ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U75 ( .A1 ( n31 ) , .A2 ( read_data[3] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[3] ) , .ZN ( n28 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U76 ( .I ( n28 ) , .ZN ( n41 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U77 ( .A1 ( n31 ) , .A2 ( read_data[2] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[2] ) , .ZN ( n29 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U78 ( .I ( n29 ) , .ZN ( n40 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U79 ( .A1 ( n31 ) , .A2 ( read_data[1] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[1] ) , .ZN ( n30 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U80 ( .I ( n30 ) , .ZN ( n39 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U81 ( .A1 ( n31 ) , .A2 ( read_data[0] ) , 
    .B1 ( N60 ) , .B2 ( qspi_read_data[0] ) , .ZN ( n32 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U82 ( .I ( n32 ) , .ZN ( n38 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module exec_unit ( clk , rst_n , exec_inst_in , exec_inst_in_val , exec_rdy , 
    data_in , data_in_val , is_weight , input_scalar_mode , input_select , 
    data_out , data_out_val , VPWR , VGND , ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  [5:0] exec_inst_in ;
input  exec_inst_in_val ;
output exec_rdy ;
input  [7:0] data_in ;
input  data_in_val ;
input  is_weight ;
input  input_scalar_mode ;
input  [0:0] input_select ;
output [7:0] data_out ;
output data_out_val ;
input  VPWR ;
input  VGND ;
input  ZCTSNET_0 ;

wire tmp_net39 ;
wire tmp_net40 ;
wire N1609 ;
wire n609 ;
wire n611 ;
wire n612 ;
wire n613 ;
wire n614 ;
wire n615 ;
wire n616 ;
wire n617 ;
wire n618 ;
wire n619 ;
wire n620 ;
wire n621 ;
wire n622 ;
wire n623 ;
wire n624 ;
wire n625 ;
wire n626 ;
wire n627 ;
wire n628 ;
wire n629 ;
wire n630 ;
wire n631 ;
wire n632 ;
wire n633 ;
wire n634 ;
wire n635 ;
wire n636 ;
wire n637 ;
wire n638 ;
wire n639 ;
wire n640 ;
wire n641 ;
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
wire HFSNET_2 ;
wire HFSNET_3 ;
wire n3 ;
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
wire n87 ;
wire n88 ;
wire n89 ;
wire n90 ;
wire n92 ;
wire n93_CDR1 ;
wire n94_CDR1 ;
wire n95_CDR1 ;
wire n96_CDR1 ;
wire n97 ;
wire n98 ;
wire n99 ;
wire n100 ;
wire n101_CDR1 ;
wire n102_CDR1 ;
wire n103_CDR1 ;
wire n104_CDR1 ;
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
wire tmp_net61 ;
wire n171 ;
wire n172 ;
wire n173 ;
wire n174 ;
wire n175 ;
wire n176 ;
wire tmp_net62 ;
wire tmp_net97 ;
wire n179 ;
wire n180 ;
wire n181 ;
wire n182 ;
wire n183 ;
wire n184 ;
wire n185 ;
wire n186 ;
wire n187 ;
wire tmp_net98 ;
wire n189 ;
wire n190 ;
wire tmp_net102 ;
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
wire n281 ;
wire n282 ;
wire n283 ;
wire n284 ;
wire n285 ;
wire n286 ;
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
wire n304 ;
wire n305 ;
wire n306 ;
wire n307 ;
wire n308 ;
wire n309 ;
wire n310 ;
wire n311 ;
wire n312 ;
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
wire n341 ;
wire n342 ;
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
wire n356 ;
wire n357 ;
wire n358 ;
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
wire n378 ;
wire n379 ;
wire n380 ;
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
wire tmp_net41 ;
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
wire n456 ;
wire n457 ;
wire n458 ;
wire n459 ;
wire n460 ;
wire n461 ;
wire n462 ;
wire n463 ;
wire n464 ;
wire n465 ;
wire n466 ;
wire n467 ;
wire n468 ;
wire n469 ;
wire n473 ;
wire n474 ;
wire n475 ;
wire n476 ;
wire n481 ;
wire n482 ;
wire n483 ;
wire n484 ;
wire n485 ;
wire n486 ;
wire n487 ;
wire n488 ;
wire n489 ;
wire n490 ;
wire n491 ;
wire n492 ;
wire n493 ;
wire n494 ;
wire n495 ;
wire n496 ;
wire n497 ;
wire n499 ;
wire n500 ;
wire n501 ;
wire n502 ;
wire n503 ;
wire n504 ;
wire n505 ;
wire n506 ;
wire n507 ;
wire n508 ;
wire n509 ;
wire n510 ;
wire n512 ;
wire n513 ;
wire n514 ;
wire n515 ;
wire n516 ;
wire n517 ;
wire n518 ;
wire n519 ;
wire n520 ;
wire n521 ;
wire n522 ;
wire n523 ;
wire n524 ;
wire n525 ;
wire n526 ;
wire n527 ;
wire n528 ;
wire n529 ;
wire n530 ;
wire n531 ;
wire n532 ;
wire n533 ;
wire n534 ;
wire n535 ;
wire n536 ;
wire n537 ;
wire n538 ;
wire n539 ;
wire n540 ;
wire n541 ;
wire n542 ;
wire n543 ;
wire n544 ;
wire n545 ;
wire n546 ;
wire n547 ;
wire n548 ;
wire n549 ;
wire n550 ;
wire n551 ;
wire n552 ;
wire n553 ;
wire n554 ;
wire n555 ;
wire n556 ;
wire n557 ;
wire n558 ;
wire n559 ;
wire [7:0] inputs ;
wire [7:0] lanes_0__weight_reg ;
wire [7:0] lanes_0__acc_reg ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net42 ;
wire tmp_net43 ;
wire tmp_net44 ;
wire tmp_net48 ;
wire tmp_net49 ;
wire tmp_net50 ;
wire tmp_net51 ;

assign exec_rdy = rst_n ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_7_ ( .D ( n641 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_6_ ( .D ( n640 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_5_ ( .D ( n639 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_4_ ( .D ( n638 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_3_ ( .D ( n637 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_2_ ( .D ( n636 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_1_ ( .D ( n635 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inputs_reg_0_ ( .D ( n634 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inputs[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_7_ ( .D ( n616 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_6_ ( .D ( n615 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[6] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_5_ ( .D ( n614 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[5] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_4_ ( .D ( n613 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_3_ ( .D ( n612 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_2_ ( .D ( n611 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_0_ ( .D ( n617 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_0_ ( .D ( n633 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_7_ ( .D ( n626 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_5_ ( .D ( n628 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[5] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_4_ ( .D ( n629 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_3_ ( .D ( n630 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_6_ ( .D ( n627 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__acc_reg[6] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_1_ ( .D ( n632 ) , 
    .CLK ( clk ) , .Q ( lanes_0__acc_reg[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__acc_reg_reg_2_ ( .D ( n631 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__acc_reg[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_3_ ( .D ( n622 ) , .CLK ( clk ) , 
    .Q ( data_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_4_ ( .D ( n621 ) , .CLK ( clk ) , 
    .Q ( data_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_5_ ( .D ( n620 ) , .CLK ( clk ) , 
    .Q ( data_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_0_ ( .D ( n625 ) , .CLK ( clk ) , 
    .Q ( data_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_1_ ( .D ( n624 ) , .CLK ( clk ) , 
    .Q ( data_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_2_ ( .D ( n623 ) , .CLK ( clk ) , 
    .Q ( data_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_6_ ( .D ( n619 ) , .CLK ( clk ) , 
    .Q ( data_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_reg_7_ ( .D ( n618 ) , .CLK ( clk ) , 
    .Q ( data_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 data_out_val_reg ( .D ( N1609 ) , 
    .CLK ( clk ) , .Q ( data_out_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__dffq_1 lanes_0__weight_reg_reg_1_ ( .D ( n609 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( lanes_0__weight_reg[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_1_25 ( .A1 ( n172 ) , 
    .A2 ( n171 ) , .B1 ( n181 ) , .B2 ( n145 ) , .C ( n169 ) , .ZN ( n173 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 HFSINV_645_9 ( .I ( n413 ) , .ZN ( HFSNET_2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( n5 ) , .ZN ( n3 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and4_1 ctmTdsLR_1_182 ( .A1 ( n88 ) , 
    .A2 ( tmp_net102 ) , .A3 ( n89 ) , .A4 ( n90 ) , .Z ( n116 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U7 ( .A1 ( n268 ) , .A2 ( n202 ) , 
    .B1 ( n268 ) , .B2 ( n334 ) , .C1 ( n202 ) , .C2 ( n334 ) , .ZN ( n413 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U8 ( .A1 ( n30 ) , .A2 ( exec_inst_in[4] ) , 
    .ZN ( n5 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_26 ( .A1 ( n190 ) , .A2 ( n189 ) , 
    .ZN ( tmp_net39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( lanes_0__weight_reg[0] ) , 
    .ZN ( n543 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( inputs[2] ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U12 ( .A1 ( n543 ) , .A2 ( n23 ) , 
    .ZN ( intadd_0_A_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U13 ( .A1 ( exec_rdy ) , 
    .A2 ( exec_inst_in_val ) , .ZN ( n427 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( n427 ) , .ZN ( N1609 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( inputs[7] ) , .ZN ( n29 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( is_weight ) , .ZN ( n6 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U17 ( .A1 ( data_in_val ) , 
    .A2 ( exec_rdy ) , .A3 ( n6 ) , .ZN ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U18 ( .A1 ( exec_rdy ) , .A2 ( n7 ) , 
    .ZN ( n8 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( data_in[7] ) , .ZN ( n544 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U20 ( .A1 ( n29 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n544 ) , .ZN ( n641 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( inputs[6] ) , .ZN ( n9 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( data_in[6] ) , .ZN ( n546 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U23 ( .A1 ( n9 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n546 ) , .ZN ( n640 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U24 ( .I ( inputs[5] ) , .ZN ( n48 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U25 ( .I ( data_in[5] ) , .ZN ( n548 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U26 ( .A1 ( n48 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n548 ) , .ZN ( n639 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U27 ( .I ( inputs[4] ) , .ZN ( n47 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U28 ( .I ( data_in[4] ) , .ZN ( n550 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U29 ( .A1 ( n47 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n550 ) , .ZN ( n638 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U30 ( .I ( inputs[3] ) , .ZN ( n186 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U31 ( .I ( data_in[3] ) , .ZN ( n552 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U32 ( .A1 ( n186 ) , .A2 ( n8 ) , 
    .B1 ( n7 ) , .B2 ( n552 ) , .ZN ( n637 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U33 ( .I ( data_in[2] ) , .ZN ( n554 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U34 ( .A1 ( n23 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n554 ) , .ZN ( n636 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U35 ( .I ( inputs[1] ) , .ZN ( n140 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U36 ( .I ( data_in[1] ) , .ZN ( n557 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U37 ( .A1 ( n140 ) , .A2 ( n8 ) , 
    .B1 ( n7 ) , .B2 ( n557 ) , .ZN ( n635 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U38 ( .I ( inputs[0] ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U39 ( .I ( data_in[0] ) , .ZN ( n542 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U40 ( .A1 ( n13 ) , .A2 ( n8 ) , .B1 ( n7 ) , 
    .B2 ( n542 ) , .ZN ( n634 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U41 ( .I ( lanes_0__weight_reg[5] ) , 
    .ZN ( n549 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( lanes_0__weight_reg[6] ) , 
    .ZN ( n547 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U43 ( .I ( lanes_0__weight_reg[4] ) , 
    .ZN ( n551 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U44 ( .A1 ( n549 ) , .A2 ( n547 ) , 
    .A3 ( n551 ) , .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U45 ( .A1 ( n51 ) , 
    .A2 ( lanes_0__weight_reg[3] ) , .ZN ( n24 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U46 ( .I ( lanes_0__weight_reg[1] ) , 
    .ZN ( n559 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U47 ( .A1 ( inputs[1] ) , 
    .A2 ( lanes_0__weight_reg[2] ) , .ZN ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U48 ( .A1 ( n24 ) , .A2 ( n559 ) , 
    .B ( n13 ) , .C ( n16 ) , .ZN ( intadd_0_A_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U49 ( .A1 ( n9 ) , .A2 ( n47 ) , 
    .A3 ( n48 ) , .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n56 ) , .A2 ( inputs[3] ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U51 ( .I ( n22 ) , .ZN ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and3_1 U52 ( .A1 ( lanes_0__weight_reg[1] ) , 
    .A2 ( intadd_0_A_0_ ) , .A3 ( n42 ) , .Z ( n21 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U53 ( .A1 ( inputs[2] ) , 
    .A2 ( lanes_0__weight_reg[1] ) , .B1 ( lanes_0__weight_reg[0] ) , 
    .B2 ( n42 ) , .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U54 ( .A1 ( n21 ) , .A2 ( n10 ) , 
    .ZN ( intadd_0_A_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U55 ( .A1 ( lanes_0__weight_reg[1] ) , 
    .A2 ( inputs[1] ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U56 ( .A1 ( lanes_0__weight_reg[0] ) , 
    .A2 ( inputs[0] ) , .ZN ( n153 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U57 ( .A1 ( n17 ) , .A2 ( n153 ) , 
    .ZN ( intadd_0_B_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U58 ( .I ( lanes_0__weight_reg[2] ) , 
    .ZN ( n555 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U59 ( .A1 ( lanes_0__weight_reg[1] ) , 
    .A2 ( inputs[0] ) , .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U60 ( .A1 ( n11 ) , .A2 ( n16 ) , 
    .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U61 ( .A1 ( n13 ) , .A2 ( n17 ) , 
    .B1 ( n555 ) , .B2 ( n17 ) , .C ( n12 ) , .ZN ( intadd_0_CI ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U62 ( .A1 ( n16 ) , 
    .A2 ( lanes_0__weight_reg[1] ) , .Z ( n15 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U63 ( .I ( n24 ) , .ZN ( n41 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U64 ( .A1 ( n41 ) , .A2 ( inputs[0] ) , 
    .A3 ( n15 ) , .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 U65 ( .A1 ( n16 ) , .A2 ( inputs[0] ) , 
    .B1 ( n15 ) , .B2 ( n41 ) , .C ( n14 ) , .ZN ( intadd_0_B_1_ ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U66 ( .A1 ( lanes_0__weight_reg[1] ) , 
    .A2 ( n42 ) , .ZN ( n18 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U67 ( .A1 ( n41 ) , .A2 ( n42 ) , 
    .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U68 ( .A1 ( n38 ) , .A2 ( n17 ) , 
    .ZN ( n35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U69 ( .A1 ( n24 ) , .A2 ( n18 ) , 
    .B1 ( n140 ) , .B2 ( n18 ) , .C ( n35 ) , .ZN ( n20 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U70 ( .A1 ( n23 ) , .A2 ( n555 ) , 
    .ZN ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U71 ( .A ( n21 ) , .B ( n20 ) , .CI ( n19 ) , 
    .CO ( intadd_0_A_3_ ) , .S ( intadd_0_B_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U72 ( .A1 ( n22 ) , .A2 ( n555 ) , 
    .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U73 ( .A1 ( n24 ) , .A2 ( n23 ) , 
    .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U74 ( .I ( exec_inst_in[3] ) , .ZN ( n30 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U75 ( .A1 ( n30 ) , .A2 ( exec_inst_in[4] ) , 
    .ZN ( n294 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U76 ( .I ( n294 ) , .ZN ( n201 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U77 ( .I ( lanes_0__weight_reg[7] ) , 
    .ZN ( n545 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U78 ( .A1 ( inputs[6] ) , .A2 ( inputs[3] ) , 
    .A3 ( inputs[1] ) , .A4 ( inputs[0] ) , .ZN ( n28 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U79 ( .A1 ( inputs[4] ) , .A2 ( inputs[5] ) , 
    .A3 ( inputs[2] ) , .ZN ( n27 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U80 ( .A1 ( lanes_0__weight_reg[6] ) , 
    .A2 ( lanes_0__weight_reg[3] ) , .A3 ( lanes_0__weight_reg[1] ) , 
    .A4 ( lanes_0__weight_reg[2] ) , .ZN ( n26 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U81 ( .A1 ( lanes_0__weight_reg[5] ) , 
    .A2 ( lanes_0__weight_reg[4] ) , .A3 ( lanes_0__weight_reg[0] ) , 
    .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U82 ( .A1 ( n28 ) , .A2 ( n27 ) , 
    .B1 ( n26 ) , .B2 ( n25 ) , .ZN ( n141 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_2 U83 ( .A1 ( inputs[7] ) , 
    .A2 ( lanes_0__weight_reg[7] ) , .B1 ( n29 ) , .B2 ( n545 ) , 
    .C ( n141 ) , .ZN ( n422 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U84 ( .A1 ( n201 ) , .A2 ( n422 ) , 
    .B1 ( inputs[7] ) , .B2 ( n5 ) , .ZN ( n417 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U85 ( .A1 ( exec_inst_in[4] ) , .A2 ( n30 ) , 
    .ZN ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U86 ( .A1 ( lanes_0__weight_reg[7] ) , 
    .A2 ( n31 ) , .Z ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U87 ( .A1 ( n3 ) , 
    .A2 ( lanes_0__acc_reg[7] ) , .B1 ( n32 ) , .B2 ( n294 ) , .ZN ( n415 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U88 ( .A1 ( n417 ) , .A2 ( n415 ) , 
    .Z ( n259 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U89 ( .I ( n259 ) , .ZN ( n273 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U90 ( .A1 ( n47 ) , .A2 ( n48 ) , 
    .ZN ( n33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U91 ( .A1 ( inputs[6] ) , .A2 ( n33 ) , 
    .ZN ( n126 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U92 ( .A ( n36 ) , .B ( n35 ) , .CI ( n34 ) , 
    .CO ( n44 ) , .S ( intadd_0_B_3_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U93 ( .A1 ( intadd_0_n1 ) , .A2 ( n41 ) , 
    .A3 ( n42 ) , .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( intadd_0_n1 ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U95 ( .A1 ( n44 ) , .A2 ( n38 ) , 
    .B ( n37 ) , .ZN ( n43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U96 ( .A1 ( n44 ) , .A2 ( n39 ) , 
    .B ( n43 ) , .ZN ( n69 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U97 ( .I ( intadd_0_SUM_3_ ) , .ZN ( n163 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U98 ( .A1 ( n69 ) , .A2 ( n163 ) , 
    .ZN ( n75 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U99 ( .I ( n44 ) , .ZN ( n40 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U100 ( .A1 ( n40 ) , .A2 ( n39 ) , 
    .ZN ( n144 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U101 ( .A1 ( intadd_0_SUM_2_ ) , .A2 ( n75 ) , 
    .A3 ( n144 ) , .ZN ( n134 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( lanes_0__weight_reg[3] ) , 
    .ZN ( n553 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U103 ( .A1 ( n553 ) , .A2 ( n41 ) , 
    .ZN ( n46 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U104 ( .A1 ( n186 ) , .A2 ( n42 ) , 
    .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U105 ( .A1 ( n46 ) , .A2 ( n45 ) , 
    .Z ( n80 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U106 ( .A1 ( n69 ) , 
    .A2 ( intadd_0_SUM_3_ ) , .B ( n144 ) , .C ( n134 ) , .ZN ( n81 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U107 ( .I ( n81 ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U108 ( .A1 ( n80 ) , .A2 ( n68 ) , 
    .ZN ( n71 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U109 ( .A1 ( n44 ) , .A2 ( n134 ) , 
    .A3 ( n43 ) , .ZN ( n70 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U110 ( .A1 ( n46 ) , .A2 ( n45 ) , 
    .ZN ( n49 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( inputs[4] ) , 
    .A2 ( inputs[5] ) , .B1 ( n48 ) , .B2 ( n47 ) , .ZN ( n54 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U112 ( .A ( inputs[4] ) , 
    .B ( lanes_0__weight_reg[4] ) , .CI ( n49 ) , .CO ( n53 ) , .S ( n76 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( lanes_0__weight_reg[5] ) , 
    .A2 ( lanes_0__weight_reg[4] ) , .B1 ( n551 ) , .B2 ( n549 ) , 
    .ZN ( n52 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U114 ( .A1 ( n549 ) , .A2 ( n551 ) , 
    .ZN ( n50 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U115 ( .A1 ( lanes_0__weight_reg[6] ) , 
    .A2 ( n50 ) , .ZN ( n125 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U116 ( .A1 ( n51 ) , .A2 ( n125 ) , 
    .ZN ( n57 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U117 ( .A ( n54 ) , .B ( n53 ) , .CI ( n52 ) , 
    .CO ( n55 ) , .S ( n74 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n55 ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U119 ( .A1 ( n56 ) , .A2 ( n126 ) , 
    .ZN ( n58 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor3_2 U120 ( .A1 ( n57 ) , .A2 ( n59 ) , 
    .A3 ( n58 ) , .Z ( n127 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U121 ( .I ( n127 ) , .ZN ( n65 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U122 ( .A1 ( n66 ) , .A2 ( n65 ) , .Z ( n61 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U123 ( .A1 ( n58 ) , .A2 ( n57 ) , 
    .ZN ( n60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U124 ( .A1 ( n60 ) , .A2 ( n59 ) , 
    .ZN ( n62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U125 ( .A1 ( n126 ) , .A2 ( n61 ) , 
    .B ( n62 ) , .C ( n125 ) , .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U126 ( .A1 ( n62 ) , .A2 ( n125 ) , 
    .B ( n61 ) , .C ( n126 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U127 ( .A1 ( n64 ) , .A2 ( n63 ) , 
    .ZN ( n131 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U128 ( .A1 ( n66 ) , .A2 ( n65 ) , 
    .Z ( n114 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U129 ( .A ( n134 ) , .B ( n67 ) , 
    .CI ( n74 ) , .CO ( n66 ) , .S ( n118 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U130 ( .A1 ( n80 ) , .A2 ( n68 ) , 
    .B ( n71 ) , .ZN ( n119 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U131 ( .I ( n69 ) , .ZN ( n142 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U132 ( .A ( n71 ) , .B ( n70 ) , .CI ( n76 ) , 
    .CO ( n67 ) , .S ( n122 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U133 ( .A1 ( n118 ) , .A2 ( n122 ) , 
    .ZN ( n73 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U134 ( .I ( n131 ) , .ZN ( n72 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U135 ( .A1 ( n73 ) , .A2 ( n114 ) , 
    .B ( n72 ) , .ZN ( n133 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U136 ( .A1 ( n133 ) , .A2 ( n74 ) , 
    .B ( n144 ) , .ZN ( n83 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U137 ( .A1 ( n127 ) , .A2 ( n133 ) , 
    .ZN ( n97 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U138 ( .I ( n97 ) , .ZN ( n79 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U139 ( .I ( n133 ) , .ZN ( n183 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U140 ( .A1 ( n183 ) , .A2 ( n75 ) , 
    .ZN ( n78 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U141 ( .I ( n76 ) , .ZN ( n77 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U142 ( .A1 ( n144 ) , .A2 ( n78 ) , 
    .B1 ( n77 ) , .B2 ( n183 ) , .ZN ( n82 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U143 ( .A1 ( n79 ) , .A2 ( n82 ) , 
    .ZN ( n84 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U144 ( .A1 ( n183 ) , .A2 ( n80 ) , 
    .ZN ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U145 ( .A1 ( n183 ) , .A2 ( n81 ) , 
    .B ( n98 ) , .ZN ( n92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U146 ( .I ( n92 ) , .ZN ( n87 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U147 ( .A1 ( n84 ) , .A2 ( n87 ) , 
    .ZN ( n106 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U148 ( .A1 ( n83 ) , .A2 ( n106 ) , 
    .ZN ( n159 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U149 ( .A1 ( n83 ) , .A2 ( n82 ) , 
    .ZN ( n155 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U150 ( .A1 ( n87 ) , .A2 ( n155 ) , 
    .ZN ( n105 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U151 ( .I ( n83 ) , .ZN ( n85 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U152 ( .A1 ( n85 ) , .A2 ( n82 ) , 
    .ZN ( n149 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U153 ( .A1 ( n87 ) , .A2 ( n149 ) , 
    .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U154 ( .A1 ( n105 ) , 
    .A2 ( intadd_0_SUM_1_ ) , .B1 ( n99 ) , .B2 ( n144 ) , .ZN ( n90 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U155 ( .A1 ( n92 ) , .A2 ( n155 ) , 
    .ZN ( n167 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U156 ( .A1 ( n83 ) , .A2 ( n84 ) , 
    .ZN ( n86 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U157 ( .A1 ( n92 ) , .A2 ( n86 ) , 
    .ZN ( n109 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U158 ( .A1 ( intadd_0_SUM_2_ ) , 
    .A2 ( n167 ) , .B1 ( n109 ) , .B2 ( intadd_0_SUM_0_ ) , .ZN ( n89 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U159 ( .A1 ( n92 ) , .A2 ( n84 ) , 
    .Z ( n143 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U160 ( .A1 ( n85 ) , .A2 ( n143 ) , 
    .ZN ( n154 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U161 ( .I ( n154 ) , .ZN ( n165 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U162 ( .A1 ( n87 ) , .A2 ( n86 ) , 
    .ZN ( n108 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U163 ( .A1 ( lanes_0__weight_reg[1] ) , 
    .A2 ( inputs[0] ) , .B1 ( inputs[1] ) , .B2 ( lanes_0__weight_reg[0] ) , 
    .ZN ( n152 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U164 ( .A1 ( intadd_0_B_0_ ) , .A2 ( n152 ) , 
    .ZN ( n166 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U165 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n165 ) , .B1 ( n108 ) , .B2 ( n166 ) , .ZN ( n88 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U168 ( .A1 ( n92 ) , .A2 ( n149 ) , 
    .ZN ( n146 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U169 ( .A1 ( n146 ) , .A2 ( n144 ) , 
    .B1 ( n142 ) , .B2 ( n99 ) , .ZN ( n96_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U170 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n159 ) , .B1 ( intadd_0_SUM_2_ ) , .B2 ( n165 ) , .ZN ( n95_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U171 ( .A1 ( n108 ) , .A2 ( n100 ) , 
    .B1 ( n109 ) , .B2 ( n166 ) , .ZN ( n94_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U172 ( .I ( n153 ) , .ZN ( n100 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U173 ( .A1 ( n105 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .B1 ( intadd_0_SUM_1_ ) , .B2 ( n167 ) , 
    .ZN ( n93_CDR1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U174 ( .A1 ( n96_CDR1 ) , .A2 ( n95_CDR1 ) , 
    .A3 ( n94_CDR1 ) , .A4 ( n93_CDR1 ) , .ZN ( n171 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U175 ( .A1 ( n98 ) , .A2 ( n97 ) , 
    .ZN ( n147 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U176 ( .A1 ( n147 ) , .A2 ( n144 ) , 
    .B1 ( n142 ) , .B2 ( n146 ) , .ZN ( n104_CDR1 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U177 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n99 ) , .B1 ( intadd_0_SUM_2_ ) , .B2 ( n159 ) , .ZN ( n103_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U178 ( .A1 ( n167 ) , 
    .A2 ( intadd_0_SUM_0_ ) , .B1 ( n109 ) , .B2 ( n100 ) , 
    .ZN ( n102_CDR1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U179 ( .A1 ( intadd_0_SUM_1_ ) , 
    .A2 ( n165 ) , .B1 ( n105 ) , .B2 ( n166 ) , .ZN ( n101_CDR1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U180 ( .A1 ( n104_CDR1 ) , 
    .A2 ( n103_CDR1 ) , .A3 ( n102_CDR1 ) , .A4 ( n101_CDR1 ) , .ZN ( n172 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U181 ( .A1 ( n171 ) , .A2 ( n172 ) , 
    .ZN ( n115 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U182 ( .A1 ( n116 ) , .A2 ( n115 ) , 
    .ZN ( n176 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U183 ( .A1 ( intadd_0_SUM_3_ ) , 
    .A2 ( n167 ) , .B1 ( intadd_0_SUM_2_ ) , .B2 ( n105 ) , .ZN ( n112 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U184 ( .I ( n106 ) , .ZN ( n107 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U185 ( .A1 ( n165 ) , .A2 ( n142 ) , 
    .B1 ( n107 ) , .B2 ( n144 ) , .ZN ( n111 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U186 ( .A1 ( n109 ) , 
    .A2 ( intadd_0_SUM_1_ ) , .B1 ( intadd_0_SUM_0_ ) , .B2 ( n108 ) , 
    .ZN ( n110 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U187 ( .A1 ( n112 ) , .A2 ( n111 ) , 
    .A3 ( n110 ) , .ZN ( n179 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U188 ( .A1 ( n176 ) , .A2 ( n179 ) , 
    .ZN ( n182 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U189 ( .A1 ( n119 ) , .A2 ( n182 ) , 
    .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U190 ( .I ( n122 ) , .ZN ( n189 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U191 ( .A1 ( n123 ) , .A2 ( n189 ) , 
    .ZN ( n117 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U192 ( .A1 ( n118 ) , .A2 ( n117 ) , 
    .ZN ( n113 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U193 ( .A1 ( n114 ) , .A2 ( n113 ) , 
    .Z ( n137 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U194 ( .A1 ( n116 ) , .A2 ( n115 ) , 
    .Z ( n139 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U195 ( .A1 ( n118 ) , .A2 ( n117 ) , 
    .Z ( n193 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U196 ( .A1 ( n182 ) , .A2 ( n119 ) , 
    .Z ( n190 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U197 ( .I ( n190 ) , .ZN ( n121 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U198 ( .A1 ( n123 ) , .A2 ( n122 ) , 
    .ZN ( n120 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U199 ( .A1 ( n123 ) , .A2 ( n122 ) , 
    .B ( n121 ) , .C ( n120 ) , .ZN ( n194 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U200 ( .A1 ( n193 ) , .A2 ( n194 ) , 
    .Z ( n136 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U201 ( .A1 ( n179 ) , .A2 ( n139 ) , 
    .B ( n136 ) , .ZN ( n124 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U202 ( .I ( n124 ) , .ZN ( n129 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U203 ( .A1 ( n126 ) , .A2 ( n125 ) , 
    .ZN ( n128 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U204 ( .A1 ( n137 ) , .A2 ( n129 ) , 
    .B1 ( n128 ) , .B2 ( n127 ) , .ZN ( n130 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U205 ( .A1 ( n131 ) , .A2 ( n130 ) , 
    .ZN ( n132 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U206 ( .A1 ( n132 ) , .A2 ( n141 ) , 
    .ZN ( n195 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U207 ( .I ( intadd_0_SUM_1_ ) , .ZN ( n151 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U208 ( .A1 ( n134 ) , .A2 ( n151 ) , 
    .B ( n133 ) , .C ( n132 ) , .ZN ( n181 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U209 ( .A1 ( n137 ) , .A2 ( n136 ) , 
    .ZN ( n135 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U210 ( .A1 ( n137 ) , .A2 ( n136 ) , 
    .B ( n181 ) , .C ( n135 ) , .ZN ( n138 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U211 ( .A1 ( n195 ) , .A2 ( n138 ) , 
    .ZN ( n405 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U212 ( .A1 ( n201 ) , .A2 ( n405 ) , 
    .B1 ( inputs[6] ) , .B2 ( n294 ) , .ZN ( n268 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U213 ( .A1 ( n201 ) , 
    .A2 ( lanes_0__acc_reg[3] ) , .B1 ( lanes_0__weight_reg[3] ) , 
    .B2 ( n5 ) , .ZN ( n207 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U214 ( .A1 ( n201 ) , 
    .A2 ( lanes_0__acc_reg[1] ) , .B1 ( lanes_0__weight_reg[1] ) , 
    .B2 ( n5 ) , .ZN ( n337 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U215 ( .I ( n195 ) , .ZN ( n185 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U216 ( .A1 ( n139 ) , .A2 ( n185 ) , 
    .ZN ( n360 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U217 ( .A1 ( n3 ) , .A2 ( n360 ) , 
    .B1 ( n140 ) , .B2 ( n294 ) , .ZN ( n340 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U218 ( .I ( lanes_0__acc_reg[0] ) , 
    .ZN ( n352 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U219 ( .A1 ( n3 ) , .A2 ( n352 ) , 
    .B1 ( n543 ) , .B2 ( n294 ) , .ZN ( n222 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U220 ( .I ( n141 ) , .ZN ( n174 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U221 ( .A1 ( n144 ) , .A2 ( n143 ) , 
    .B1 ( n167 ) , .B2 ( n142 ) , .ZN ( n145 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_1_31 ( .A1 ( n320 ) , 
    .A2 ( n282 ) , .B1 ( n370 ) , .B2 ( n316 ) , .C ( n285 ) , 
    .ZN ( tmp_net42 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U223 ( .I ( n146 ) , .ZN ( n162 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U224 ( .I ( n147 ) , .ZN ( n148 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U225 ( .A1 ( n149 ) , .A2 ( n148 ) , 
    .ZN ( n157 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U226 ( .A1 ( intadd_0_SUM_2_ ) , 
    .A2 ( n157 ) , .B1 ( intadd_0_SUM_0_ ) , .B2 ( n165 ) , .ZN ( n161 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U227 ( .I ( intadd_0_SUM_0_ ) , .ZN ( n150 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U228 ( .A1 ( n152 ) , .A2 ( n151 ) , 
    .A3 ( n150 ) , .A4 ( n153 ) , .ZN ( n158 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U229 ( .A1 ( n155 ) , .A2 ( n154 ) , 
    .B ( n153 ) , .ZN ( n156 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U230 ( .A1 ( n159 ) , .A2 ( n158 ) , 
    .B1 ( n157 ) , .B2 ( n158 ) , .C ( n156 ) , .ZN ( n160 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U231 ( .A1 ( n163 ) , .A2 ( n162 ) , 
    .B ( n161 ) , .C ( n160 ) , .ZN ( n164 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U232 ( .A1 ( n167 ) , .A2 ( n166 ) , 
    .B1 ( n165 ) , .B2 ( n166 ) , .C ( n164 ) , .ZN ( n168 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U233 ( .A1 ( n168 ) , .A2 ( n171 ) , 
    .B ( n172 ) , .ZN ( n169 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_32 ( .A1 ( n285 ) , .A2 ( n286 ) , 
    .B ( tmp_net42 ) , .ZN ( n372 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U235 ( .A1 ( n174 ) , .A2 ( n173 ) , 
    .ZN ( n329 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U236 ( .A1 ( n201 ) , .A2 ( n329 ) , 
    .B1 ( inputs[0] ) , .B2 ( n5 ) , .ZN ( n344 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U237 ( .A1 ( n222 ) , .A2 ( n344 ) , 
    .ZN ( n175 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U238 ( .A1 ( n337 ) , .A2 ( n340 ) , 
    .B1 ( n337 ) , .B2 ( n175 ) , .C1 ( n340 ) , .C2 ( n175 ) , .ZN ( n180 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_122 ( .A1 ( n373 ) , .A2 ( n372 ) , 
    .ZN ( tmp_net61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_2_123 ( .A1 ( n370 ) , 
    .A2 ( n371 ) , .B1 ( n375 ) , .B2 ( n374 ) , .C ( n369 ) , 
    .ZN ( tmp_net62 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_174 ( .A1 ( n504 ) , 
    .A2 ( n524 ) , .B ( tmp_net98 ) , .ZN ( n512 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U242 ( .A1 ( n3 ) , .A2 ( n362 ) , 
    .B1 ( inputs[2] ) , .B2 ( n294 ) , .ZN ( n254 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U243 ( .I ( lanes_0__acc_reg[2] ) , 
    .ZN ( n366 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U244 ( .A1 ( n201 ) , .A2 ( n366 ) , 
    .B1 ( n555 ) , .B2 ( n5 ) , .ZN ( n331 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U245 ( .A1 ( n180 ) , .A2 ( n254 ) , 
    .B1 ( n180 ) , .B2 ( n331 ) , .C1 ( n254 ) , .C2 ( n331 ) , .ZN ( n187 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U246 ( .I ( n181 ) , .ZN ( n196 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U247 ( .A1 ( n190 ) , .A2 ( n196 ) , 
    .B1 ( n183 ) , .B2 ( n182 ) , .ZN ( n184 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U248 ( .A1 ( n185 ) , .A2 ( n184 ) , 
    .ZN ( n384 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U249 ( .A1 ( n3 ) , .A2 ( n384 ) , 
    .B1 ( n186 ) , .B2 ( n294 ) , .ZN ( n205 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U250 ( .A1 ( n207 ) , .A2 ( n187 ) , 
    .B1 ( n207 ) , .B2 ( n205 ) , .C1 ( n187 ) , .C2 ( n205 ) , .ZN ( n192 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U251 ( .I ( lanes_0__acc_reg[4] ) , 
    .ZN ( n394 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U252 ( .A1 ( n3 ) , .A2 ( n394 ) , 
    .B1 ( n551 ) , .B2 ( n294 ) , .ZN ( n333 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 ctmTdsLR_1_33 ( .A1 ( n388 ) , .A2 ( n389 ) , 
    .Z ( tmp_net43 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_34 ( .A1 ( n407 ) , 
    .A2 ( tmp_net43 ) , .ZN ( n383 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_35 ( .A1 ( n278 ) , .A2 ( n277 ) , 
    .B ( n276 ) , .ZN ( tmp_net44 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U256 ( .A1 ( n201 ) , .A2 ( n387 ) , 
    .B1 ( inputs[4] ) , .B2 ( n5 ) , .ZN ( n345 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U257 ( .A1 ( n192 ) , .A2 ( n333 ) , 
    .B1 ( n192 ) , .B2 ( n345 ) , .C1 ( n333 ) , .C2 ( n345 ) , .ZN ( n200 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U258 ( .I ( lanes_0__acc_reg[5] ) , 
    .ZN ( n399 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U259 ( .A1 ( n3 ) , .A2 ( n399 ) , 
    .B1 ( n549 ) , .B2 ( n294 ) , .ZN ( n214 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U260 ( .A1 ( n194 ) , .A2 ( n193 ) , 
    .Z ( n197 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U261 ( .A1 ( n197 ) , .A2 ( n196 ) , 
    .B ( n195 ) , .ZN ( n396 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U262 ( .A1 ( n201 ) , .A2 ( n396 ) , 
    .B1 ( inputs[5] ) , .B2 ( n5 ) , .ZN ( n212 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U263 ( .A1 ( n214 ) , .A2 ( n212 ) , 
    .ZN ( n199 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U264 ( .A1 ( n214 ) , .A2 ( n212 ) , 
    .ZN ( n198 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U265 ( .A1 ( n200 ) , .A2 ( n199 ) , 
    .B ( n198 ) , .ZN ( n202 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U266 ( .I ( lanes_0__acc_reg[6] ) , 
    .ZN ( n411 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_2 U267 ( .A1 ( n3 ) , .A2 ( n411 ) , 
    .B1 ( n547 ) , .B2 ( n5 ) , .ZN ( n334 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 HFSBUF_577_10 ( .I ( n413 ) , .Z ( HFSNET_3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U269 ( .I ( n207 ) , .ZN ( n332 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U270 ( .I ( n214 ) , .ZN ( n338 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U271 ( .I ( n334 ) , .ZN ( n218 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U272 ( .I ( n333 ) , .ZN ( n210 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U273 ( .A1 ( n338 ) , .A2 ( n218 ) , 
    .A3 ( n210 ) , .A4 ( n207 ) , .ZN ( n204 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U274 ( .I ( n205 ) , .ZN ( n346 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U275 ( .A1 ( n268 ) , .A2 ( n346 ) , 
    .A3 ( n345 ) , .A4 ( n212 ) , .ZN ( n203 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U276 ( .A1 ( n204 ) , .A2 ( n203 ) , 
    .ZN ( n263 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_2 U277 ( .A1 ( HFSNET_3 ) , .A2 ( n205 ) , 
    .B1 ( HFSNET_2 ) , .B2 ( n332 ) , .C ( n263 ) , .ZN ( n260 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U278 ( .A1 ( n204 ) , .A2 ( n203 ) , 
    .ZN ( n209 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U279 ( .I ( n209 ) , .ZN ( n229 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U280 ( .A1 ( n205 ) , .A2 ( HFSNET_2 ) , 
    .ZN ( n206 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U281 ( .A1 ( n207 ) , .A2 ( HFSNET_2 ) , 
    .B ( n229 ) , .C ( n206 ) , .ZN ( n208 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U282 ( .A1 ( n260 ) , .A2 ( n208 ) , 
    .ZN ( n220 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U283 ( .A1 ( n260 ) , .A2 ( n208 ) , 
    .B ( n220 ) , .ZN ( n240 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U284 ( .I ( n240 ) , .ZN ( n228 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U285 ( .I ( n254 ) , .ZN ( n341 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U286 ( .A1 ( HFSNET_3 ) , .A2 ( n331 ) , 
    .B1 ( n341 ) , .B2 ( HFSNET_2 ) , .ZN ( n235 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U287 ( .A1 ( n260 ) , .A2 ( n209 ) , 
    .B1 ( n228 ) , .B2 ( n235 ) , .ZN ( n245 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U288 ( .I ( n212 ) , .ZN ( n342 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U289 ( .A1 ( HFSNET_3 ) , .A2 ( n345 ) , 
    .B1 ( n210 ) , .B2 ( HFSNET_2 ) , .ZN ( n283 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U290 ( .I ( n345 ) , .ZN ( n211 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U291 ( .A1 ( HFSNET_3 ) , .A2 ( n333 ) , 
    .B1 ( n211 ) , .B2 ( HFSNET_2 ) , .ZN ( n219 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor3_1 U292 ( .A1 ( n338 ) , .A2 ( n342 ) , 
    .A3 ( n213 ) , .Z ( n242 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U293 ( .A1 ( HFSNET_3 ) , .A2 ( n338 ) , 
    .B1 ( n212 ) , .B2 ( HFSNET_2 ) , .ZN ( n216 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U294 ( .I ( n213 ) , .ZN ( n215 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U295 ( .A1 ( HFSNET_3 ) , .A2 ( n342 ) , 
    .B1 ( n214 ) , .B2 ( HFSNET_2 ) , .ZN ( n371 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U296 ( .A1 ( n216 ) , .A2 ( n215 ) , 
    .B1 ( n216 ) , .B2 ( n371 ) , .C1 ( n215 ) , .C2 ( n371 ) , .ZN ( n217 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U297 ( .A1 ( n218 ) , .A2 ( n268 ) , 
    .ZN ( n323 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U298 ( .A1 ( n218 ) , .A2 ( n268 ) , 
    .B ( n217 ) , .C ( n323 ) , .ZN ( n223 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U299 ( .A ( n283 ) , .B ( n220 ) , 
    .CI ( n219 ) , .CO ( n213 ) , .S ( n224 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U300 ( .I ( n224 ) , .ZN ( n238 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U301 ( .A1 ( n223 ) , .A2 ( n238 ) , 
    .ZN ( n230 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U302 ( .A1 ( n242 ) , .A2 ( n230 ) , 
    .ZN ( n255 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U303 ( .A1 ( n245 ) , .A2 ( n255 ) , 
    .ZN ( n221 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U304 ( .A1 ( n273 ) , .A2 ( n221 ) , 
    .Z ( intadd_1_A_2_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U305 ( .A1 ( n242 ) , .A2 ( n245 ) , 
    .ZN ( n225 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U306 ( .I ( n222 ) , .ZN ( n336 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U307 ( .A1 ( HFSNET_3 ) , .A2 ( n336 ) , 
    .B1 ( n344 ) , .B2 ( HFSNET_2 ) , .ZN ( n233 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U308 ( .I ( n340 ) , .ZN ( n248 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U309 ( .A1 ( HFSNET_3 ) , .A2 ( n337 ) , 
    .B1 ( n248 ) , .B2 ( HFSNET_2 ) , .ZN ( n227 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U310 ( .A1 ( n228 ) , .A2 ( n233 ) , 
    .B1 ( n227 ) , .B2 ( n240 ) , .ZN ( n244 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U311 ( .I ( n242 ) , .ZN ( n236 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U312 ( .A1 ( n224 ) , .A2 ( n223 ) , 
    .A3 ( n236 ) , .ZN ( n226 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_2 U313 ( .A1 ( n230 ) , .A2 ( n225 ) , 
    .B1 ( n244 ) , .B2 ( n226 ) , .ZN ( n271 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U314 ( .A1 ( n273 ) , .A2 ( n271 ) , 
    .Z ( n278 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U315 ( .I ( n226 ) , .ZN ( n250 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U316 ( .I ( n227 ) , .ZN ( n234 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U317 ( .A1 ( n228 ) , .A2 ( n234 ) , 
    .B1 ( n235 ) , .B2 ( n240 ) , .ZN ( n251 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U318 ( .A1 ( n229 ) , .A2 ( n228 ) , 
    .ZN ( n249 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U319 ( .A1 ( n233 ) , .A2 ( n240 ) , 
    .ZN ( n231 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U320 ( .A1 ( n242 ) , .A2 ( n249 ) , 
    .B1 ( n236 ) , .B2 ( n231 ) , .C ( n230 ) , .ZN ( n232 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U321 ( .A1 ( n250 ) , .A2 ( n251 ) , 
    .B ( n232 ) , .ZN ( n275 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U322 ( .I ( n275 ) , .ZN ( n243 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U323 ( .I ( n233 ) , .ZN ( n237 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U324 ( .A1 ( n234 ) , .A2 ( n237 ) , 
    .ZN ( n241 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U325 ( .A1 ( n238 ) , .A2 ( n237 ) , 
    .B1 ( n236 ) , .B2 ( n235 ) , .ZN ( n239 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U326 ( .A1 ( n242 ) , .A2 ( n241 ) , 
    .B1 ( n240 ) , .B2 ( n239 ) , .ZN ( n290 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U327 ( .A1 ( n259 ) , .A2 ( n290 ) , 
    .ZN ( n277 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U328 ( .A1 ( n278 ) , .A2 ( n243 ) , 
    .A3 ( n277 ) , .ZN ( intadd_1_A_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U329 ( .A1 ( HFSNET_3 ) , .A2 ( n344 ) , 
    .B1 ( n336 ) , .B2 ( HFSNET_2 ) , .ZN ( intadd_1_B_0_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U330 ( .I ( n244 ) , .ZN ( n246 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U331 ( .A1 ( n255 ) , .A2 ( n246 ) , 
    .B1 ( n245 ) , .B2 ( n250 ) , .ZN ( n247 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U332 ( .A1 ( n247 ) , .A2 ( n273 ) , 
    .Z ( intadd_1_CI ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U333 ( .A1 ( HFSNET_3 ) , .A2 ( n248 ) , 
    .B1 ( n337 ) , .B2 ( HFSNET_2 ) , .ZN ( intadd_1_A_1_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U334 ( .I ( n249 ) , .ZN ( n256 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U335 ( .A1 ( n255 ) , .A2 ( n251 ) , 
    .B1 ( n256 ) , .B2 ( n250 ) , .ZN ( n252 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U336 ( .A1 ( n252 ) , .A2 ( n273 ) , 
    .Z ( intadd_1_B_1_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U337 ( .I ( n331 ) , .ZN ( n253 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U338 ( .A1 ( HFSNET_3 ) , .A2 ( n254 ) , 
    .B1 ( n253 ) , .B2 ( HFSNET_2 ) , .ZN ( intadd_1_B_2_ ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U339 ( .A1 ( n256 ) , .A2 ( n255 ) , 
    .ZN ( n257 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U340 ( .A1 ( n273 ) , .A2 ( n257 ) , 
    .Z ( n261 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U341 ( .A1 ( n261 ) , .A2 ( intadd_1_n1 ) , 
    .ZN ( n258 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_2 U342 ( .A1 ( n263 ) , .A2 ( n259 ) , 
    .A3 ( n258 ) , .ZN ( n303 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U343 ( .I ( n303 ) , .ZN ( n301 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U344 ( .A1 ( n301 ) , .A2 ( n260 ) , 
    .ZN ( n284 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U345 ( .A1 ( n301 ) , .A2 ( n260 ) , 
    .B ( n284 ) , .ZN ( n320 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U346 ( .A1 ( n261 ) , .A2 ( intadd_1_n1 ) , 
    .Z ( n302 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U347 ( .A1 ( n263 ) , .A2 ( n302 ) , 
    .ZN ( n262 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U348 ( .A1 ( n263 ) , .A2 ( n302 ) , 
    .B ( n303 ) , .C ( n262 ) , .ZN ( n380 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U349 ( .I ( intadd_1_SUM_2_ ) , .ZN ( n374 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U350 ( .A1 ( n380 ) , .A2 ( n374 ) , 
    .ZN ( n265 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U351 ( .A1 ( intadd_1_SUM_1_ ) , 
    .A2 ( intadd_1_SUM_0_ ) , .A3 ( n265 ) , .ZN ( n310 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U352 ( .I ( n284 ) , .ZN ( n281 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U353 ( .I ( n283 ) , .ZN ( n282 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U354 ( .A1 ( n281 ) , .A2 ( n282 ) , 
    .ZN ( n324 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U355 ( .A1 ( n371 ) , .A2 ( n324 ) , 
    .Z ( n318 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U356 ( .A1 ( intadd_1_SUM_1_ ) , 
    .A2 ( n301 ) , .ZN ( n264 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U357 ( .A1 ( n374 ) , .A2 ( n301 ) , 
    .B ( n264 ) , .ZN ( n308 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U358 ( .I ( n308 ) , .ZN ( n266 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U359 ( .I0 ( intadd_1_SUM_0_ ) , 
    .I1 ( intadd_1_SUM_1_ ) , .S ( n303 ) , .Z ( n296 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U360 ( .I ( n296 ) , .ZN ( n304 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U361 ( .A1 ( n266 ) , .A2 ( n304 ) , 
    .B ( n265 ) , .ZN ( n286 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor2_1 ctmTdsLR_1_50 ( .A1 ( n179 ) , .A2 ( n176 ) , 
    .ZN ( tmp_net51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_51 ( .A1 ( n195 ) , 
    .A2 ( tmp_net51 ) , .ZN ( n362 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U364 ( .I ( n268 ) , .ZN ( n339 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U365 ( .A1 ( n269 ) , .A2 ( n339 ) , 
    .A3 ( n334 ) , .ZN ( n369 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U366 ( .A1 ( n310 ) , .A2 ( n318 ) , 
    .B ( n369 ) , .ZN ( n285 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U367 ( .A1 ( intadd_1_SUM_1_ ) , 
    .A2 ( n304 ) , .ZN ( n270 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U368 ( .A1 ( intadd_1_SUM_2_ ) , 
    .A2 ( n270 ) , .B ( n380 ) , .C ( n285 ) , .ZN ( n319 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U369 ( .A1 ( n320 ) , .A2 ( n285 ) , 
    .B ( n319 ) , .ZN ( n309 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U370 ( .I ( n309 ) , .ZN ( n375 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U371 ( .A1 ( n271 ) , .A2 ( n277 ) , 
    .ZN ( n276 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U372 ( .A1 ( n275 ) , .A2 ( n273 ) , 
    .B ( intadd_1_A_0_ ) , .ZN ( n272 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U373 ( .A1 ( n276 ) , .A2 ( n275 ) , 
    .A3 ( n273 ) , .B ( n272 ) , .ZN ( n295 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U374 ( .I ( n295 ) , .ZN ( n274 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U375 ( .A1 ( n303 ) , 
    .A2 ( intadd_1_SUM_0_ ) , .B1 ( n274 ) , .B2 ( n301 ) , .ZN ( n300 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 ctmTdsLR_1_47 ( .A1 ( n497 ) , 
    .A2 ( exec_inst_in[0] ) , .A3 ( exec_inst_in[2] ) , .ZN ( tmp_net50 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_2_48 ( .A1 ( n510 ) , 
    .A2 ( n496 ) , .B1 ( n510 ) , .B2 ( tmp_net50 ) , .C ( N1609 ) , 
    .ZN ( n529 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_1_44 ( .A1 ( n324 ) , .A2 ( n325 ) , 
    .B ( n323 ) , .ZN ( tmp_net48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U379 ( .A1 ( n375 ) , .A2 ( n300 ) , 
    .B1 ( n291 ) , .B2 ( n309 ) , .ZN ( n299 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U380 ( .A1 ( n300 ) , .A2 ( n309 ) , 
    .B1 ( n304 ) , .B2 ( n375 ) , .ZN ( n289 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_36 ( .A1 ( n303 ) , .A2 ( n243 ) , 
    .B ( tmp_net44 ) , .ZN ( n291 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U382 ( .A1 ( n284 ) , .A2 ( n283 ) , 
    .B1 ( n282 ) , .B2 ( n281 ) , .ZN ( n316 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U383 ( .I ( n320 ) , .ZN ( n370 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_45 ( .A1 ( n469 ) , .A2 ( n515 ) , 
    .ZN ( tmp_net49 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_2_46 ( .A1 ( n516 ) , .A2 ( n527 ) , 
    .A3 ( n486 ) , .B ( tmp_net49 ) , .ZN ( n476 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U386 ( .A1 ( n289 ) , .A2 ( n372 ) , 
    .ZN ( n298 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U387 ( .A1 ( n291 ) , .A2 ( n309 ) , 
    .B ( n290 ) , .ZN ( n292 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U388 ( .A1 ( n299 ) , .A2 ( n292 ) , 
    .A3 ( n298 ) , .ZN ( n293 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U389 ( .A1 ( n299 ) , .A2 ( n298 ) , 
    .B ( n293 ) , .ZN ( n330 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U390 ( .A1 ( exec_inst_in[5] ) , .A2 ( n5 ) , 
    .ZN ( n421 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U391 ( .A1 ( n310 ) , .A2 ( n295 ) , 
    .B ( n421 ) , .ZN ( n414 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U392 ( .A1 ( n375 ) , .A2 ( n308 ) , 
    .B1 ( n296 ) , .B2 ( n309 ) , .ZN ( n373 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U393 ( .A1 ( n373 ) , .A2 ( n372 ) , 
    .ZN ( n355 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U394 ( .I ( n299 ) , .ZN ( n297 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U395 ( .A1 ( n298 ) , .A2 ( n297 ) , 
    .ZN ( n356 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U396 ( .A1 ( n299 ) , .A2 ( n355 ) , 
    .B1 ( n372 ) , .B2 ( n355 ) , .C ( n356 ) , .ZN ( n357 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U397 ( .A1 ( n300 ) , .A2 ( n372 ) , 
    .B ( n309 ) , .ZN ( n307 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U398 ( .A1 ( n303 ) , .A2 ( n302 ) , 
    .B1 ( n374 ) , .B2 ( n301 ) , .ZN ( n306 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U399 ( .A1 ( n304 ) , .A2 ( n372 ) , 
    .B ( n375 ) , .ZN ( n305 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U400 ( .A1 ( n308 ) , .A2 ( n307 ) , 
    .B1 ( n306 ) , .B2 ( n305 ) , .ZN ( n368 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 ctmTdsLR_1_49 ( .A1 ( n301 ) , 
    .A2 ( n282 ) , .B1 ( n301 ) , .B2 ( n286 ) , .C1 ( n310 ) , .C2 ( n318 ) , 
    .ZN ( n269 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U402 ( .I ( n371 ) , .ZN ( n325 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_175 ( .A1 ( n410 ) , 
    .A2 ( tmp_net97 ) , .ZN ( tmp_net98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U404 ( .A1 ( n370 ) , .A2 ( n309 ) , 
    .ZN ( n321 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U405 ( .I ( n310 ) , .ZN ( n311 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U406 ( .A1 ( n312 ) , .A2 ( n311 ) , 
    .ZN ( n317 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_176 ( .I ( data_out[3] ) , 
    .ZN ( tmp_net97 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U408 ( .A1 ( n317 ) , .A2 ( n318 ) , 
    .B ( tmp_net48 ) , .ZN ( n400 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__addf_1 U409 ( .A ( n321 ) , .B ( n316 ) , 
    .CI ( n372 ) , .CO ( n312 ) , .S ( n391 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U410 ( .A1 ( n318 ) , .A2 ( n317 ) , 
    .ZN ( n401 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U411 ( .A1 ( n320 ) , .A2 ( n319 ) , 
    .ZN ( n322 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U412 ( .A1 ( n322 ) , .A2 ( n321 ) , 
    .ZN ( n388 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U413 ( .A1 ( n400 ) , .A2 ( n391 ) , 
    .A3 ( n401 ) , .A4 ( n388 ) , .ZN ( n327 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U414 ( .A1 ( n325 ) , .A2 ( n324 ) , 
    .A3 ( n323 ) , .ZN ( n326 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U415 ( .A1 ( n357 ) , .A2 ( n368 ) , 
    .A3 ( n327 ) , .B ( n326 ) , .ZN ( n354 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U416 ( .I ( n354 ) , .ZN ( n328 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U417 ( .A1 ( n414 ) , .A2 ( n328 ) , 
    .ZN ( n378 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U418 ( .I ( n378 ) , .ZN ( n363 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U419 ( .A1 ( n330 ) , .A2 ( n363 ) , 
    .B1 ( n421 ) , .B2 ( n329 ) , .ZN ( n350 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U420 ( .A1 ( n334 ) , .A2 ( n333 ) , 
    .A3 ( n332 ) , .A4 ( n331 ) , .ZN ( n335 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U421 ( .A1 ( n338 ) , .A2 ( n337 ) , 
    .A3 ( n336 ) , .A4 ( n335 ) , .ZN ( n348 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U422 ( .A1 ( n342 ) , .A2 ( n341 ) , 
    .A3 ( n340 ) , .A4 ( n339 ) , .ZN ( n343 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U423 ( .A1 ( n346 ) , .A2 ( n345 ) , 
    .A3 ( n344 ) , .A4 ( n343 ) , .ZN ( n347 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U424 ( .A1 ( n348 ) , .A2 ( n347 ) , 
    .ZN ( n420 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U425 ( .A1 ( n421 ) , .A2 ( n420 ) , 
    .ZN ( n353 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U426 ( .I ( n353 ) , .ZN ( n349 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U427 ( .A1 ( n350 ) , .A2 ( n349 ) , 
    .ZN ( n501 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U428 ( .I ( n501 ) , .ZN ( n438 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U429 ( .I ( exec_inst_in_val ) , .ZN ( n351 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U430 ( .A1 ( n351 ) , .A2 ( exec_rdy ) , 
    .ZN ( n410 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U431 ( .A1 ( n438 ) , .A2 ( n427 ) , 
    .B1 ( n352 ) , .B2 ( n410 ) , .ZN ( n633 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U432 ( .I ( n421 ) , .ZN ( n385 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U433 ( .A1 ( n414 ) , .A2 ( n354 ) , 
    .B ( n353 ) , .ZN ( n409 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U434 ( .A1 ( n356 ) , .A2 ( n355 ) , 
    .ZN ( n367 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U435 ( .I ( n357 ) , .ZN ( n358 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U436 ( .A1 ( n363 ) , .A2 ( n367 ) , 
    .A3 ( n358 ) , .ZN ( n359 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_2 U437 ( .A1 ( n360 ) , .A2 ( n385 ) , 
    .B ( n409 ) , .C ( n359 ) , .ZN ( n481 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U438 ( .I ( n410 ) , .ZN ( n535 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U439 ( .A1 ( n481 ) , .A2 ( N1609 ) , 
    .B1 ( lanes_0__acc_reg[1] ) , .B2 ( n535 ) , .ZN ( n361 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U440 ( .I ( n361 ) , .ZN ( n632 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U441 ( .A1 ( n368 ) , .A2 ( n367 ) , 
    .Z ( n364 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U442 ( .A1 ( n364 ) , .A2 ( n363 ) , 
    .B1 ( n421 ) , .B2 ( n362 ) , .ZN ( n365 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U443 ( .A1 ( n409 ) , .A2 ( n365 ) , 
    .ZN ( n484 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U444 ( .I ( n484 ) , .ZN ( n428 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U445 ( .A1 ( n428 ) , .A2 ( n427 ) , 
    .B1 ( n366 ) , .B2 ( n410 ) , .ZN ( n631 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U446 ( .A1 ( n368 ) , .A2 ( n367 ) , 
    .ZN ( n389 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_183 ( .A1 ( n159 ) , 
    .A2 ( n142 ) , .ZN ( tmp_net102 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U449 ( .A1 ( tmp_net61 ) , .A2 ( tmp_net62 ) , 
    .ZN ( n379 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U450 ( .A1 ( n380 ) , .A2 ( n379 ) , 
    .B ( n378 ) , .ZN ( n407 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_2 U454 ( .A1 ( n385 ) , .A2 ( n384 ) , 
    .B ( n383 ) , .C ( n409 ) , .ZN ( n504 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U455 ( .A1 ( n504 ) , .A2 ( N1609 ) , 
    .B1 ( lanes_0__acc_reg[3] ) , .B2 ( n535 ) , .ZN ( n386 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U456 ( .I ( n386 ) , .ZN ( n630 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U457 ( .A1 ( n387 ) , .A2 ( n421 ) , 
    .ZN ( n393 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U458 ( .A1 ( n389 ) , .A2 ( n388 ) , 
    .Z ( n390 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U459 ( .A1 ( n391 ) , .A2 ( n390 ) , 
    .ZN ( n395 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U460 ( .A1 ( n391 ) , .A2 ( n390 ) , 
    .B ( n407 ) , .C ( n395 ) , .ZN ( n392 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U461 ( .A1 ( n393 ) , .A2 ( n392 ) , 
    .A3 ( n409 ) , .ZN ( n424 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U462 ( .I ( n424 ) , .ZN ( n522 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U463 ( .A1 ( n522 ) , .A2 ( n427 ) , 
    .B1 ( n394 ) , .B2 ( n410 ) , .ZN ( n629 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U464 ( .I ( n395 ) , .ZN ( n402 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U465 ( .A1 ( n401 ) , .A2 ( n402 ) , 
    .Z ( n397 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U466 ( .A1 ( n397 ) , .A2 ( n407 ) , 
    .B1 ( n421 ) , .B2 ( n396 ) , .ZN ( n398 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U467 ( .A1 ( n409 ) , .A2 ( n398 ) , 
    .ZN ( n523 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U468 ( .I ( n523 ) , .ZN ( n431 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U469 ( .A1 ( n431 ) , .A2 ( n427 ) , 
    .B1 ( n399 ) , .B2 ( n410 ) , .ZN ( n628 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U470 ( .I ( n400 ) , .ZN ( n404 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U471 ( .A1 ( n402 ) , .A2 ( n401 ) , 
    .ZN ( n403 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U472 ( .A1 ( n404 ) , .A2 ( n403 ) , 
    .ZN ( n406 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U473 ( .A1 ( n407 ) , .A2 ( n406 ) , 
    .B1 ( n421 ) , .B2 ( n405 ) , .ZN ( n408 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U474 ( .A1 ( n409 ) , .A2 ( n408 ) , 
    .ZN ( n531 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U475 ( .I ( n531 ) , .ZN ( n509 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U476 ( .A1 ( n509 ) , .A2 ( n427 ) , 
    .B1 ( n411 ) , .B2 ( n410 ) , .ZN ( n627 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U477 ( .A1 ( HFSNET_2 ) , .A2 ( n414 ) , 
    .ZN ( n418 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U478 ( .A1 ( n414 ) , .A2 ( HFSNET_3 ) , 
    .ZN ( n416 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U479 ( .A1 ( n418 ) , .A2 ( n417 ) , 
    .B1 ( n416 ) , .B2 ( n415 ) , .ZN ( n419 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U480 ( .A1 ( n422 ) , .A2 ( n421 ) , 
    .B1 ( n420 ) , .B2 ( n419 ) , .ZN ( n500 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U481 ( .I ( n500 ) , .ZN ( n537 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U482 ( .A1 ( n537 ) , .A2 ( N1609 ) , 
    .B1 ( lanes_0__acc_reg[7] ) , .B2 ( n535 ) , .ZN ( n423 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U483 ( .I ( n423 ) , .ZN ( n626 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U484 ( .A1 ( n424 ) , .A2 ( n523 ) , 
    .ZN ( n455 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U485 ( .I ( n455 ) , .ZN ( n441 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U486 ( .A1 ( n441 ) , .A2 ( n504 ) , 
    .ZN ( n445 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U487 ( .A1 ( n445 ) , .A2 ( n509 ) , 
    .ZN ( n496 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U488 ( .A1 ( exec_inst_in[0] ) , 
    .A2 ( n537 ) , .B ( exec_inst_in[1] ) , .ZN ( n425 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U489 ( .I ( exec_inst_in[2] ) , .ZN ( n458 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U490 ( .A1 ( n458 ) , 
    .A2 ( exec_inst_in[1] ) , .A3 ( exec_inst_in[0] ) , .ZN ( n499 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U491 ( .I ( n499 ) , .ZN ( n538 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U492 ( .A1 ( exec_inst_in[2] ) , 
    .A2 ( n425 ) , .B ( n538 ) , .ZN ( n426 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U493 ( .A1 ( exec_inst_in[0] ) , 
    .A2 ( n426 ) , .B1 ( exec_inst_in[2] ) , .B2 ( n426 ) , .C ( n427 ) , 
    .ZN ( n524 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U494 ( .I ( n524 ) , .ZN ( n521 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U495 ( .A1 ( n496 ) , .A2 ( n426 ) , 
    .B ( n521 ) , .ZN ( n532 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U496 ( .A1 ( data_out[0] ) , .A2 ( n535 ) , 
    .B1 ( n532 ) , .B2 ( n501 ) , .ZN ( n466 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U497 ( .I ( n445 ) , .ZN ( n430 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U498 ( .A1 ( n428 ) , .A2 ( n509 ) , 
    .A3 ( n438 ) , .A4 ( n427 ) , .ZN ( n429 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U499 ( .A1 ( n430 ) , .A2 ( n429 ) , 
    .A3 ( n481 ) , .ZN ( n533 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U500 ( .A1 ( n504 ) , .A2 ( n431 ) , 
    .ZN ( n432 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U501 ( .I ( n432 ) , .ZN ( n437 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U502 ( .A1 ( n522 ) , .A2 ( n504 ) , 
    .A3 ( n523 ) , .ZN ( n436 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U503 ( .A1 ( n437 ) , .A2 ( n455 ) , 
    .B ( n436 ) , .ZN ( n442 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U504 ( .I ( n442 ) , .ZN ( n440 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U505 ( .A1 ( n522 ) , .A2 ( n431 ) , 
    .ZN ( n503 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U506 ( .A1 ( n432 ) , .A2 ( n484 ) , 
    .B1 ( n504 ) , .B2 ( n503 ) , .ZN ( n435 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U507 ( .A1 ( n432 ) , .A2 ( n501 ) , 
    .B1 ( n481 ) , .B2 ( n437 ) , .ZN ( n434 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U508 ( .A1 ( n440 ) , .A2 ( n435 ) , 
    .B1 ( n445 ) , .B2 ( n434 ) , .ZN ( n433 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U509 ( .A1 ( n537 ) , .A2 ( n433 ) , 
    .Z ( n448 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U510 ( .A1 ( n455 ) , .A2 ( n436 ) , 
    .ZN ( n454 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U511 ( .A1 ( n454 ) , .A2 ( n435 ) , 
    .B1 ( n434 ) , .B2 ( n440 ) , .ZN ( n459 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U512 ( .I ( n459 ) , .ZN ( n457 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U513 ( .I0 ( n481 ) , .I1 ( n484 ) , 
    .S ( n437 ) , .Z ( n443 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U514 ( .A1 ( n438 ) , .A2 ( n455 ) , 
    .B ( n437 ) , .C ( n436 ) , .ZN ( n439 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U515 ( .A1 ( n443 ) , .A2 ( n440 ) , 
    .B ( n439 ) , .ZN ( n452 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and3_1 U516 ( .A1 ( n457 ) , .A2 ( n537 ) , 
    .A3 ( n452 ) , .Z ( n447 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U517 ( .A1 ( n448 ) , .A2 ( n447 ) , 
    .ZN ( n467 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U518 ( .A1 ( n443 ) , .A2 ( n442 ) , 
    .B ( n441 ) , .ZN ( n444 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U519 ( .A1 ( n537 ) , .A2 ( n444 ) , 
    .Z ( n468 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U520 ( .A1 ( n467 ) , .A2 ( n468 ) , 
    .ZN ( n450 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U521 ( .A1 ( n500 ) , .A2 ( n445 ) , 
    .Z ( n449 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U522 ( .A1 ( n450 ) , .A2 ( n449 ) , 
    .ZN ( n446 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U523 ( .A1 ( n537 ) , .A2 ( n446 ) , 
    .ZN ( n527 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U524 ( .I ( n527 ) , .ZN ( n518 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U525 ( .A1 ( n448 ) , .A2 ( n447 ) , 
    .Z ( n486 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U526 ( .A1 ( n450 ) , .A2 ( n449 ) , 
    .Z ( n490 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U527 ( .I ( n490 ) , .ZN ( n516 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U528 ( .A1 ( n518 ) , .A2 ( n516 ) , 
    .ZN ( n474 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 U529 ( .A1 ( n468 ) , .A2 ( n490 ) , 
    .B1 ( n486 ) , .B2 ( n490 ) , .C ( n518 ) , .ZN ( n469 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U530 ( .I ( n469 ) , .ZN ( n495 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U531 ( .A1 ( n459 ) , .A2 ( n537 ) , 
    .ZN ( n451 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U532 ( .A1 ( n452 ) , .A2 ( n451 ) , 
    .ZN ( n462 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U533 ( .A1 ( n495 ) , .A2 ( n462 ) , 
    .ZN ( n485 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U534 ( .A1 ( n518 ) , .A2 ( n486 ) , 
    .B ( n474 ) , .C ( n485 ) , .ZN ( n453 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U535 ( .I ( n453 ) , .ZN ( n464 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U536 ( .I ( n454 ) , .ZN ( n456 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U537 ( .A1 ( n484 ) , .A2 ( n481 ) , 
    .Z ( n502 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U538 ( .A1 ( n456 ) , .A2 ( n502 ) , 
    .B1 ( n455 ) , .B2 ( n501 ) , .ZN ( n460 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U539 ( .A1 ( n460 ) , .A2 ( n457 ) , 
    .B ( n462 ) , .ZN ( n463 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U540 ( .I ( exec_inst_in[1] ) , .ZN ( n497 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U541 ( .A1 ( exec_inst_in[0] ) , 
    .A2 ( n458 ) , .ZN ( n536 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U542 ( .A1 ( n531 ) , .A2 ( n537 ) , 
    .B ( n497 ) , .C ( n536 ) , .ZN ( n505 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U543 ( .A1 ( N1609 ) , .A2 ( n505 ) , 
    .ZN ( n514 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U544 ( .A1 ( n531 ) , .A2 ( n514 ) , 
    .ZN ( n525 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U545 ( .A1 ( n495 ) , .A2 ( n460 ) , 
    .A3 ( n459 ) , .ZN ( n461 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U546 ( .A1 ( n495 ) , .A2 ( n462 ) , 
    .B ( n461 ) , .ZN ( n475 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U547 ( .A1 ( n464 ) , .A2 ( n475 ) , 
    .ZN ( n473 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U548 ( .A1 ( n464 ) , .A2 ( n463 ) , 
    .B ( n525 ) , .C ( n473 ) , .ZN ( n465 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U549 ( .A1 ( n466 ) , .A2 ( n533 ) , 
    .A3 ( n465 ) , .ZN ( n625 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U552 ( .A1 ( n468 ) , .A2 ( n467 ) , 
    .Z ( n487 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U553 ( .I ( n487 ) , .ZN ( n515 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U556 ( .A1 ( n476 ) , .A2 ( n473 ) , 
    .ZN ( n491 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U562 ( .A1 ( data_out[1] ) , .A2 ( n535 ) , 
    .B1 ( n532 ) , .B2 ( n481 ) , .ZN ( n482 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U563 ( .A1 ( n491 ) , .A2 ( n483 ) , 
    .B ( n482 ) , .C ( n533 ) , .ZN ( n624 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U564 ( .A1 ( data_out[2] ) , .A2 ( n535 ) , 
    .B1 ( n532 ) , .B2 ( n484 ) , .ZN ( n494 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U565 ( .A1 ( n486 ) , .A2 ( n485 ) , 
    .ZN ( n489 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U566 ( .A1 ( n527 ) , .A2 ( n487 ) , 
    .B ( n490 ) , .ZN ( n488 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U567 ( .A1 ( n490 ) , .A2 ( n527 ) , 
    .A3 ( n489 ) , .B ( n488 ) , .ZN ( n492 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U568 ( .A1 ( n492 ) , .A2 ( n491 ) , 
    .ZN ( n517 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U569 ( .A1 ( n492 ) , .A2 ( n491 ) , 
    .B ( n525 ) , .C ( n517 ) , .ZN ( n493 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U570 ( .A1 ( n494 ) , .A2 ( n533 ) , 
    .A3 ( n493 ) , .ZN ( n623 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__xor2_1 U571 ( .A1 ( n495 ) , .A2 ( n517 ) , 
    .Z ( n513 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U575 ( .A1 ( n500 ) , .A2 ( n499 ) , 
    .ZN ( n508 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U576 ( .A1 ( n504 ) , .A2 ( n503 ) , 
    .A3 ( n502 ) , .A4 ( n501 ) , .ZN ( n507 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U577 ( .I ( n505 ) , .ZN ( n506 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi222_1 U578 ( .A1 ( n508 ) , .A2 ( n509 ) , 
    .B1 ( n508 ) , .B2 ( n506 ) , .C1 ( n509 ) , .C2 ( n507 ) , .ZN ( n510 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U580 ( .A1 ( n514 ) , .A2 ( n513 ) , 
    .B ( n512 ) , .C ( n529 ) , .ZN ( n622 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U581 ( .A1 ( n516 ) , .A2 ( n515 ) , 
    .ZN ( n526 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U582 ( .A1 ( n518 ) , .A2 ( n517 ) , 
    .A3 ( n526 ) , .ZN ( n519 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U583 ( .A1 ( n535 ) , .A2 ( data_out[4] ) , 
    .B1 ( n525 ) , .B2 ( n519 ) , .ZN ( n520 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U584 ( .A1 ( n522 ) , .A2 ( n521 ) , 
    .B ( n520 ) , .C ( n529 ) , .ZN ( n621 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U585 ( .A1 ( data_out[5] ) , .A2 ( n535 ) , 
    .B1 ( n524 ) , .B2 ( n523 ) , .ZN ( n530 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U586 ( .A1 ( n527 ) , .A2 ( n526 ) , 
    .B ( n525 ) , .ZN ( n528 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U587 ( .A1 ( n530 ) , .A2 ( n529 ) , 
    .A3 ( n528 ) , .ZN ( n620 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U588 ( .A1 ( data_out[6] ) , .A2 ( n535 ) , 
    .B1 ( n532 ) , .B2 ( n531 ) , .ZN ( n534 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U589 ( .A1 ( n534 ) , .A2 ( n533 ) , 
    .ZN ( n619 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U590 ( .A1 ( n535 ) , .A2 ( data_out[7] ) , 
    .ZN ( n540 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U591 ( .A1 ( N1609 ) , .A2 ( n538 ) , 
    .A3 ( n537 ) , .A4 ( n536 ) , .ZN ( n539 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U592 ( .A1 ( n540 ) , .A2 ( n539 ) , 
    .ZN ( n618 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U593 ( .A1 ( is_weight ) , 
    .A2 ( data_in_val ) , .ZN ( n541 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U594 ( .A1 ( exec_rdy ) , .A2 ( n541 ) , 
    .ZN ( n558 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U595 ( .A1 ( exec_rdy ) , .A2 ( n558 ) , 
    .ZN ( n556 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U596 ( .A1 ( n543 ) , .A2 ( n558 ) , 
    .B1 ( n542 ) , .B2 ( n556 ) , .ZN ( n617 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U597 ( .A1 ( n545 ) , .A2 ( n558 ) , 
    .B1 ( n544 ) , .B2 ( n556 ) , .ZN ( n616 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U598 ( .A1 ( n547 ) , .A2 ( n558 ) , 
    .B1 ( n546 ) , .B2 ( n556 ) , .ZN ( n615 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U599 ( .A1 ( n549 ) , .A2 ( n558 ) , 
    .B1 ( n548 ) , .B2 ( n556 ) , .ZN ( n614 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U600 ( .A1 ( n551 ) , .A2 ( n558 ) , 
    .B1 ( n550 ) , .B2 ( n556 ) , .ZN ( n613 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U601 ( .A1 ( n553 ) , .A2 ( n558 ) , 
    .B1 ( n552 ) , .B2 ( n556 ) , .ZN ( n612 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U602 ( .A1 ( n555 ) , .A2 ( n558 ) , 
    .B1 ( n554 ) , .B2 ( n556 ) , .ZN ( n611 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U603 ( .A1 ( n559 ) , .A2 ( n558 ) , 
    .B1 ( n557 ) , .B2 ( n556 ) , .ZN ( n609 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai221_1 ctmTdsLR_2_27 ( .A1 ( n196 ) , 
    .A2 ( tmp_net39 ) , .B1 ( n196 ) , .B2 ( n194 ) , .C ( n195 ) , 
    .ZN ( n387 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_28 ( .A1 ( n475 ) , .A2 ( n474 ) , 
    .ZN ( tmp_net40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 ctmTdsLR_2_29 ( .A1 ( tmp_net40 ) , 
    .A2 ( n476 ) , .B ( n473 ) , .ZN ( tmp_net41 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_30 ( .A1 ( tmp_net41 ) , 
    .A2 ( n525 ) , .ZN ( n483 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module data_ctrl ( clk , rst_n , data_inst_in , data_inst_in_val , data_rdy , 
    exec_data_in , exec_data_in_val , exec_data_out , exec_data_out_val , 
    exec_data_is_weight , input_scalar_mode , input_select , mem_itf_rdy , 
    read_en , write_en , addr , device , write_data , read_data , 
    read_data_val , VPWR , VGND , HFSNET_1 , ZCTSNET_0 , ZCTSNET_1 , 
    ZCTSNET_2 ) ;
input  clk ;
input  rst_n ;
input  [15:0] data_inst_in ;
input  data_inst_in_val ;
output data_rdy ;
input  [7:0] exec_data_in ;
input  exec_data_in_val ;
output [7:0] exec_data_out ;
output exec_data_out_val ;
output exec_data_is_weight ;
output input_scalar_mode ;
output [0:0] input_select ;
input  mem_itf_rdy ;
output read_en ;
output write_en ;
output [23:0] addr ;
output [1:0] device ;
output [7:0] write_data ;
input  [7:0] read_data ;
input  read_data_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_1 ;
input  ZCTSNET_0 ;
input  ZCTSNET_1 ;
input  ZCTSNET_2 ;

wire input_scalar_mode_gOb0 ;
wire \_gOb1_input_select[0] ;
wire input_zero_mask_0_ ;
wire result_valid ;
wire write_reg ;
wire load_weight ;
wire sparse_en ;
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
wire tmp_net63 ;
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
wire tmp_net64 ;
wire n90 ;
wire n91 ;
wire n92 ;
wire n93 ;
wire n94 ;
wire n95 ;
wire n96 ;
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
wire n161 ;
wire n162 ;
wire [1:0] state ;
supply1 VPWR ;
supply0 VGND ;
wire tmp_net65 ;
wire tmp_net66 ;
wire tmp_net67 ;
wire tmp_net104 ;
wire copt_gre_net_126 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 result_valid_reg ( .D ( n148 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( result_valid ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 load_weight_reg ( .D ( n144 ) , .CLK ( clk ) , 
    .Q ( load_weight ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 input_scalar_mode_reg ( .D ( n143 ) , 
    .CLK ( clk ) , .Q ( input_scalar_mode_gOb0 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 input_select_reg_0_ ( .D ( n142 ) , 
    .CLK ( clk ) , .Q ( \_gOb1_input_select[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 sparse_en_reg ( .D ( n141 ) , .CLK ( clk ) , 
    .Q ( sparse_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_reg_reg ( .D ( n146 ) , .CLK ( clk ) , 
    .Q ( write_reg ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 input_zero_mask_reg_0_ ( .D ( n145 ) , 
    .CLK ( clk ) , .Q ( input_zero_mask_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n139 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n140 ) , .CLK ( clk ) , 
    .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_is_weight_reg ( .D ( n147 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_is_weight ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_23_ ( .D ( n138 ) , 
    .CLK ( clk ) , .Q ( addr[23] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_22_ ( .D ( n137 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[22] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_21_ ( .D ( n136 ) , 
    .CLK ( clk ) , .Q ( addr[21] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_20_ ( .D ( n135 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[20] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_19_ ( .D ( n134 ) , 
    .CLK ( clk ) , .Q ( addr[19] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_18_ ( .D ( n133 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[18] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_17_ ( .D ( n132 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[17] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_16_ ( .D ( n131 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[16] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_15_ ( .D ( n130 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_14_ ( .D ( n129 ) , 
    .CLK ( clk ) , .Q ( addr[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_13_ ( .D ( n128 ) , 
    .CLK ( clk ) , .Q ( addr[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_12_ ( .D ( n127 ) , 
    .CLK ( clk ) , .Q ( addr[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_11_ ( .D ( n126 ) , 
    .CLK ( clk ) , .Q ( addr[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_10_ ( .D ( n125 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_9_ ( .D ( n124 ) , 
    .CLK ( clk ) , .Q ( addr[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_8_ ( .D ( n123 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_7_ ( .D ( n122 ) , 
    .CLK ( clk ) , .Q ( addr[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_6_ ( .D ( n121 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_5_ ( .D ( n120 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_4_ ( .D ( n119 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_3_ ( .D ( n118 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( addr[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_2_ ( .D ( n117 ) , 
    .CLK ( clk ) , .Q ( addr[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_1_ ( .D ( n116 ) , 
    .CLK ( clk ) , .Q ( addr[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 base_addr_reg_0_ ( .D ( n115 ) , 
    .CLK ( clk ) , .Q ( addr[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 device_reg_1_ ( .D ( n114 ) , .CLK ( clk ) , 
    .Q ( device[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 device_reg_0_ ( .D ( n113 ) , .CLK ( clk ) , 
    .Q ( device[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_7_ ( .D ( n112 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_6_ ( .D ( n111 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[6] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_5_ ( .D ( n110 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[5] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_4_ ( .D ( n109 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_3_ ( .D ( n108 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_2_ ( .D ( n107 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_1_ ( .D ( n106 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 write_buffer_reg_0_ ( .D ( n105 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( write_data[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_7_ ( .D ( n104 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( exec_data_out[7] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_6_ ( .D ( n103 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out[6] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_5_ ( .D ( n102 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out[5] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_4_ ( .D ( n101 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out[4] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_3_ ( .D ( n100 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( exec_data_out[3] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_2_ ( .D ( n99 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out[2] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_1_ ( .D ( n98 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out[1] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_reg_0_ ( .D ( n97 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( exec_data_out[0] ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 exec_data_out_val_reg ( .D ( n162 ) , 
    .CLK ( ZCTSNET_2 ) , .Q ( exec_data_out_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_124 ( .A1 ( tmp_net66 ) , 
    .A2 ( HFSNET_1 ) , .ZN ( n31 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 ctmTdsLR_2_125 ( .A1 ( tmp_net63 ) , 
    .A2 ( tmp_net64 ) , .A3 ( tmp_net65 ) , .ZN ( tmp_net66 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_126 ( .I ( n64 ) , 
    .ZN ( tmp_net63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_4_127 ( .I ( n44 ) , 
    .ZN ( tmp_net64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U7 ( .I ( n47 ) , .ZN ( n6 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U8 ( .I ( n65 ) , .ZN ( n7 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_5_128 ( .I ( data_inst_in[13] ) , 
    .ZN ( tmp_net65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_2_130_roptpi_187 ( .A1 ( n45 ) , 
    .A2 ( n63 ) , .ZN ( tmp_net67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( state[1] ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U12 ( .A1 ( HFSNET_1 ) , .A2 ( n37 ) , 
    .ZN ( n16 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( data_inst_in[13] ) , .ZN ( n9 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U14 ( .A1 ( data_inst_in[15] ) , 
    .A2 ( data_inst_in[12] ) , .A3 ( n9 ) , .ZN ( n86 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai31_1 U15 ( .A1 ( data_inst_in[14] ) , 
    .A2 ( result_valid ) , .A3 ( n86 ) , .B ( mem_itf_rdy ) , .ZN ( n8 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U16 ( .A1 ( n8 ) , .A2 ( n16 ) , 
    .A3 ( state[0] ) , .ZN ( data_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( write_reg ) , .ZN ( n36 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U18 ( .A1 ( read_data_val ) , .A2 ( n36 ) , 
    .ZN ( n33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U19 ( .A1 ( state[0] ) , .A2 ( n37 ) , 
    .A3 ( n33 ) , .ZN ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U20 ( .A1 ( data_inst_in_val ) , 
    .A2 ( data_rdy ) , .ZN ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( n24 ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( data_inst_in[15] ) , .ZN ( n44 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U23 ( .A1 ( data_inst_in[14] ) , 
    .A2 ( n10 ) , .A3 ( n44 ) , .A4 ( n9 ) , .ZN ( n85 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U24 ( .I ( data_inst_in[12] ) , .ZN ( n45 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U25 ( .A1 ( input_zero_mask_0_ ) , 
    .A2 ( sparse_en ) , .A3 ( load_weight ) , .A4 ( n45 ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U26 ( .A1 ( \_gOb1_input_select[0] ) , 
    .A2 ( input_scalar_mode_gOb0 ) , .B ( n85 ) , .C ( n11 ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U27 ( .A1 ( HFSNET_1 ) , .A2 ( n17 ) , 
    .B ( n13 ) , .ZN ( n41 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U28 ( .I ( n41 ) , .ZN ( n162 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U29 ( .I ( state[0] ) , .ZN ( n34 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U30 ( .A1 ( n16 ) , .A2 ( n34 ) , .Z ( n42 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U31 ( .A1 ( write_reg ) , .A2 ( n42 ) , 
    .ZN ( read_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U32 ( .A1 ( n36 ) , .A2 ( n42 ) , 
    .ZN ( write_en ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U33 ( .A1 ( result_valid ) , 
    .A2 ( exec_data_in_val ) , .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U34 ( .A1 ( rst_n ) , .A2 ( n12 ) , 
    .ZN ( n148 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U35 ( .A1 ( n13 ) , .A2 ( n17 ) , 
    .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U36 ( .A1 ( HFSNET_1 ) , .A2 ( n14 ) , 
    .Z ( n160 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_1 U37 ( .A1 ( state[1] ) , .A2 ( n162 ) , 
    .Z ( n159 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U38 ( .A1 ( load_weight ) , .A2 ( n159 ) , 
    .B1 ( n160 ) , .B2 ( exec_data_is_weight ) , .ZN ( n15 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U39 ( .A1 ( n160 ) , .A2 ( n16 ) , 
    .B ( n15 ) , .ZN ( n147 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U40 ( .A1 ( HFSNET_1 ) , .A2 ( n85 ) , 
    .ZN ( n83 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U41 ( .A1 ( n45 ) , .A2 ( n85 ) , 
    .B1 ( n36 ) , .B2 ( n83 ) , .ZN ( n146 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U42 ( .I ( load_weight ) , .ZN ( n25 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U43 ( .A1 ( n25 ) , .A2 ( n17 ) , 
    .ZN ( n21 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U44 ( .I ( n21 ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U45 ( .A1 ( read_data[3] ) , 
    .A2 ( read_data[2] ) , .A3 ( read_data[1] ) , .A4 ( read_data[0] ) , 
    .ZN ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U46 ( .A1 ( read_data[6] ) , 
    .A2 ( read_data[4] ) , .A3 ( read_data[5] ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U47 ( .A1 ( n19 ) , .A2 ( n18 ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U48 ( .I ( input_zero_mask_0_ ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U49 ( .A1 ( n21 ) , .A2 ( n20 ) , 
    .B1 ( n23 ) , .B2 ( n22 ) , .C ( rst_n ) , .ZN ( n145 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( data_inst_in[14] ) , .A2 ( n24 ) , 
    .ZN ( n87 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U51 ( .A1 ( n87 ) , .A2 ( n45 ) , 
    .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_1_184 ( .A1 ( tmp_net104 ) , 
    .A2 ( HFSNET_1 ) , .ZN ( n47 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U53 ( .I ( data_inst_in[10] ) , .ZN ( n84 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U54 ( .A1 ( HFSNET_1 ) , .A2 ( n31 ) , 
    .ZN ( n30 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U55 ( .A1 ( n25 ) , .A2 ( n31 ) , 
    .B1 ( n84 ) , .B2 ( n30 ) , .ZN ( n144 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U56 ( .I ( input_scalar_mode_gOb0 ) , 
    .ZN ( n27 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U57 ( .I ( data_inst_in[8] ) , .ZN ( n26 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U58 ( .A1 ( n27 ) , .A2 ( n31 ) , 
    .B1 ( n30 ) , .B2 ( n26 ) , .ZN ( n143 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U59 ( .I ( \_gOb1_input_select[0] ) , 
    .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U60 ( .I ( data_inst_in[9] ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U61 ( .A1 ( n29 ) , .A2 ( n31 ) , 
    .B1 ( n30 ) , .B2 ( n28 ) , .ZN ( n142 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U62 ( .I ( sparse_en ) , .ZN ( n32 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U63 ( .I ( data_inst_in[11] ) , .ZN ( n81 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U64 ( .A1 ( n32 ) , .A2 ( n31 ) , 
    .B1 ( n30 ) , .B2 ( n81 ) , .ZN ( n141 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U65 ( .I ( mem_itf_rdy ) , .ZN ( n43 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U66 ( .A1 ( n43 ) , .A2 ( n36 ) , 
    .B ( n34 ) , .C ( n33 ) , .ZN ( n35 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U67 ( .A1 ( state[1] ) , .A2 ( n35 ) , 
    .B ( n83 ) , .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U68 ( .A1 ( n37 ) , .A2 ( n36 ) , 
    .B ( HFSNET_1 ) , .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U69 ( .A1 ( n39 ) , .A2 ( state[0] ) , 
    .A3 ( n38 ) , .B1 ( mem_itf_rdy ) , .B2 ( n42 ) , .ZN ( n140 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U70 ( .A1 ( n39 ) , .A2 ( state[1] ) , 
    .ZN ( n40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U71 ( .A1 ( n43 ) , .A2 ( n42 ) , 
    .B ( n41 ) , .C ( n40 ) , .ZN ( n139 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U73 ( .A1 ( data_inst_in[13] ) , 
    .A2 ( n44 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_185 ( .A1 ( n87 ) , 
    .A2 ( tmp_net67 ) , .ZN ( tmp_net104 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U75 ( .I ( n47 ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U76 ( .A1 ( rst_n ) , .A2 ( n59 ) , 
    .ZN ( n60 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U77 ( .A1 ( data_inst_in[11] ) , 
    .A2 ( n60 ) , .B1 ( n59 ) , .B2 ( addr[23] ) , .ZN ( n48 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U78 ( .I ( n48 ) , .ZN ( n138 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U79 ( .A1 ( data_inst_in[10] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[22] ) , .ZN ( n49 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U80 ( .I ( n49 ) , .ZN ( n137 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U81 ( .A1 ( data_inst_in[9] ) , .A2 ( n60 ) , 
    .B1 ( n59 ) , .B2 ( addr[21] ) , .ZN ( n50 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U82 ( .I ( n50 ) , .ZN ( n136 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U83 ( .A1 ( data_inst_in[8] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[20] ) , .ZN ( n51 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n51 ) , .ZN ( n135 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U85 ( .A1 ( data_inst_in[7] ) , .A2 ( n60 ) , 
    .B1 ( n59 ) , .B2 ( addr[19] ) , .ZN ( n52 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U86 ( .I ( n52 ) , .ZN ( n134 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U87 ( .A1 ( data_inst_in[6] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[18] ) , .ZN ( n53 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U88 ( .I ( n53 ) , .ZN ( n133 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U89 ( .A1 ( data_inst_in[5] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[17] ) , .ZN ( n54 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U90 ( .I ( n54 ) , .ZN ( n132 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( data_inst_in[4] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[16] ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U92 ( .I ( n55 ) , .ZN ( n131 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( data_inst_in[3] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n59 ) , .B2 ( addr[15] ) , .ZN ( n56 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n56 ) , .ZN ( n130 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U95 ( .A1 ( data_inst_in[2] ) , .A2 ( n60 ) , 
    .B1 ( n6 ) , .B2 ( addr[14] ) , .ZN ( n57 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U96 ( .I ( n57 ) , .ZN ( n129 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U97 ( .A1 ( data_inst_in[1] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n6 ) , .B2 ( addr[13] ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n58 ) , .ZN ( n128 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U99 ( .A1 ( data_inst_in[0] ) , 
    .A2 ( copt_gre_net_126 ) , .B1 ( n6 ) , .B2 ( addr[12] ) , .ZN ( n61 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U100 ( .I ( n61 ) , .ZN ( n127 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U101 ( .A1 ( n64 ) , .A2 ( n63 ) , 
    .B ( HFSNET_1 ) , .ZN ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U102 ( .I ( n65 ) , .ZN ( n78 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U103 ( .A1 ( rst_n ) , .A2 ( n78 ) , 
    .ZN ( n77 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U104 ( .A1 ( data_inst_in[11] ) , 
    .A2 ( n77 ) , .B1 ( n78 ) , .B2 ( addr[11] ) , .ZN ( n66 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U105 ( .I ( n66 ) , .ZN ( n126 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U106 ( .A1 ( data_inst_in[10] ) , 
    .A2 ( n77 ) , .B1 ( n78 ) , .B2 ( addr[10] ) , .ZN ( n67 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U107 ( .I ( n67 ) , .ZN ( n125 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U108 ( .A1 ( data_inst_in[9] ) , 
    .A2 ( n77 ) , .B1 ( n78 ) , .B2 ( addr[9] ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U109 ( .I ( n68 ) , .ZN ( n124 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U110 ( .A1 ( data_inst_in[8] ) , 
    .A2 ( n77 ) , .B1 ( n78 ) , .B2 ( addr[8] ) , .ZN ( n69 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U111 ( .I ( n69 ) , .ZN ( n123 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U112 ( .A1 ( n78 ) , .A2 ( addr[7] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[7] ) , .ZN ( n70 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U113 ( .I ( n70 ) , .ZN ( n122 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U114 ( .A1 ( n78 ) , .A2 ( addr[6] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[6] ) , .ZN ( n71 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U115 ( .I ( n71 ) , .ZN ( n121 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U116 ( .A1 ( n78 ) , .A2 ( addr[5] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[5] ) , .ZN ( n72 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U117 ( .I ( n72 ) , .ZN ( n120 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U118 ( .A1 ( n78 ) , .A2 ( addr[4] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[4] ) , .ZN ( n73 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U119 ( .I ( n73 ) , .ZN ( n119 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U120 ( .A1 ( n78 ) , .A2 ( addr[3] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[3] ) , .ZN ( n74 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U121 ( .I ( n74 ) , .ZN ( n118 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U122 ( .A1 ( n7 ) , .A2 ( addr[2] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[2] ) , .ZN ( n75 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U123 ( .I ( n75 ) , .ZN ( n117 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U124 ( .A1 ( n7 ) , .A2 ( addr[1] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[1] ) , .ZN ( n76 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( n76 ) , .ZN ( n116 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U126 ( .A1 ( n7 ) , .A2 ( addr[0] ) , 
    .B1 ( n77 ) , .B2 ( data_inst_in[0] ) , .ZN ( n79 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U127 ( .I ( n79 ) , .ZN ( n115 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U128 ( .I ( device[1] ) , .ZN ( n80 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U129 ( .A1 ( n85 ) , .A2 ( n81 ) , 
    .B1 ( n83 ) , .B2 ( n80 ) , .ZN ( n114 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U130 ( .I ( device[0] ) , .ZN ( n82 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U131 ( .A1 ( n85 ) , .A2 ( n84 ) , 
    .B1 ( n83 ) , .B2 ( n82 ) , .ZN ( n113 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U132 ( .I ( n86 ) , .ZN ( n88 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_2 U133 ( .A1 ( n87 ) , .A2 ( n88 ) , 
    .B ( rst_n ) , .ZN ( n150 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_2 U134 ( .A1 ( n150 ) , .A2 ( rst_n ) , 
    .ZN ( n149 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U135 ( .A1 ( n150 ) , .A2 ( write_data[7] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[7] ) , .ZN ( n90 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U136 ( .I ( n90 ) , .ZN ( n112 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U137 ( .A1 ( n150 ) , .A2 ( write_data[6] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[6] ) , .ZN ( n91 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U138 ( .I ( n91 ) , .ZN ( n111 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U139 ( .A1 ( n150 ) , .A2 ( write_data[5] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[5] ) , .ZN ( n92 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U140 ( .I ( n92 ) , .ZN ( n110 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U141 ( .A1 ( n150 ) , .A2 ( write_data[4] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[4] ) , .ZN ( n93 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U142 ( .I ( n93 ) , .ZN ( n109 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U143 ( .A1 ( n150 ) , .A2 ( write_data[3] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[3] ) , .ZN ( n94 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U144 ( .I ( n94 ) , .ZN ( n108 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U145 ( .A1 ( n150 ) , .A2 ( write_data[2] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[2] ) , .ZN ( n95 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U146 ( .I ( n95 ) , .ZN ( n107 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U147 ( .A1 ( n150 ) , .A2 ( write_data[1] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[1] ) , .ZN ( n96 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U148 ( .I ( n96 ) , .ZN ( n106 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U149 ( .A1 ( n150 ) , .A2 ( write_data[0] ) , 
    .B1 ( n149 ) , .B2 ( exec_data_in[0] ) , .ZN ( n151 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U150 ( .I ( n151 ) , .ZN ( n105 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U151 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[7] ) , .B1 ( n159 ) , .B2 ( read_data[7] ) , 
    .ZN ( n152 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U152 ( .I ( n152 ) , .ZN ( n104 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U153 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[6] ) , .B1 ( n159 ) , .B2 ( read_data[6] ) , 
    .ZN ( n153 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U154 ( .I ( n153 ) , .ZN ( n103 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U155 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[5] ) , .B1 ( n159 ) , .B2 ( read_data[5] ) , 
    .ZN ( n154 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U156 ( .I ( n154 ) , .ZN ( n102 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U157 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[4] ) , .B1 ( n159 ) , .B2 ( read_data[4] ) , 
    .ZN ( n155 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U158 ( .I ( n155 ) , .ZN ( n101 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U159 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[3] ) , .B1 ( n159 ) , .B2 ( read_data[3] ) , 
    .ZN ( n156 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U160 ( .I ( n156 ) , .ZN ( n100 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U161 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[2] ) , .B1 ( n159 ) , .B2 ( read_data[2] ) , 
    .ZN ( n157 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U162 ( .I ( n157 ) , .ZN ( n99 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U163 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[1] ) , .B1 ( n159 ) , .B2 ( read_data[1] ) , 
    .ZN ( n158 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U164 ( .I ( n158 ) , .ZN ( n98 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U165 ( .A1 ( n160 ) , 
    .A2 ( exec_data_out[0] ) , .B1 ( n159 ) , .B2 ( read_data[0] ) , 
    .ZN ( n161 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U166 ( .I ( n161 ) , .ZN ( n97 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 copt_gre_mt_inst_214 ( .I ( n60 ) , 
    .Z ( copt_gre_net_126 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module inst_decoder ( rst_n , inst_in , inst_in_val , decoder_rdy , exec_rdy , 
    data_rdy , exec_inst_out , exec_inst_out_val , data_inst_out , 
    data_inst_out_val , VPWR , VGND , HFSNET_1 ) ;
input  rst_n ;
input  [15:0] inst_in ;
input  inst_in_val ;
output decoder_rdy ;
input  exec_rdy ;
input  data_rdy ;
output [5:0] exec_inst_out ;
output exec_inst_out_val ;
output [15:0] data_inst_out ;
output data_inst_out_val ;
input  VPWR ;
input  VGND ;
input  HFSNET_1 ;

wire n1 ;
wire n2 ;
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
wire n17 ;
wire n18 ;
supply1 VPWR ;
supply0 VGND ;

assign data_inst_out[15] = inst_in[15] ;
assign data_inst_out[14] = inst_in[14] ;
assign data_inst_out[13] = inst_in[13] ;
assign data_inst_out[6] = inst_in[6] ;
assign data_inst_out[5] = inst_in[5] ;
assign data_inst_out[4] = inst_in[4] ;
assign data_inst_out[3] = inst_in[3] ;
assign data_inst_out[2] = inst_in[2] ;
assign data_inst_out[1] = inst_in[1] ;
assign data_inst_out[0] = inst_in[0] ;

gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U3 ( .A1 ( data_inst_out[15] ) , 
    .A2 ( n18 ) , .B1 ( n17 ) , .B2 ( n18 ) , .C ( rst_n ) , 
    .ZN ( decoder_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U4 ( .I ( n3 ) , .ZN ( exec_inst_out[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( n2 ) , .ZN ( exec_inst_out[4] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U6 ( .I ( n1 ) , .ZN ( exec_inst_out[5] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U7 ( .I ( n5 ) , .ZN ( exec_inst_out[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U8 ( .I ( n4 ) , .ZN ( exec_inst_out[2] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( n6 ) , .ZN ( exec_inst_out[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( inst_in[7] ) , .ZN ( n6 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( inst_in[10] ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( n2 ) , .ZN ( data_inst_out[11] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( inst_in[12] ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U18 ( .I ( n1 ) , .ZN ( data_inst_out[12] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U19 ( .I ( inst_in[11] ) , .ZN ( n2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n3 ) , .ZN ( data_inst_out[10] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U21 ( .I ( inst_in[9] ) , .ZN ( n4 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U22 ( .I ( n4 ) , .ZN ( data_inst_out[9] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U23 ( .I ( inst_in[8] ) , .ZN ( n5 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U24 ( .I ( n5 ) , .ZN ( data_inst_out[8] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U25 ( .I ( n6 ) , .ZN ( data_inst_out[7] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U34 ( .A1 ( data_inst_out[13] ) , 
    .A2 ( data_inst_out[14] ) , .ZN ( n7 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U35 ( .A1 ( data_inst_out[15] ) , .A2 ( n7 ) , 
    .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and4_1 U36 ( .A1 ( HFSNET_1 ) , .A2 ( exec_rdy ) , 
    .A3 ( n15 ) , .A4 ( inst_in_val ) , .Z ( exec_inst_out_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 U37 ( .A1 ( data_inst_out[13] ) , 
    .A2 ( data_inst_out[14] ) , .Z ( n17 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U38 ( .A1 ( n7 ) , .A2 ( n17 ) , 
    .B ( data_inst_out[15] ) , .ZN ( n11 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U39 ( .A1 ( data_inst_out[15] ) , 
    .A2 ( n17 ) , .ZN ( n12 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U40 ( .I ( n12 ) , .ZN ( n10 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U41 ( .I ( data_rdy ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U42 ( .A1 ( HFSNET_1 ) , 
    .A2 ( inst_in_val ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U43 ( .A1 ( n11 ) , .A2 ( n10 ) , 
    .A3 ( n13 ) , .A4 ( n9 ) , .ZN ( data_inst_out_val ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U44 ( .A1 ( data_inst_out[13] ) , 
    .A2 ( data_inst_out[14] ) , .B1 ( n13 ) , .B2 ( n12 ) , .ZN ( n14 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U45 ( .A1 ( n15 ) , .A2 ( exec_rdy ) , 
    .B1 ( data_rdy ) , .B2 ( exec_rdy ) , .C ( n14 ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module inst_fifo ( clk , rst_n , inst_in , inst_in_val , fifo_rdy , 
    decoder_rdy , inst_out , inst_out_val , VPWR , VGND , ZCTSNET_0 ) ;
input  clk ;
input  rst_n ;
input  [15:0] inst_in ;
input  inst_in_val ;
output fifo_rdy ;
input  decoder_rdy ;
output [15:0] inst_out ;
output inst_out_val ;
input  VPWR ;
input  VGND ;
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
wire tmp_net77 ;
wire n3 ;
wire n4 ;
wire n23 ;
wire n24 ;
supply1 VPWR ;
supply0 VGND ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 count_reg_0_ ( .D ( n22 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( count_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__0_ ( .D ( n21 ) , .CLK ( clk ) , 
    .Q ( inst_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__1_ ( .D ( n20 ) , .CLK ( clk ) , 
    .Q ( inst_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__2_ ( .D ( n19 ) , .CLK ( clk ) , 
    .Q ( inst_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__3_ ( .D ( n18 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__4_ ( .D ( n17 ) , .CLK ( clk ) , 
    .Q ( inst_out[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__5_ ( .D ( n16 ) , .CLK ( clk ) , 
    .Q ( inst_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__6_ ( .D ( n15 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__7_ ( .D ( n14 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__8_ ( .D ( n13 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__9_ ( .D ( n12 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__10_ ( .D ( n11 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__11_ ( .D ( n10 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__12_ ( .D ( n9 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__13_ ( .D ( n8 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__14_ ( .D ( n7 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 words_reg_0__15_ ( .D ( n6 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( inst_out[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_2 ctmTdsLR_1_145 ( .A1 ( n4 ) , 
    .A2 ( tmp_net77 ) , .Z ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_146 ( .I ( inst_in_val ) , 
    .ZN ( tmp_net77 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U5 ( .I ( count_0_ ) , .ZN ( n3 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U6 ( .A1 ( n3 ) , .A2 ( rst_n ) , 
    .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U7 ( .A1 ( inst_in_val ) , .A2 ( n4 ) , 
    .ZN ( fifo_rdy ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U8 ( .A1 ( count_0_ ) , .A2 ( rst_n ) , 
    .ZN ( n23 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U11 ( .A1 ( decoder_rdy ) , .A2 ( n23 ) , 
    .B ( n24 ) , .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( n23 ) , .ZN ( inst_out_val ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U13 ( .I0 ( inst_in[0] ) , 
    .I1 ( inst_out[0] ) , .S ( n24 ) , .Z ( n21 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U14 ( .I0 ( inst_in[1] ) , 
    .I1 ( inst_out[1] ) , .S ( n24 ) , .Z ( n20 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U15 ( .I0 ( inst_in[2] ) , 
    .I1 ( inst_out[2] ) , .S ( n24 ) , .Z ( n19 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U16 ( .I0 ( inst_in[3] ) , 
    .I1 ( inst_out[3] ) , .S ( n24 ) , .Z ( n18 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U17 ( .I0 ( inst_in[4] ) , 
    .I1 ( inst_out[4] ) , .S ( n24 ) , .Z ( n17 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U18 ( .I0 ( inst_in[5] ) , 
    .I1 ( inst_out[5] ) , .S ( n24 ) , .Z ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U19 ( .I0 ( inst_in[6] ) , 
    .I1 ( inst_out[6] ) , .S ( n24 ) , .Z ( n15 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U20 ( .I0 ( inst_in[7] ) , 
    .I1 ( inst_out[7] ) , .S ( n24 ) , .Z ( n14 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U21 ( .I0 ( inst_in[8] ) , 
    .I1 ( inst_out[8] ) , .S ( n24 ) , .Z ( n13 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U22 ( .I0 ( inst_in[9] ) , 
    .I1 ( inst_out[9] ) , .S ( n24 ) , .Z ( n12 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U23 ( .I0 ( inst_in[10] ) , 
    .I1 ( inst_out[10] ) , .S ( n24 ) , .Z ( n11 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U24 ( .I0 ( inst_in[11] ) , 
    .I1 ( inst_out[11] ) , .S ( n24 ) , .Z ( n10 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U25 ( .I0 ( inst_in[12] ) , 
    .I1 ( inst_out[12] ) , .S ( n24 ) , .Z ( n9 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U26 ( .I0 ( inst_in[13] ) , 
    .I1 ( inst_out[13] ) , .S ( n24 ) , .Z ( n8 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0 ( inst_in[14] ) , 
    .I1 ( inst_out[14] ) , .S ( n24 ) , .Z ( n7 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0 ( inst_in[15] ) , 
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
supply1 VPWR ;
supply0 VGND ;
wire tmp_net92 ;
wire tmp_net93 ;
wire tmp_net94 ;

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
    .A3 ( n10 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_2 U6 ( .A1 ( state ) , .A2 ( n61 ) , 
    .ZN ( tx ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U7 ( .A1 ( HFSNET_0 ) , .A2 ( state ) , 
    .ZN ( n33 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U8 ( .I ( inst_fifo_rdy ) , .ZN ( n1 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U9 ( .A1 ( ready_sent ) , .A2 ( n1 ) , 
    .B ( HFSNET_0 ) , .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( bit_idx[3] ) , .ZN ( n63 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U11 ( .I ( clk_cnt[4] ) , .ZN ( n35 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U12 ( .I ( clk_cnt[5] ) , .ZN ( n54 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand4_1 U13 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[2] ) , .A3 ( clk_cnt[6] ) , .A4 ( n54 ) , .ZN ( n2 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor4_1 U14 ( .A1 ( clk_cnt[3] ) , 
    .A2 ( clk_cnt[0] ) , .A3 ( n35 ) , .A4 ( n2 ) , .ZN ( n18 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U15 ( .A1 ( n63 ) , .A2 ( n61 ) , 
    .B ( state ) , .C ( n18 ) , .ZN ( n8 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( n8 ) , .ZN ( n3 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U17 ( .A1 ( n33 ) , .A2 ( n64 ) , .B ( n3 ) , 
    .ZN ( n7 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U18 ( .A1 ( n33 ) , .A2 ( bit_idx[0] ) , 
    .ZN ( n6 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U19 ( .A1 ( bit_idx[0] ) , .A2 ( n7 ) , 
    .B1 ( n3 ) , .B2 ( n6 ) , .ZN ( n4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U20 ( .I ( n4 ) , .ZN ( n53 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U21 ( .I ( state ) , .ZN ( n66 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai211_1 U22 ( .A1 ( n66 ) , .A2 ( ready_sent ) , 
    .B ( HFSNET_0 ) , .C ( inst_fifo_rdy ) , .ZN ( n5 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U23 ( .I ( n5 ) , .ZN ( n52 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U24 ( .A1 ( n7 ) , .A2 ( n6 ) , .ZN ( n11 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( n33 ) , .A2 ( n8 ) , .ZN ( n12 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U26 ( .A1 ( bit_idx[0] ) , .A2 ( n12 ) , 
    .A3 ( n10 ) , .ZN ( n9 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U27 ( .A1 ( n11 ) , .A2 ( n10 ) , .B ( n9 ) , 
    .ZN ( n51 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U28 ( .A1 ( n33 ) , .A2 ( bit_idx[1] ) , 
    .B ( n11 ) , .ZN ( n14 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U29 ( .I ( n14 ) , .ZN ( n13 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U30 ( .A1 ( bit_idx[1] ) , 
    .A2 ( bit_idx[0] ) , .A3 ( n12 ) , .ZN ( n16 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U31 ( .A1 ( bit_idx[2] ) , .A2 ( n13 ) , 
    .B1 ( n16 ) , .B2 ( n17 ) , .ZN ( n50 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U32 ( .I ( n33 ) , .ZN ( n57 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U33 ( .A1 ( n57 ) , .A2 ( n17 ) , 
    .B ( n14 ) , .ZN ( n15 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U34 ( .A1 ( bit_idx[3] ) , .A2 ( n17 ) , 
    .A3 ( n16 ) , .B1 ( n15 ) , .B2 ( n63 ) , .ZN ( n49 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U35 ( .A1 ( HFSNET_0 ) , .A2 ( n66 ) , 
    .ZN ( n36 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U36 ( .I ( clk_cnt[0] ) , .ZN ( n21 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U37 ( .I ( n18 ) , .ZN ( n62 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U38 ( .A1 ( n62 ) , .A2 ( n57 ) , 
    .ZN ( n39 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U39 ( .I ( n39 ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U40 ( .A1 ( n55 ) , .A2 ( n21 ) , 
    .ZN ( n19 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U41 ( .A1 ( n36 ) , .A2 ( n21 ) , 
    .B ( n19 ) , .ZN ( n48 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U42 ( .A1 ( n36 ) , .A2 ( n19 ) , 
    .ZN ( n22 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U43 ( .I ( n22 ) , .ZN ( n20 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U44 ( .I ( clk_cnt[1] ) , .ZN ( n23 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_2 U45 ( .A1 ( clk_cnt[1] ) , .A2 ( n33 ) , 
    .A3 ( n21 ) , .B1 ( n20 ) , .B2 ( n23 ) , .ZN ( n47 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U46 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[0] ) , .ZN ( n25 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U47 ( .A1 ( n57 ) , .A2 ( n23 ) , 
    .B ( n22 ) , .ZN ( n24 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U48 ( .I ( clk_cnt[2] ) , .ZN ( n26 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U49 ( .A1 ( clk_cnt[2] ) , .A2 ( n33 ) , 
    .A3 ( n25 ) , .B1 ( n24 ) , .B2 ( n26 ) , .ZN ( n46 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U50 ( .A1 ( n26 ) , .A2 ( n25 ) , 
    .ZN ( n29 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U51 ( .I ( n29 ) , .ZN ( n28 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U52 ( .A1 ( n39 ) , .A2 ( n29 ) , 
    .B ( n36 ) , .ZN ( n30 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U53 ( .I ( n30 ) , .ZN ( n27 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U54 ( .I ( clk_cnt[3] ) , .ZN ( n31 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_2 U55 ( .A1 ( clk_cnt[3] ) , .A2 ( n39 ) , 
    .A3 ( n28 ) , .B1 ( n27 ) , .B2 ( n31 ) , .ZN ( n45 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U56 ( .A1 ( clk_cnt[3] ) , .A2 ( n29 ) , 
    .ZN ( n34 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U57 ( .A1 ( n55 ) , .A2 ( n31 ) , 
    .B ( n30 ) , .ZN ( n32 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U58 ( .A1 ( clk_cnt[4] ) , .A2 ( n33 ) , 
    .A3 ( n34 ) , .B1 ( n32 ) , .B2 ( n35 ) , .ZN ( n44 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U59 ( .A1 ( n35 ) , .A2 ( n34 ) , 
    .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U60 ( .I ( n56 ) , .ZN ( n38 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U61 ( .A1 ( n56 ) , .A2 ( n39 ) , 
    .B ( n36 ) , .ZN ( n40 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U62 ( .I ( n40 ) , .ZN ( n37 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U63 ( .A1 ( clk_cnt[5] ) , .A2 ( n39 ) , 
    .A3 ( n38 ) , .B1 ( n37 ) , .B2 ( n54 ) , .ZN ( n43 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U65 ( .A1 ( n57 ) , .A2 ( clk_cnt[5] ) , 
    .A3 ( n56 ) , .ZN ( n59 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U66 ( .I ( clk_cnt[6] ) , .ZN ( n58 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U67 ( .A1 ( tmp_net93 ) , .A2 ( tmp_net94 ) , 
    .B1 ( n59 ) , .B2 ( n58 ) , .ZN ( n42 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor3_1 U68 ( .A1 ( n63 ) , .A2 ( n62 ) , 
    .A3 ( n61 ) , .ZN ( n68 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U69 ( .I ( n64 ) , .ZN ( n67 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 ctmTdsLR_1_168 ( .A1 ( n40 ) , 
    .A2 ( tmp_net92 ) , .ZN ( tmp_net93 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U71 ( .A1 ( n68 ) , .A2 ( state ) , 
    .B1 ( n67 ) , .B2 ( n66 ) , .C ( rst_n ) , .ZN ( n41 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_2_169 ( .I ( clk_cnt[6] ) , 
    .ZN ( tmp_net92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_3_170 ( .A1 ( n55 ) , .A2 ( n54 ) , 
    .ZN ( tmp_net94 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


module uart_rx ( clk , rst_n , inst , inst_val , rx , VPWR , VGND , HFSNET_3 , 
    ZCTSNET_0 , ZCTSNET_1 ) ;
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
wire ZBUF_736_0 ;
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
wire tmp_net82 ;
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
wire tmp_net83 ;
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
wire tmp_net87 ;
wire tmp_net99 ;
wire tmp_net100 ;

gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_meta_reg ( .D ( N143 ) , .CLK ( clk ) , 
    .Q ( rx_meta ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 rx_sync_reg ( .D ( N144 ) , .CLK ( clk ) , 
    .Q ( rx_sync ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_0_ ( .D ( n102 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( bit_idx[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_0_ ( .D ( n104 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( state[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_0_ ( .D ( n98 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_1_ ( .D ( n97 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_2_ ( .D ( n96 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_3_ ( .D ( n95 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_4_ ( .D ( n94 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_5_ ( .D ( n93 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 clk_cnt_reg_6_ ( .D ( n92 ) , 
    .CLK ( ZCTSNET_0 ) , .Q ( clk_cnt[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_1_ ( .D ( n101 ) , .CLK ( clk ) , 
    .Q ( bit_idx[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_2_ ( .D ( n100 ) , .CLK ( clk ) , 
    .Q ( bit_idx[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 bit_idx_reg_3_ ( .D ( n99 ) , .CLK ( clk ) , 
    .Q ( bit_idx[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 state_reg_1_ ( .D ( n103 ) , .CLK ( clk ) , 
    .Q ( state[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_15_ ( .D ( n76 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[15] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_14_ ( .D ( n77 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[14] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_13_ ( .D ( n78 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[13] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_12_ ( .D ( n79 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[12] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_11_ ( .D ( n80 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[11] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_10_ ( .D ( n81 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[10] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_9_ ( .D ( n82 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[9] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_8_ ( .D ( n83 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[8] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_7_ ( .D ( n84 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_6_ ( .D ( n85 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_5_ ( .D ( n86 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_4_ ( .D ( n87 ) , .CLK ( clk ) , 
    .Q ( inst[4] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_3_ ( .D ( n88 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_2_ ( .D ( n89 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_1_ ( .D ( n90 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_reg_0_ ( .D ( n91 ) , 
    .CLK ( ZCTSNET_1 ) , .Q ( inst[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 byte_idx_reg_0_ ( .D ( n105 ) , .CLK ( clk ) , 
    .Q ( byte_idx_0_ ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffq_1 inst_val_reg ( .D ( n75 ) , .CLK ( clk ) , 
    .Q ( inst_val ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 ctmTdsLR_1_153 ( .A1 ( n17 ) , .A2 ( n44 ) , 
    .B1 ( n15 ) , .B2 ( state[0] ) , .C ( tmp_net83 ) , .ZN ( n26 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 ZBUF_736_inst_65 ( .I ( n117 ) , 
    .Z ( ZBUF_736_0 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 ctmTdsLR_2_154 ( .A1 ( n14 ) , .A2 ( n18 ) , 
    .B ( tmp_net82 ) , .ZN ( tmp_net83 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_155 ( .I ( state[1] ) , 
    .ZN ( tmp_net82 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_1_160 ( .A1 ( n43 ) , 
    .A2 ( tmp_net87 ) , .Z ( n65 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U23 ( .A1 ( n20 ) , .A2 ( rst_n ) , 
    .ZN ( n10 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U24 ( .A1 ( HFSNET_3 ) , .A2 ( state[1] ) , 
    .ZN ( n123 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U25 ( .A1 ( state[0] ) , .A2 ( n123 ) , 
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
gf180mcu_fd_sc_mcu7t5v0__oai31_1 ctmTdsLR_1_177 ( .A1 ( n26 ) , .A2 ( n44 ) , 
    .A3 ( state[1] ) , .B ( tmp_net100 ) , .ZN ( n103 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 ctmTdsLR_2_178 ( .A1 ( n26 ) , 
    .A2 ( tmp_net99 ) , .ZN ( tmp_net100 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U61 ( .A1 ( n36 ) , .A2 ( bit_idx[2] ) , 
    .B1 ( n40 ) , .B2 ( n39 ) , .ZN ( n100 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U62 ( .A1 ( n119 ) , .A2 ( n37 ) , 
    .B ( bit_idx[3] ) , .ZN ( n38 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U63 ( .A1 ( n40 ) , .A2 ( n39 ) , 
    .B ( n38 ) , .ZN ( n99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__or2_1 ctmTdsLR_2_161 ( .A1 ( n41 ) , .A2 ( n42 ) , 
    .Z ( tmp_net87 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 ctmTdsLR_3_179 ( .I ( n24 ) , 
    .ZN ( tmp_net99 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U66 ( .A1 ( clk_cnt[0] ) , .A2 ( n44 ) , 
    .B1 ( n65 ) , .B2 ( n46 ) , .ZN ( n98 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U67 ( .A1 ( HFSNET_1 ) , .A2 ( n46 ) , 
    .B ( n58 ) , .ZN ( n45 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U68 ( .I ( clk_cnt[1] ) , .ZN ( n47 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U69 ( .A1 ( clk_cnt[1] ) , .A2 ( n46 ) , 
    .A3 ( n65 ) , .B1 ( n45 ) , .B2 ( n47 ) , .ZN ( n97 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U70 ( .A1 ( clk_cnt[1] ) , 
    .A2 ( clk_cnt[0] ) , .ZN ( n49 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U79 ( .A1 ( n52 ) , .A2 ( clk_cnt[3] ) , 
    .ZN ( n56 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U80 ( .A1 ( n54 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( n53 ) , .B2 ( HFSNET_1 ) , .C ( n58 ) , .ZN ( n55 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U81 ( .I ( clk_cnt[4] ) , .ZN ( n57 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U82 ( .A1 ( clk_cnt[4] ) , .A2 ( n65 ) , 
    .A3 ( n56 ) , .B1 ( n55 ) , .B2 ( n57 ) , .ZN ( n94 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nor2_1 U83 ( .A1 ( n57 ) , .A2 ( n56 ) , 
    .ZN ( n64 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U84 ( .I ( n64 ) , .ZN ( n60 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U85 ( .A1 ( n60 ) , .A2 ( HFSNET_1 ) , 
    .B ( n58 ) , .ZN ( n61 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U86 ( .I ( clk_cnt[5] ) , .ZN ( n59 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai32_1 U87 ( .A1 ( n65 ) , .A2 ( n60 ) , 
    .A3 ( clk_cnt[5] ) , .B1 ( n61 ) , .B2 ( n59 ) , .ZN ( n93 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai21_1 U88 ( .A1 ( n65 ) , .A2 ( clk_cnt[5] ) , 
    .B ( n61 ) , .ZN ( n63 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U89 ( .I ( n63 ) , .ZN ( n68 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand3_1 U90 ( .A1 ( clk_cnt[5] ) , .A2 ( HFSNET_1 ) , 
    .A3 ( n64 ) , .ZN ( n67 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1 ( clk_cnt[6] ) , .A2 ( n68 ) , 
    .B1 ( n67 ) , .B2 ( n66 ) , .ZN ( n92 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__and2_2 U92 ( .A1 ( n119 ) , .A2 ( n69 ) , 
    .Z ( n116 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U93 ( .A1 ( inst[1] ) , .A2 ( n116 ) , 
    .B1 ( inst[0] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n70 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U94 ( .I ( n70 ) , .ZN ( n91 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U95 ( .A1 ( inst[2] ) , .A2 ( n116 ) , 
    .B1 ( inst[1] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n71 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U96 ( .I ( n71 ) , .ZN ( n90 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U97 ( .A1 ( inst[3] ) , .A2 ( n116 ) , 
    .B1 ( inst[2] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n72 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U98 ( .I ( n72 ) , .ZN ( n89 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U99 ( .A1 ( inst[4] ) , .A2 ( n116 ) , 
    .B1 ( inst[3] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n73 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U100 ( .I ( n73 ) , .ZN ( n88 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U101 ( .A1 ( inst[5] ) , .A2 ( n116 ) , 
    .B1 ( inst[4] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n74 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U102 ( .I ( n74 ) , .ZN ( n87 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U103 ( .A1 ( inst[6] ) , .A2 ( n116 ) , 
    .B1 ( inst[5] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n106 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U104 ( .I ( n106 ) , .ZN ( n86 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U105 ( .A1 ( inst[7] ) , .A2 ( n116 ) , 
    .B1 ( inst[6] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n107 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U106 ( .I ( n107 ) , .ZN ( n85 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U107 ( .A1 ( inst[8] ) , .A2 ( n116 ) , 
    .B1 ( inst[7] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n108 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U108 ( .I ( n108 ) , .ZN ( n84 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U109 ( .A1 ( inst[9] ) , .A2 ( n116 ) , 
    .B1 ( inst[8] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n109 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U110 ( .I ( n109 ) , .ZN ( n83 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U111 ( .A1 ( inst[10] ) , .A2 ( n116 ) , 
    .B1 ( inst[9] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n110 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U112 ( .I ( n110 ) , .ZN ( n82 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U113 ( .A1 ( inst[11] ) , .A2 ( n116 ) , 
    .B1 ( inst[10] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n111 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U114 ( .I ( n111 ) , .ZN ( n81 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U115 ( .A1 ( inst[12] ) , .A2 ( n116 ) , 
    .B1 ( inst[11] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n112 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U116 ( .I ( n112 ) , .ZN ( n80 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U117 ( .A1 ( inst[13] ) , .A2 ( n116 ) , 
    .B1 ( inst[12] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n113 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U118 ( .I ( n113 ) , .ZN ( n79 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U119 ( .A1 ( inst[14] ) , .A2 ( n116 ) , 
    .B1 ( inst[13] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n114 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U120 ( .I ( n114 ) , .ZN ( n78 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U121 ( .A1 ( inst[15] ) , .A2 ( n116 ) , 
    .B1 ( inst[14] ) , .B2 ( ZBUF_736_0 ) , .ZN ( n115 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U122 ( .I ( n115 ) , .ZN ( n77 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U123 ( .A1 ( ZBUF_736_0 ) , 
    .A2 ( inst[15] ) , .B1 ( n116 ) , .B2 ( rx_sync ) , .ZN ( n118 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U124 ( .I ( n118 ) , .ZN ( n76 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U125 ( .I ( inst_val ) , .ZN ( n122 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1 ( n119 ) , .A2 ( byte_idx_0_ ) , 
    .ZN ( n120 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__oai22_1 U127 ( .A1 ( n123 ) , .A2 ( n122 ) , 
    .B1 ( n121 ) , .B2 ( n120 ) , .ZN ( n75 ) , .VDD ( VPWR ) , 
    .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_1 HFSINV_456_5 ( .I ( n65 ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
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
wire ZBUF_30_0 ;
wire ZCTSNET_2 ;
wire ZCTSNET_3 ;
wire ZCTSNET_4 ;
wire optlc_net_105 ;
wire optlc_net_106 ;
wire rx_inst_val ;
wire fifo_rdy ;
wire inst_val ;
wire exec_rdy ;
wire data_rdy ;
wire exec_inst_val ;
wire data_inst_val ;
wire result_val ;
wire operand_val ;
wire operand_is_weight ;
wire optlc_net_107 ;
wire HFSNET_1 ;
wire mem_rdy ;
wire read_en ;
wire write_en ;
wire read_data_val ;
wire qspi_req_val ;
wire qspi_req_rdy ;
wire qspi_req_write ;
wire qspi_read_data_val ;
wire HFSNET_2 ;
wire [1:0] reset_sync ;
wire [15:0] rx_inst ;
wire [15:0] inst ;
wire [5:0] exec_inst ;
wire [15:0] data_inst ;
wire [7:0] result ;
wire [7:0] operand ;
wire [23:0] addr ;
wire [1:0] device ;
wire [7:0] write_data ;
wire [7:0] read_data ;
wire [23:0] qspi_addr ;
wire [1:0] qspi_device ;
wire [7:0] qspi_write_data ;
wire [7:0] qspi_read_data ;
supply1 VPWR ;
supply0 VGND ;
wire HFSNET_4 ;
wire SYNOPSYS_UNCONNECTED_1 ;
wire SYNOPSYS_UNCONNECTED_2 ;
wire SYNOPSYS_UNCONNECTED_3 ;
wire SYNOPSYS_UNCONNECTED_4 ;

uart_rx receiver ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .inst ( rx_inst ) , .inst_val ( rx_inst_val ) , .rx ( ui_in[3] ) , 
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_3 ( HFSNET_4 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_3 ) ) ;
uart_tx transmitter ( .clk ( ZCTSNET_1 ) , .rst_n ( HFSNET_1 ) , 
    .inst_fifo_rdy ( fifo_rdy ) , .tx ( uo_out[4] ) , .VPWR ( VPWR ) , 
    .VGND ( VGND ) , .HFSNET_0 ( HFSNET_4 ) ) ;
inst_fifo fifo ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_2 ) , 
    .inst_in ( rx_inst ) , .inst_in_val ( rx_inst_val ) , 
    .fifo_rdy ( fifo_rdy ) , .decoder_rdy ( uo_out[0] ) , .inst_out ( inst ) , 
    .inst_out_val ( inst_val ) , .VPWR ( VPWR ) , .VGND ( VGND ) , 
    .ZCTSNET_0 ( ZCTSNET_3 ) ) ;
inst_decoder decode ( .rst_n ( HFSNET_1 ) , .inst_in ( inst ) , 
    .inst_in_val ( inst_val ) , .decoder_rdy ( ZBUF_30_0 ) , 
    .exec_rdy ( exec_rdy ) , .data_rdy ( data_rdy ) , 
    .exec_inst_out ( exec_inst ) , .exec_inst_out_val ( exec_inst_val ) , 
    .data_inst_out ( data_inst ) , .data_inst_out_val ( data_inst_val ) , 
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_1 ( HFSNET_2 ) ) ;
data_ctrl data ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .data_inst_in ( data_inst ) , .data_inst_in_val ( data_inst_val ) , 
    .data_rdy ( data_rdy ) , .exec_data_in ( result ) , 
    .exec_data_in_val ( result_val ) , .exec_data_out ( operand ) , 
    .exec_data_out_val ( operand_val ) , 
    .exec_data_is_weight ( operand_is_weight ) , 
    .input_scalar_mode ( SYNOPSYS_UNCONNECTED_1 ) ,
    .input_select ( { SYNOPSYS_UNCONNECTED_2 } ) ,
    .mem_itf_rdy ( mem_rdy ) , .read_en ( read_en ) , .write_en ( write_en ) , 
    .addr ( addr ) , .device ( device ) , .write_data ( write_data ) , 
    .read_data ( read_data ) , .read_data_val ( read_data_val ) , 
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_1 ( HFSNET_2 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_2 ) , 
    .ZCTSNET_2 ( ZCTSNET_3 ) ) ;
exec_unit exec ( .clk ( ZCTSNET_2 ) , .rst_n ( HFSNET_2 ) , 
    .exec_inst_in ( exec_inst ) , .exec_inst_in_val ( exec_inst_val ) , 
    .exec_rdy ( exec_rdy ) , .data_in ( operand ) , 
    .data_in_val ( operand_val ) , .is_weight ( operand_is_weight ) , 
    .input_scalar_mode ( SYNOPSYS_UNCONNECTED_3 ) ,
    .input_select ( { SYNOPSYS_UNCONNECTED_4 } ) ,
    .data_out ( result ) , .data_out_val ( result_val ) , .VPWR ( VPWR ) , 
    .VGND ( VGND ) , .ZCTSNET_0 ( ZCTSNET_3 ) ) ;
mem_itf itf ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .read_en ( read_en ) , .write_en ( write_en ) , .rdy ( mem_rdy ) , 
    .addr ( addr ) , .device ( device ) , .write_data ( write_data ) , 
    .read_data ( read_data ) , .read_data_val ( read_data_val ) , 
    .qspi_req_val ( qspi_req_val ) , .qspi_req_rdy ( qspi_req_rdy ) , 
    .qspi_req_write ( qspi_req_write ) , .qspi_req_addr ( qspi_addr ) , 
    .qspi_req_device ( qspi_device ) , .qspi_req_data ( qspi_write_data ) , 
    .qspi_read_data ( qspi_read_data ) , 
    .qspi_read_data_val ( qspi_read_data_val ) , .VPWR ( VPWR ) , 
    .VGND ( VGND ) , .HFSNET_0 ( HFSNET_2 ) , .ZCTSNET_0 ( ZCTSNET_2 ) ) ;
qspi_ctrl serial_memory ( .clk ( ZCTSNET_0 ) , .rst_n ( HFSNET_1 ) , 
    .req_val ( qspi_req_val ) , .req_rdy ( qspi_req_rdy ) , 
    .req_write ( qspi_req_write ) , .req_addr ( qspi_addr ) , 
    .req_device ( qspi_device ) , .req_data ( qspi_write_data ) , 
    .read_data ( qspi_read_data ) , .read_data_val ( qspi_read_data_val ) , 
    .sck ( uio_out[3] ) , .flash_sc_n ( uio_out[0] ) , 
    .psram_a_sc_n ( uio_out[6] ) , .psram_b_sc_n ( uio_out[7] ) ,
    .dq_in ( { uio_in[5] , uio_in[4] , uio_in[2] , uio_in[1] } ) ,
    .dq_out ( { uio_out[5] , uio_out[4] , uio_out[2] , uio_out[1] } ) ,
    .dq_oe ( { uio_oe[5] , uio_oe[4] , uio_oe[2] , uio_oe[1] } ) ,
    .VPWR ( VPWR ) , .VGND ( VGND ) , .HFSNET_0 ( HFSNET_4 ) , 
    .ZCTSNET_0 ( ZCTSNET_1 ) , .ZCTSNET_1 ( ZCTSNET_2 ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_0_ ( .D ( optlc_net_106 ) , 
    .CLK ( ZCTSNET_2 ) , .RN ( rst_n ) , .Q ( reset_sync[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 reset_sync_reg_1_ ( .D ( reset_sync[0] ) , 
    .CLK ( ZCTSNET_2 ) , .RN ( rst_n ) , .Q ( reset_sync[1] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U8 ( .I ( optlc_net_105 ) , .ZN ( uio_oe[0] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U9 ( .I ( optlc_net_105 ) , .ZN ( uio_oe[3] ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U10 ( .I ( optlc_net_105 ) , 
    .ZN ( uio_oe[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U11 ( .I ( optlc_net_105 ) , 
    .ZN ( uio_oe[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U12 ( .I ( optlc_net_106 ) , 
    .ZN ( uo_out[1] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U13 ( .I ( optlc_net_106 ) , 
    .ZN ( uo_out[2] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I ( optlc_net_107 ) , 
    .ZN ( uo_out[3] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U15 ( .I ( optlc_net_107 ) , 
    .ZN ( uo_out[5] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U16 ( .I ( optlc_net_107 ) , 
    .ZN ( uo_out[6] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__inv_1 U17 ( .I ( optlc_net_107 ) , 
    .ZN ( uo_out[7] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_3 HFSINV_999_11 ( .I ( reset_sync[1] ) , 
    .ZN ( HFSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_3 HFSBUF_731_12 ( .I ( HFSNET_4 ) , 
    .Z ( HFSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__buf_1 ZBUF_30_inst_53 ( .I ( ZBUF_30_0 ) , 
    .Z ( uo_out[0] ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 HFSBUF_910_14 ( .I ( reset_sync[1] ) , 
    .Z ( HFSNET_4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_16 ZCTSINV_13821_77 ( .I ( ZCTSNET_4 ) , 
    .ZN ( ZCTSNET_0 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_12 ZCTSINV_9468_78 ( .I ( ZCTSNET_4 ) , 
    .ZN ( ZCTSNET_1 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_16 ZCTSINV_4071_79 ( .I ( ZCTSNET_4 ) , 
    .ZN ( ZCTSNET_2 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_16 ZCTSINV_7062_80 ( .I ( ZCTSNET_4 ) , 
    .ZN ( ZCTSNET_3 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__clkinv_16 ZCTSINV_14555_81 ( .I ( clk ) , 
    .ZN ( ZCTSNET_4 ) , .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tiel optlc_193 ( .ZN ( optlc_net_105 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_194 ( .Z ( optlc_net_106 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
gf180mcu_fd_sc_mcu7t5v0__tieh optlc_195 ( .Z ( optlc_net_107 ) , 
    .VDD ( VPWR ) , .VSS ( VGND ) ) ;
endmodule


