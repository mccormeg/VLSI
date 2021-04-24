/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Fri Apr 27 12:32:52 2018
/////////////////////////////////////////////////////////////


module mult_ctl ( mul_bit_0, start, clk, done, current_state );
  output [1:0] current_state;
  input mul_bit_0, start, clk;
  output done;
  wire   n3, n4, n5, n14, n15, n16, n17, n18, n19, n1, n2, n6, n7, n8, n9, n10,
         n11, n12, n13, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36;
  wire   [1:0] next_state;
  assign current_state[0] = next_state[1];

  DFFX1 \count_reg[5]  ( .D(n19), .CLK(clk), .Q(n1), .QN(n33) );
  DFFX1 \count_reg[0]  ( .D(n18), .CLK(clk), .QN(n4) );
  DFFX1 \count_reg[1]  ( .D(n17), .CLK(clk), .QN(n3) );
  DFFX1 \count_reg[2]  ( .D(n16), .CLK(clk), .QN(n34) );
  DFFX1 \count_reg[3]  ( .D(n15), .CLK(clk), .QN(n35) );
  DFFX1 \count_reg[4]  ( .D(n14), .CLK(clk), .Q(n2), .QN(n36) );
  DFFX1 \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .Q(
        current_state[1]), .QN(n5) );
  DFFX1 \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .Q(
        next_state[1]) );
  AO22X1 U3 ( .IN1(n6), .IN2(n7), .IN3(n8), .IN4(n5), .Q(next_state[0]) );
  MUX21X1 U4 ( .IN1(start), .IN2(mul_bit_0), .S(next_state[1]), .Q(n8) );
  AO22X1 U5 ( .IN1(n9), .IN2(n1), .IN3(n10), .IN4(n2), .Q(n19) );
  MUX21X1 U6 ( .IN1(n11), .IN2(n12), .S(n4), .Q(n18) );
  MUX21X1 U7 ( .IN1(n13), .IN2(n20), .S(n3), .Q(n17) );
  NOR2X0 U8 ( .IN1(n4), .IN2(n21), .QN(n20) );
  MUX21X1 U9 ( .IN1(n22), .IN2(n23), .S(n34), .Q(n16) );
  NOR3X0 U10 ( .IN1(n21), .IN2(n4), .IN3(n3), .QN(n23) );
  AO21X1 U11 ( .IN1(n12), .IN2(n3), .IN3(n13), .Q(n22) );
  AO21X1 U12 ( .IN1(n12), .IN2(n4), .IN3(n11), .Q(n13) );
  MUX21X1 U13 ( .IN1(n24), .IN2(n25), .S(n35), .Q(n15) );
  NOR2X0 U14 ( .IN1(n21), .IN2(n26), .QN(n25) );
  MUX21X1 U15 ( .IN1(n9), .IN2(n10), .S(n36), .Q(n14) );
  NOR3X0 U16 ( .IN1(n21), .IN2(n35), .IN3(n26), .QN(n10) );
  AO21X1 U17 ( .IN1(n12), .IN2(n35), .IN3(n24), .Q(n9) );
  AO21X1 U18 ( .IN1(n12), .IN2(n26), .IN3(n11), .Q(n24) );
  INVX0 U19 ( .IN(n27), .QN(n11) );
  OR3X1 U20 ( .IN1(n4), .IN2(n34), .IN3(n3), .Q(n26) );
  INVX0 U21 ( .IN(n21), .QN(n12) );
  NAND3X0 U22 ( .IN1(n28), .IN2(n29), .IN3(n27), .QN(n21) );
  NAND3X0 U23 ( .IN1(n28), .IN2(n29), .IN3(n30), .QN(n27) );
  INVX0 U24 ( .IN(start), .QN(n29) );
  NAND2X0 U25 ( .IN1(n31), .IN2(n1), .QN(n28) );
  NOR2X0 U26 ( .IN1(n30), .IN2(n7), .QN(done) );
  OR2X1 U27 ( .IN1(n31), .IN2(n33), .Q(n7) );
  NAND4X0 U28 ( .IN1(n4), .IN2(n3), .IN3(n36), .IN4(n32), .QN(n31) );
  AND2X1 U29 ( .IN1(n35), .IN2(n34), .Q(n32) );
  INVX0 U30 ( .IN(n6), .QN(n30) );
  NOR2X0 U31 ( .IN1(next_state[1]), .IN2(n5), .QN(n6) );
endmodule


module mult_DW01_add_0 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [31:1] carry;

  FADDX1 U1_30 ( .A(A[30]), .B(B[30]), .CI(carry[30]), .CO(carry[31]), .S(
        SUM[30]) );
  FADDX1 U1_29 ( .A(A[29]), .B(B[29]), .CI(carry[29]), .CO(carry[30]), .S(
        SUM[29]) );
  FADDX1 U1_28 ( .A(A[28]), .B(B[28]), .CI(carry[28]), .CO(carry[29]), .S(
        SUM[28]) );
  FADDX1 U1_27 ( .A(A[27]), .B(B[27]), .CI(carry[27]), .CO(carry[28]), .S(
        SUM[27]) );
  FADDX1 U1_26 ( .A(A[26]), .B(B[26]), .CI(carry[26]), .CO(carry[27]), .S(
        SUM[26]) );
  FADDX1 U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(carry[26]), .S(
        SUM[25]) );
  FADDX1 U1_24 ( .A(A[24]), .B(B[24]), .CI(carry[24]), .CO(carry[25]), .S(
        SUM[24]) );
  FADDX1 U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(carry[24]), .S(
        SUM[23]) );
  FADDX1 U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  FADDX1 U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  FADDX1 U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  FADDX1 U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  FADDX1 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  FADDX1 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  FADDX1 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  FADDX1 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  FADDX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X1 U1_31 ( .IN1(A[31]), .IN2(B[31]), .IN3(carry[31]), .Q(SUM[31]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
  AND2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(n1) );
endmodule


module mult ( reset, clk, a_in, b_in, start, product, done );
  input [31:0] a_in;
  input [31:0] b_in;
  output [63:0] product;
  input reset, clk, start;
  output done;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50,
         N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64,
         N65, N66, N67, N68, N69, N70, N71, N72, N81, N82, N83, N84, N85, N86,
         N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, n10, n11, n12, n13, n14, n15;
  wire   [31:0] prod_reg_hi;
  wire   [31:0] prod_reg_lo;
  wire   [31:0] mult_reg;
  wire   [1:0] state;

  mult_ctl mul ( .mul_bit_0(prod_reg_lo[0]), .start(start), .clk(clk), .done(
        done), .current_state(state) );
  mult_DW01_add_0 add_53 ( .A(prod_reg_hi), .B(mult_reg), .CI(1'b0), .SUM({N40, 
        N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, 
        N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, 
        N11, N10, N9}) );
  DFFARX1 \mult_reg_reg[31]  ( .D(a_in[31]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[31]) );
  DFFARX1 \mult_reg_reg[30]  ( .D(a_in[30]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[30]) );
  DFFARX1 \mult_reg_reg[29]  ( .D(a_in[29]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[29]) );
  DFFARX1 \mult_reg_reg[28]  ( .D(a_in[28]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[28]) );
  DFFARX1 \mult_reg_reg[27]  ( .D(a_in[27]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[27]) );
  DFFARX1 \mult_reg_reg[26]  ( .D(a_in[26]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[26]) );
  DFFARX1 \mult_reg_reg[25]  ( .D(a_in[25]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[25]) );
  DFFARX1 \mult_reg_reg[24]  ( .D(a_in[24]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[24]) );
  DFFARX1 \mult_reg_reg[23]  ( .D(a_in[23]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[23]) );
  DFFARX1 \mult_reg_reg[22]  ( .D(a_in[22]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[22]) );
  DFFARX1 \mult_reg_reg[21]  ( .D(a_in[21]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[21]) );
  DFFARX1 \mult_reg_reg[20]  ( .D(a_in[20]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[20]) );
  DFFARX1 \mult_reg_reg[19]  ( .D(a_in[19]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[19]) );
  DFFARX1 \mult_reg_reg[18]  ( .D(a_in[18]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[18]) );
  DFFARX1 \mult_reg_reg[17]  ( .D(a_in[17]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[17]) );
  DFFARX1 \mult_reg_reg[16]  ( .D(a_in[16]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[16]) );
  DFFARX1 \mult_reg_reg[15]  ( .D(a_in[15]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[15]) );
  DFFARX1 \mult_reg_reg[14]  ( .D(a_in[14]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[14]) );
  DFFARX1 \mult_reg_reg[13]  ( .D(a_in[13]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[13]) );
  DFFARX1 \mult_reg_reg[12]  ( .D(a_in[12]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[12]) );
  DFFARX1 \mult_reg_reg[11]  ( .D(a_in[11]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[11]) );
  DFFARX1 \mult_reg_reg[10]  ( .D(a_in[10]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[10]) );
  DFFARX1 \mult_reg_reg[9]  ( .D(a_in[9]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[9]) );
  DFFARX1 \mult_reg_reg[8]  ( .D(a_in[8]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[8]) );
  DFFARX1 \mult_reg_reg[7]  ( .D(a_in[7]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[7]) );
  DFFARX1 \mult_reg_reg[6]  ( .D(a_in[6]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[6]) );
  DFFARX1 \mult_reg_reg[5]  ( .D(a_in[5]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[5]) );
  DFFARX1 \mult_reg_reg[4]  ( .D(a_in[4]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[4]) );
  DFFARX1 \mult_reg_reg[3]  ( .D(a_in[3]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[3]) );
  DFFARX1 \mult_reg_reg[2]  ( .D(a_in[2]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[2]) );
  DFFARX1 \mult_reg_reg[1]  ( .D(a_in[1]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[1]) );
  DFFARX1 \prod_reg_lo_reg[0]  ( .D(N81), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[0]) );
  DFFARX1 \prod_reg_lo_reg[18]  ( .D(N99), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[18]) );
  DFFARX1 \prod_reg_lo_reg[31]  ( .D(N112), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[31]) );
  DFFARX1 \prod_reg_lo_reg[30]  ( .D(N111), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[30]) );
  DFFARX1 \prod_reg_lo_reg[29]  ( .D(N110), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[29]) );
  DFFARX1 \prod_reg_lo_reg[28]  ( .D(N109), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[28]) );
  DFFARX1 \prod_reg_lo_reg[27]  ( .D(N108), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[27]) );
  DFFARX1 \prod_reg_lo_reg[26]  ( .D(N107), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[26]) );
  DFFARX1 \prod_reg_lo_reg[25]  ( .D(N106), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[25]) );
  DFFARX1 \prod_reg_lo_reg[24]  ( .D(N105), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[24]) );
  DFFARX1 \prod_reg_lo_reg[23]  ( .D(N104), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[23]) );
  DFFARX1 \prod_reg_lo_reg[22]  ( .D(N103), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[22]) );
  DFFARX1 \prod_reg_lo_reg[21]  ( .D(N102), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[21]) );
  DFFARX1 \prod_reg_lo_reg[20]  ( .D(N101), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[20]) );
  DFFARX1 \prod_reg_lo_reg[19]  ( .D(N100), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[19]) );
  DFFARX1 \prod_reg_lo_reg[17]  ( .D(N98), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[17]) );
  DFFARX1 \prod_reg_lo_reg[16]  ( .D(N97), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[16]) );
  DFFARX1 \prod_reg_lo_reg[15]  ( .D(N96), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[15]) );
  DFFARX1 \prod_reg_lo_reg[14]  ( .D(N95), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[14]) );
  DFFARX1 \prod_reg_lo_reg[13]  ( .D(N94), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[13]) );
  DFFARX1 \prod_reg_lo_reg[12]  ( .D(N93), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[12]) );
  DFFARX1 \prod_reg_lo_reg[11]  ( .D(N92), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[11]) );
  DFFARX1 \prod_reg_lo_reg[10]  ( .D(N91), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[10]) );
  DFFARX1 \prod_reg_lo_reg[9]  ( .D(N90), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[9]) );
  DFFARX1 \prod_reg_lo_reg[8]  ( .D(N89), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[8]) );
  DFFARX1 \prod_reg_lo_reg[7]  ( .D(N88), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[7]) );
  DFFARX1 \prod_reg_lo_reg[6]  ( .D(N87), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[6]) );
  DFFARX1 \prod_reg_lo_reg[5]  ( .D(N86), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[5]) );
  DFFARX1 \prod_reg_lo_reg[4]  ( .D(N85), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[4]) );
  DFFARX1 \prod_reg_lo_reg[3]  ( .D(N84), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[3]) );
  DFFARX1 \prod_reg_lo_reg[2]  ( .D(N83), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[2]) );
  DFFARX1 \prod_reg_lo_reg[1]  ( .D(N82), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_lo[1]) );
  DFFARX1 \mult_reg_reg[0]  ( .D(a_in[0]), .CLK(clk), .RSTB(reset), .Q(
        mult_reg[0]) );
  DFFARX1 \prod_reg_hi_reg[31]  ( .D(N72), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[31]) );
  DFFARX1 \prod_reg_hi_reg[30]  ( .D(N71), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[30]) );
  DFFARX1 \prod_reg_hi_reg[29]  ( .D(N70), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[29]) );
  DFFARX1 \prod_reg_hi_reg[28]  ( .D(N69), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[28]) );
  DFFARX1 \prod_reg_hi_reg[27]  ( .D(N68), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[27]) );
  DFFARX1 \prod_reg_hi_reg[26]  ( .D(N67), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[26]) );
  DFFARX1 \prod_reg_hi_reg[25]  ( .D(N66), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[25]) );
  DFFARX1 \prod_reg_hi_reg[24]  ( .D(N65), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[24]) );
  DFFARX1 \prod_reg_hi_reg[23]  ( .D(N64), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[23]) );
  DFFARX1 \prod_reg_hi_reg[22]  ( .D(N63), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[22]) );
  DFFARX1 \prod_reg_hi_reg[21]  ( .D(N62), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[21]) );
  DFFARX1 \prod_reg_hi_reg[20]  ( .D(N61), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[20]) );
  DFFARX1 \prod_reg_hi_reg[19]  ( .D(N60), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[19]) );
  DFFARX1 \prod_reg_hi_reg[18]  ( .D(N59), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[18]) );
  DFFARX1 \prod_reg_hi_reg[17]  ( .D(N58), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[17]) );
  DFFARX1 \prod_reg_hi_reg[16]  ( .D(N57), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[16]) );
  DFFARX1 \prod_reg_hi_reg[15]  ( .D(N56), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[15]) );
  DFFARX1 \prod_reg_hi_reg[14]  ( .D(N55), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[14]) );
  DFFARX1 \prod_reg_hi_reg[13]  ( .D(N54), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[13]) );
  DFFARX1 \prod_reg_hi_reg[12]  ( .D(N53), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[12]) );
  DFFARX1 \prod_reg_hi_reg[11]  ( .D(N52), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[11]) );
  DFFARX1 \prod_reg_hi_reg[10]  ( .D(N51), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[10]) );
  DFFARX1 \prod_reg_hi_reg[9]  ( .D(N50), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[9]) );
  DFFARX1 \prod_reg_hi_reg[8]  ( .D(N49), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[8]) );
  DFFARX1 \prod_reg_hi_reg[7]  ( .D(N48), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[7]) );
  DFFARX1 \prod_reg_hi_reg[6]  ( .D(N47), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[6]) );
  DFFARX1 \prod_reg_hi_reg[5]  ( .D(N46), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[5]) );
  DFFARX1 \prod_reg_hi_reg[4]  ( .D(N45), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[4]) );
  DFFARX1 \prod_reg_hi_reg[3]  ( .D(N44), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[3]) );
  DFFARX1 \prod_reg_hi_reg[2]  ( .D(N43), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[2]) );
  DFFARX1 \prod_reg_hi_reg[1]  ( .D(N42), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[1]) );
  DFFARX1 \prod_reg_hi_reg[0]  ( .D(N41), .CLK(clk), .RSTB(reset), .Q(
        prod_reg_hi[0]) );
  DFFARX1 \product_reg[0]  ( .D(prod_reg_lo[0]), .CLK(clk), .RSTB(reset), .Q(
        product[0]) );
  DFFARX1 \product_reg[32]  ( .D(prod_reg_hi[0]), .CLK(clk), .RSTB(reset), .Q(
        product[32]) );
  DFFARX1 \product_reg[63]  ( .D(prod_reg_hi[31]), .CLK(clk), .RSTB(reset), 
        .Q(product[63]) );
  DFFARX1 \product_reg[62]  ( .D(prod_reg_hi[30]), .CLK(clk), .RSTB(reset), 
        .Q(product[62]) );
  DFFARX1 \product_reg[61]  ( .D(prod_reg_hi[29]), .CLK(clk), .RSTB(reset), 
        .Q(product[61]) );
  DFFARX1 \product_reg[60]  ( .D(prod_reg_hi[28]), .CLK(clk), .RSTB(reset), 
        .Q(product[60]) );
  DFFARX1 \product_reg[59]  ( .D(prod_reg_hi[27]), .CLK(clk), .RSTB(reset), 
        .Q(product[59]) );
  DFFARX1 \product_reg[58]  ( .D(prod_reg_hi[26]), .CLK(clk), .RSTB(reset), 
        .Q(product[58]) );
  DFFARX1 \product_reg[57]  ( .D(prod_reg_hi[25]), .CLK(clk), .RSTB(reset), 
        .Q(product[57]) );
  DFFARX1 \product_reg[56]  ( .D(prod_reg_hi[24]), .CLK(clk), .RSTB(reset), 
        .Q(product[56]) );
  DFFARX1 \product_reg[55]  ( .D(prod_reg_hi[23]), .CLK(clk), .RSTB(reset), 
        .Q(product[55]) );
  DFFARX1 \product_reg[54]  ( .D(prod_reg_hi[22]), .CLK(clk), .RSTB(reset), 
        .Q(product[54]) );
  DFFARX1 \product_reg[53]  ( .D(prod_reg_hi[21]), .CLK(clk), .RSTB(reset), 
        .Q(product[53]) );
  DFFARX1 \product_reg[52]  ( .D(prod_reg_hi[20]), .CLK(clk), .RSTB(reset), 
        .Q(product[52]) );
  DFFARX1 \product_reg[51]  ( .D(prod_reg_hi[19]), .CLK(clk), .RSTB(reset), 
        .Q(product[51]) );
  DFFARX1 \product_reg[50]  ( .D(prod_reg_hi[18]), .CLK(clk), .RSTB(reset), 
        .Q(product[50]) );
  DFFARX1 \product_reg[49]  ( .D(prod_reg_hi[17]), .CLK(clk), .RSTB(reset), 
        .Q(product[49]) );
  DFFARX1 \product_reg[48]  ( .D(prod_reg_hi[16]), .CLK(clk), .RSTB(reset), 
        .Q(product[48]) );
  DFFARX1 \product_reg[47]  ( .D(prod_reg_hi[15]), .CLK(clk), .RSTB(reset), 
        .Q(product[47]) );
  DFFARX1 \product_reg[46]  ( .D(prod_reg_hi[14]), .CLK(clk), .RSTB(reset), 
        .Q(product[46]) );
  DFFARX1 \product_reg[45]  ( .D(prod_reg_hi[13]), .CLK(clk), .RSTB(reset), 
        .Q(product[45]) );
  DFFARX1 \product_reg[44]  ( .D(prod_reg_hi[12]), .CLK(clk), .RSTB(reset), 
        .Q(product[44]) );
  DFFARX1 \product_reg[43]  ( .D(prod_reg_hi[11]), .CLK(clk), .RSTB(reset), 
        .Q(product[43]) );
  DFFARX1 \product_reg[42]  ( .D(prod_reg_hi[10]), .CLK(clk), .RSTB(reset), 
        .Q(product[42]) );
  DFFARX1 \product_reg[41]  ( .D(prod_reg_hi[9]), .CLK(clk), .RSTB(reset), .Q(
        product[41]) );
  DFFARX1 \product_reg[40]  ( .D(prod_reg_hi[8]), .CLK(clk), .RSTB(reset), .Q(
        product[40]) );
  DFFARX1 \product_reg[39]  ( .D(prod_reg_hi[7]), .CLK(clk), .RSTB(reset), .Q(
        product[39]) );
  DFFARX1 \product_reg[38]  ( .D(prod_reg_hi[6]), .CLK(clk), .RSTB(reset), .Q(
        product[38]) );
  DFFARX1 \product_reg[37]  ( .D(prod_reg_hi[5]), .CLK(clk), .RSTB(reset), .Q(
        product[37]) );
  DFFARX1 \product_reg[36]  ( .D(prod_reg_hi[4]), .CLK(clk), .RSTB(reset), .Q(
        product[36]) );
  DFFARX1 \product_reg[35]  ( .D(prod_reg_hi[3]), .CLK(clk), .RSTB(reset), .Q(
        product[35]) );
  DFFARX1 \product_reg[34]  ( .D(prod_reg_hi[2]), .CLK(clk), .RSTB(reset), .Q(
        product[34]) );
  DFFARX1 \product_reg[33]  ( .D(prod_reg_hi[1]), .CLK(clk), .RSTB(reset), .Q(
        product[33]) );
  DFFARX1 \product_reg[31]  ( .D(prod_reg_lo[31]), .CLK(clk), .RSTB(reset), 
        .Q(product[31]) );
  DFFARX1 \product_reg[30]  ( .D(prod_reg_lo[30]), .CLK(clk), .RSTB(reset), 
        .Q(product[30]) );
  DFFARX1 \product_reg[29]  ( .D(prod_reg_lo[29]), .CLK(clk), .RSTB(reset), 
        .Q(product[29]) );
  DFFARX1 \product_reg[28]  ( .D(prod_reg_lo[28]), .CLK(clk), .RSTB(reset), 
        .Q(product[28]) );
  DFFARX1 \product_reg[27]  ( .D(prod_reg_lo[27]), .CLK(clk), .RSTB(reset), 
        .Q(product[27]) );
  DFFARX1 \product_reg[26]  ( .D(prod_reg_lo[26]), .CLK(clk), .RSTB(reset), 
        .Q(product[26]) );
  DFFARX1 \product_reg[25]  ( .D(prod_reg_lo[25]), .CLK(clk), .RSTB(reset), 
        .Q(product[25]) );
  DFFARX1 \product_reg[24]  ( .D(prod_reg_lo[24]), .CLK(clk), .RSTB(reset), 
        .Q(product[24]) );
  DFFARX1 \product_reg[23]  ( .D(prod_reg_lo[23]), .CLK(clk), .RSTB(reset), 
        .Q(product[23]) );
  DFFARX1 \product_reg[22]  ( .D(prod_reg_lo[22]), .CLK(clk), .RSTB(reset), 
        .Q(product[22]) );
  DFFARX1 \product_reg[21]  ( .D(prod_reg_lo[21]), .CLK(clk), .RSTB(reset), 
        .Q(product[21]) );
  DFFARX1 \product_reg[20]  ( .D(prod_reg_lo[20]), .CLK(clk), .RSTB(reset), 
        .Q(product[20]) );
  DFFARX1 \product_reg[19]  ( .D(prod_reg_lo[19]), .CLK(clk), .RSTB(reset), 
        .Q(product[19]) );
  DFFARX1 \product_reg[18]  ( .D(prod_reg_lo[18]), .CLK(clk), .RSTB(reset), 
        .Q(product[18]) );
  DFFARX1 \product_reg[17]  ( .D(prod_reg_lo[17]), .CLK(clk), .RSTB(reset), 
        .Q(product[17]) );
  DFFARX1 \product_reg[16]  ( .D(prod_reg_lo[16]), .CLK(clk), .RSTB(reset), 
        .Q(product[16]) );
  DFFARX1 \product_reg[15]  ( .D(prod_reg_lo[15]), .CLK(clk), .RSTB(reset), 
        .Q(product[15]) );
  DFFARX1 \product_reg[14]  ( .D(prod_reg_lo[14]), .CLK(clk), .RSTB(reset), 
        .Q(product[14]) );
  DFFARX1 \product_reg[13]  ( .D(prod_reg_lo[13]), .CLK(clk), .RSTB(reset), 
        .Q(product[13]) );
  DFFARX1 \product_reg[12]  ( .D(prod_reg_lo[12]), .CLK(clk), .RSTB(reset), 
        .Q(product[12]) );
  DFFARX1 \product_reg[11]  ( .D(prod_reg_lo[11]), .CLK(clk), .RSTB(reset), 
        .Q(product[11]) );
  DFFARX1 \product_reg[10]  ( .D(prod_reg_lo[10]), .CLK(clk), .RSTB(reset), 
        .Q(product[10]) );
  DFFARX1 \product_reg[9]  ( .D(prod_reg_lo[9]), .CLK(clk), .RSTB(reset), .Q(
        product[9]) );
  DFFARX1 \product_reg[8]  ( .D(prod_reg_lo[8]), .CLK(clk), .RSTB(reset), .Q(
        product[8]) );
  DFFARX1 \product_reg[7]  ( .D(prod_reg_lo[7]), .CLK(clk), .RSTB(reset), .Q(
        product[7]) );
  DFFARX1 \product_reg[6]  ( .D(prod_reg_lo[6]), .CLK(clk), .RSTB(reset), .Q(
        product[6]) );
  DFFARX1 \product_reg[5]  ( .D(prod_reg_lo[5]), .CLK(clk), .RSTB(reset), .Q(
        product[5]) );
  DFFARX1 \product_reg[4]  ( .D(prod_reg_lo[4]), .CLK(clk), .RSTB(reset), .Q(
        product[4]) );
  DFFARX1 \product_reg[3]  ( .D(prod_reg_lo[3]), .CLK(clk), .RSTB(reset), .Q(
        product[3]) );
  DFFARX1 \product_reg[2]  ( .D(prod_reg_lo[2]), .CLK(clk), .RSTB(reset), .Q(
        product[2]) );
  DFFARX1 \product_reg[1]  ( .D(prod_reg_lo[1]), .CLK(clk), .RSTB(reset), .Q(
        product[1]) );
  AO222X1 U75 ( .IN1(prod_reg_lo[19]), .IN2(n10), .IN3(prod_reg_lo[18]), .IN4(
        n11), .IN5(start), .IN6(b_in[18]), .Q(N99) );
  AO222X1 U76 ( .IN1(n10), .IN2(prod_reg_lo[18]), .IN3(prod_reg_lo[17]), .IN4(
        n11), .IN5(b_in[17]), .IN6(start), .Q(N98) );
  AO222X1 U77 ( .IN1(prod_reg_lo[17]), .IN2(n10), .IN3(prod_reg_lo[16]), .IN4(
        n11), .IN5(b_in[16]), .IN6(start), .Q(N97) );
  AO222X1 U78 ( .IN1(prod_reg_lo[16]), .IN2(n10), .IN3(prod_reg_lo[15]), .IN4(
        n11), .IN5(b_in[15]), .IN6(start), .Q(N96) );
  AO222X1 U79 ( .IN1(prod_reg_lo[15]), .IN2(n10), .IN3(prod_reg_lo[14]), .IN4(
        n11), .IN5(b_in[14]), .IN6(start), .Q(N95) );
  AO222X1 U80 ( .IN1(prod_reg_lo[14]), .IN2(n10), .IN3(prod_reg_lo[13]), .IN4(
        n11), .IN5(b_in[13]), .IN6(start), .Q(N94) );
  AO222X1 U81 ( .IN1(prod_reg_lo[13]), .IN2(n10), .IN3(prod_reg_lo[12]), .IN4(
        n11), .IN5(b_in[12]), .IN6(start), .Q(N93) );
  AO222X1 U82 ( .IN1(prod_reg_lo[12]), .IN2(n10), .IN3(prod_reg_lo[11]), .IN4(
        n11), .IN5(b_in[11]), .IN6(start), .Q(N92) );
  AO222X1 U83 ( .IN1(prod_reg_lo[11]), .IN2(n10), .IN3(prod_reg_lo[10]), .IN4(
        n11), .IN5(b_in[10]), .IN6(start), .Q(N91) );
  AO222X1 U84 ( .IN1(prod_reg_lo[10]), .IN2(n10), .IN3(prod_reg_lo[9]), .IN4(
        n11), .IN5(b_in[9]), .IN6(start), .Q(N90) );
  AO222X1 U85 ( .IN1(prod_reg_lo[9]), .IN2(n10), .IN3(prod_reg_lo[8]), .IN4(
        n11), .IN5(b_in[8]), .IN6(start), .Q(N89) );
  AO222X1 U86 ( .IN1(prod_reg_lo[8]), .IN2(n10), .IN3(prod_reg_lo[7]), .IN4(
        n11), .IN5(b_in[7]), .IN6(start), .Q(N88) );
  AO222X1 U87 ( .IN1(prod_reg_lo[7]), .IN2(n10), .IN3(prod_reg_lo[6]), .IN4(
        n11), .IN5(b_in[6]), .IN6(start), .Q(N87) );
  AO222X1 U88 ( .IN1(prod_reg_lo[6]), .IN2(n10), .IN3(prod_reg_lo[5]), .IN4(
        n11), .IN5(b_in[5]), .IN6(start), .Q(N86) );
  AO222X1 U89 ( .IN1(prod_reg_lo[5]), .IN2(n10), .IN3(prod_reg_lo[4]), .IN4(
        n11), .IN5(b_in[4]), .IN6(start), .Q(N85) );
  AO222X1 U90 ( .IN1(prod_reg_lo[4]), .IN2(n10), .IN3(prod_reg_lo[3]), .IN4(
        n11), .IN5(b_in[3]), .IN6(start), .Q(N84) );
  AO222X1 U91 ( .IN1(prod_reg_lo[3]), .IN2(n10), .IN3(prod_reg_lo[2]), .IN4(
        n11), .IN5(b_in[2]), .IN6(start), .Q(N83) );
  AO222X1 U92 ( .IN1(prod_reg_lo[2]), .IN2(n10), .IN3(prod_reg_lo[1]), .IN4(
        n11), .IN5(b_in[1]), .IN6(start), .Q(N82) );
  AO222X1 U93 ( .IN1(prod_reg_lo[1]), .IN2(n10), .IN3(prod_reg_lo[0]), .IN4(
        n11), .IN5(b_in[0]), .IN6(start), .Q(N81) );
  AO22X1 U94 ( .IN1(prod_reg_hi[31]), .IN2(n12), .IN3(N40), .IN4(n13), .Q(N72)
         );
  AO222X1 U95 ( .IN1(prod_reg_hi[30]), .IN2(n12), .IN3(N39), .IN4(n13), .IN5(
        prod_reg_hi[31]), .IN6(n10), .Q(N71) );
  AO222X1 U96 ( .IN1(prod_reg_hi[29]), .IN2(n12), .IN3(N38), .IN4(n13), .IN5(
        prod_reg_hi[30]), .IN6(n10), .Q(N70) );
  AO222X1 U97 ( .IN1(prod_reg_hi[28]), .IN2(n12), .IN3(N37), .IN4(n13), .IN5(
        prod_reg_hi[29]), .IN6(n10), .Q(N69) );
  AO222X1 U98 ( .IN1(prod_reg_hi[27]), .IN2(n12), .IN3(N36), .IN4(n13), .IN5(
        prod_reg_hi[28]), .IN6(n10), .Q(N68) );
  AO222X1 U99 ( .IN1(prod_reg_hi[26]), .IN2(n12), .IN3(N35), .IN4(n13), .IN5(
        prod_reg_hi[27]), .IN6(n10), .Q(N67) );
  AO222X1 U100 ( .IN1(prod_reg_hi[25]), .IN2(n12), .IN3(N34), .IN4(n13), .IN5(
        prod_reg_hi[26]), .IN6(n10), .Q(N66) );
  AO222X1 U101 ( .IN1(prod_reg_hi[24]), .IN2(n12), .IN3(N33), .IN4(n13), .IN5(
        prod_reg_hi[25]), .IN6(n10), .Q(N65) );
  AO222X1 U102 ( .IN1(prod_reg_hi[23]), .IN2(n12), .IN3(N32), .IN4(n13), .IN5(
        prod_reg_hi[24]), .IN6(n10), .Q(N64) );
  AO222X1 U103 ( .IN1(prod_reg_hi[22]), .IN2(n12), .IN3(N31), .IN4(n13), .IN5(
        prod_reg_hi[23]), .IN6(n10), .Q(N63) );
  AO222X1 U104 ( .IN1(prod_reg_hi[21]), .IN2(n12), .IN3(N30), .IN4(n13), .IN5(
        prod_reg_hi[22]), .IN6(n10), .Q(N62) );
  AO222X1 U105 ( .IN1(prod_reg_hi[20]), .IN2(n12), .IN3(N29), .IN4(n13), .IN5(
        prod_reg_hi[21]), .IN6(n10), .Q(N61) );
  AO222X1 U106 ( .IN1(prod_reg_hi[19]), .IN2(n12), .IN3(N28), .IN4(n13), .IN5(
        prod_reg_hi[20]), .IN6(n10), .Q(N60) );
  AO222X1 U107 ( .IN1(prod_reg_hi[18]), .IN2(n12), .IN3(N27), .IN4(n13), .IN5(
        prod_reg_hi[19]), .IN6(n10), .Q(N59) );
  AO222X1 U108 ( .IN1(prod_reg_hi[17]), .IN2(n12), .IN3(N26), .IN4(n13), .IN5(
        prod_reg_hi[18]), .IN6(n10), .Q(N58) );
  AO222X1 U109 ( .IN1(prod_reg_hi[16]), .IN2(n12), .IN3(N25), .IN4(n13), .IN5(
        prod_reg_hi[17]), .IN6(n10), .Q(N57) );
  AO222X1 U110 ( .IN1(prod_reg_hi[15]), .IN2(n12), .IN3(N24), .IN4(n13), .IN5(
        prod_reg_hi[16]), .IN6(n10), .Q(N56) );
  AO222X1 U111 ( .IN1(prod_reg_hi[14]), .IN2(n12), .IN3(N23), .IN4(n13), .IN5(
        prod_reg_hi[15]), .IN6(n10), .Q(N55) );
  AO222X1 U112 ( .IN1(prod_reg_hi[13]), .IN2(n12), .IN3(N22), .IN4(n13), .IN5(
        prod_reg_hi[14]), .IN6(n10), .Q(N54) );
  AO222X1 U113 ( .IN1(prod_reg_hi[12]), .IN2(n12), .IN3(N21), .IN4(n13), .IN5(
        prod_reg_hi[13]), .IN6(n10), .Q(N53) );
  AO222X1 U114 ( .IN1(prod_reg_hi[11]), .IN2(n12), .IN3(N20), .IN4(n13), .IN5(
        prod_reg_hi[12]), .IN6(n10), .Q(N52) );
  AO222X1 U115 ( .IN1(prod_reg_hi[10]), .IN2(n12), .IN3(N19), .IN4(n13), .IN5(
        prod_reg_hi[11]), .IN6(n10), .Q(N51) );
  AO222X1 U116 ( .IN1(prod_reg_hi[9]), .IN2(n12), .IN3(N18), .IN4(n13), .IN5(
        prod_reg_hi[10]), .IN6(n10), .Q(N50) );
  AO222X1 U117 ( .IN1(prod_reg_hi[8]), .IN2(n12), .IN3(N17), .IN4(n13), .IN5(
        prod_reg_hi[9]), .IN6(n10), .Q(N49) );
  AO222X1 U118 ( .IN1(prod_reg_hi[7]), .IN2(n12), .IN3(N16), .IN4(n13), .IN5(
        prod_reg_hi[8]), .IN6(n10), .Q(N48) );
  AO222X1 U119 ( .IN1(prod_reg_hi[6]), .IN2(n12), .IN3(N15), .IN4(n13), .IN5(
        prod_reg_hi[7]), .IN6(n10), .Q(N47) );
  AO222X1 U120 ( .IN1(prod_reg_hi[5]), .IN2(n12), .IN3(N14), .IN4(n13), .IN5(
        prod_reg_hi[6]), .IN6(n10), .Q(N46) );
  AO222X1 U121 ( .IN1(prod_reg_hi[4]), .IN2(n12), .IN3(N13), .IN4(n13), .IN5(
        prod_reg_hi[5]), .IN6(n10), .Q(N45) );
  AO222X1 U122 ( .IN1(prod_reg_hi[3]), .IN2(n12), .IN3(N12), .IN4(n13), .IN5(
        prod_reg_hi[4]), .IN6(n10), .Q(N44) );
  AO222X1 U123 ( .IN1(prod_reg_hi[2]), .IN2(n12), .IN3(N11), .IN4(n13), .IN5(
        prod_reg_hi[3]), .IN6(n10), .Q(N43) );
  AO222X1 U124 ( .IN1(prod_reg_hi[1]), .IN2(n12), .IN3(N10), .IN4(n13), .IN5(
        prod_reg_hi[2]), .IN6(n10), .Q(N42) );
  AO222X1 U125 ( .IN1(prod_reg_hi[0]), .IN2(n12), .IN3(N9), .IN4(n13), .IN5(
        prod_reg_hi[1]), .IN6(n10), .Q(N41) );
  AND3X1 U126 ( .IN1(state[1]), .IN2(n14), .IN3(state[0]), .Q(n13) );
  AND2X1 U127 ( .IN1(n11), .IN2(n15), .Q(n12) );
  AO222X1 U128 ( .IN1(prod_reg_hi[0]), .IN2(n10), .IN3(prod_reg_lo[31]), .IN4(
        n11), .IN5(b_in[31]), .IN6(start), .Q(N112) );
  AO222X1 U129 ( .IN1(prod_reg_lo[31]), .IN2(n10), .IN3(prod_reg_lo[30]), 
        .IN4(n11), .IN5(b_in[30]), .IN6(start), .Q(N111) );
  AO222X1 U130 ( .IN1(prod_reg_lo[30]), .IN2(n10), .IN3(prod_reg_lo[29]), 
        .IN4(n11), .IN5(b_in[29]), .IN6(start), .Q(N110) );
  AO222X1 U131 ( .IN1(prod_reg_lo[29]), .IN2(n10), .IN3(prod_reg_lo[28]), 
        .IN4(n11), .IN5(b_in[28]), .IN6(start), .Q(N109) );
  AO222X1 U132 ( .IN1(prod_reg_lo[28]), .IN2(n10), .IN3(prod_reg_lo[27]), 
        .IN4(n11), .IN5(b_in[27]), .IN6(start), .Q(N108) );
  AO222X1 U133 ( .IN1(prod_reg_lo[27]), .IN2(n10), .IN3(prod_reg_lo[26]), 
        .IN4(n11), .IN5(b_in[26]), .IN6(start), .Q(N107) );
  AO222X1 U134 ( .IN1(prod_reg_lo[26]), .IN2(n10), .IN3(prod_reg_lo[25]), 
        .IN4(n11), .IN5(b_in[25]), .IN6(start), .Q(N106) );
  AO222X1 U135 ( .IN1(prod_reg_lo[25]), .IN2(n10), .IN3(prod_reg_lo[24]), 
        .IN4(n11), .IN5(b_in[24]), .IN6(start), .Q(N105) );
  AO222X1 U136 ( .IN1(prod_reg_lo[24]), .IN2(n10), .IN3(prod_reg_lo[23]), 
        .IN4(n11), .IN5(b_in[23]), .IN6(start), .Q(N104) );
  AO222X1 U137 ( .IN1(prod_reg_lo[23]), .IN2(n10), .IN3(prod_reg_lo[22]), 
        .IN4(n11), .IN5(b_in[22]), .IN6(start), .Q(N103) );
  AO222X1 U138 ( .IN1(prod_reg_lo[22]), .IN2(n10), .IN3(prod_reg_lo[21]), 
        .IN4(n11), .IN5(b_in[21]), .IN6(start), .Q(N102) );
  AO222X1 U139 ( .IN1(prod_reg_lo[21]), .IN2(n10), .IN3(prod_reg_lo[20]), 
        .IN4(n11), .IN5(b_in[20]), .IN6(start), .Q(N101) );
  AO222X1 U140 ( .IN1(prod_reg_lo[20]), .IN2(n10), .IN3(prod_reg_lo[19]), 
        .IN4(n11), .IN5(b_in[19]), .IN6(start), .Q(N100) );
  OA21X1 U141 ( .IN1(n15), .IN2(state[0]), .IN3(n14), .Q(n11) );
  INVX0 U142 ( .IN(start), .QN(n14) );
  NOR3X0 U143 ( .IN1(start), .IN2(state[0]), .IN3(n15), .QN(n10) );
  INVX0 U144 ( .IN(state[1]), .QN(n15) );
endmodule

