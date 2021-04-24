/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Fri Apr 20 01:00:06 2018
/////////////////////////////////////////////////////////////


module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR3X1 U1_8 ( .IN1(A[8]), .IN2(carry[0]), .IN3(carry[8]), .Q(SUM[8]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U2 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U3 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U4 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U5 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U6 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U7 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U8 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_2 ,
         \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 , \U3/U1/Z_6 , \U3/U1/Z_7 ,
         \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 , \U3/U2/Z_4 ,
         \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U3/Z_0 , n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160;

  alu_DW01_addsub_0 r30 ( .A({n159, \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B(
        {1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , 
        \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U3/Z_0 ), .SUM({N95, N94, N93, N92, N91, N90, N89, N88, N87}) );
  INVX0 U107 ( .IN(opcode[1]), .QN(n124) );
  INVX0 U108 ( .IN(opcode[2]), .QN(n125) );
  INVX0 U109 ( .IN(opcode[3]), .QN(n126) );
  NAND2X0 U110 ( .IN1(n160), .IN2(opcode[3]), .QN(n110) );
  NOR3X0 U111 ( .IN1(n110), .IN2(opcode[2]), .IN3(n124), .QN(n122) );
  NOR4X0 U112 ( .IN1(n124), .IN2(n160), .IN3(n125), .IN4(opcode[3]), .QN(n119)
         );
  OA21X1 U113 ( .IN1(n126), .IN2(n124), .IN3(opcode[3]), .Q(n101) );
  OA22X1 U114 ( .IN1(n160), .IN2(n101), .IN3(opcode[3]), .IN4(n124), .Q(n102)
         );
  NOR2X0 U115 ( .IN1(opcode[2]), .IN2(n102), .QN(n107) );
  NOR2X0 U116 ( .IN1(opcode[3]), .IN2(n125), .QN(n106) );
  AO22X1 U117 ( .IN1(N97), .IN2(opcode[1]), .IN3(N87), .IN4(n124), .Q(n104) );
  NOR2X0 U118 ( .IN1(opcode[1]), .IN2(n160), .QN(n103) );
  AO22X1 U119 ( .IN1(n104), .IN2(n160), .IN3(n103), .IN4(N96), .Q(n105) );
  AND3X1 U120 ( .IN1(n125), .IN2(n124), .IN3(opcode[3]), .Q(n123) );
  AO222X1 U121 ( .IN1(n107), .IN2(N87), .IN3(n106), .IN4(n105), .IN5(n123), 
        .IN6(in_a[0]), .Q(n108) );
  AO221X1 U122 ( .IN1(n158), .IN2(n122), .IN3(N105), .IN4(n119), .IN5(n108), 
        .Q(alu_out[0]) );
  XNOR2X1 U123 ( .IN1(n160), .IN2(opcode[2]), .Q(n109) );
  NAND3X0 U124 ( .IN1(n126), .IN2(n124), .IN3(n109), .QN(n112) );
  NAND3X0 U125 ( .IN1(n110), .IN2(n125), .IN3(opcode[1]), .QN(n111) );
  NAND2X0 U126 ( .IN1(n112), .IN2(n111), .QN(n120) );
  AO22X1 U127 ( .IN1(N88), .IN2(n120), .IN3(N104), .IN4(n119), .Q(n113) );
  AO221X1 U128 ( .IN1(n123), .IN2(in_a[1]), .IN3(n157), .IN4(n122), .IN5(n113), 
        .Q(alu_out[1]) );
  AO22X1 U129 ( .IN1(N89), .IN2(n120), .IN3(N103), .IN4(n119), .Q(n114) );
  AO221X1 U130 ( .IN1(n123), .IN2(in_a[2]), .IN3(n156), .IN4(n122), .IN5(n114), 
        .Q(alu_out[2]) );
  AO22X1 U131 ( .IN1(N90), .IN2(n120), .IN3(N102), .IN4(n119), .Q(n115) );
  AO221X1 U132 ( .IN1(n123), .IN2(in_a[3]), .IN3(n155), .IN4(n122), .IN5(n115), 
        .Q(alu_out[3]) );
  AO22X1 U133 ( .IN1(N91), .IN2(n120), .IN3(N101), .IN4(n119), .Q(n116) );
  AO221X1 U134 ( .IN1(n123), .IN2(in_a[4]), .IN3(n154), .IN4(n122), .IN5(n116), 
        .Q(alu_out[4]) );
  AO22X1 U135 ( .IN1(N92), .IN2(n120), .IN3(N100), .IN4(n119), .Q(n117) );
  AO221X1 U136 ( .IN1(n123), .IN2(in_a[5]), .IN3(n153), .IN4(n122), .IN5(n117), 
        .Q(alu_out[5]) );
  AO22X1 U137 ( .IN1(N93), .IN2(n120), .IN3(N99), .IN4(n119), .Q(n118) );
  AO221X1 U138 ( .IN1(n123), .IN2(in_a[6]), .IN3(n152), .IN4(n122), .IN5(n118), 
        .Q(alu_out[6]) );
  AO22X1 U139 ( .IN1(N94), .IN2(n120), .IN3(N98), .IN4(n119), .Q(n121) );
  AO221X1 U140 ( .IN1(n123), .IN2(in_a[7]), .IN3(n151), .IN4(n122), .IN5(n121), 
        .Q(alu_out[7]) );
  NOR2X0 U141 ( .IN1(n127), .IN2(n128), .QN(alu_zero) );
  OR4X1 U142 ( .IN1(alu_out[1]), .IN2(alu_out[0]), .IN3(alu_out[3]), .IN4(
        alu_out[2]), .Q(n128) );
  OR4X1 U143 ( .IN1(alu_out[5]), .IN2(alu_out[4]), .IN3(alu_out[7]), .IN4(
        alu_out[6]), .Q(n127) );
  NAND2X0 U144 ( .IN1(n129), .IN2(n130), .QN(alu_carry) );
  NAND4X0 U145 ( .IN1(opcode[3]), .IN2(opcode[1]), .IN3(n160), .IN4(n125), 
        .QN(n130) );
  NAND2X0 U146 ( .IN1(N95), .IN2(n131), .QN(n129) );
  OR2X1 U147 ( .IN1(n132), .IN2(n159), .Q(n131) );
  AND2X1 U148 ( .IN1(n133), .IN2(in_b[7]), .Q(\U3/U2/Z_7 ) );
  AND2X1 U149 ( .IN1(n133), .IN2(in_b[6]), .Q(\U3/U2/Z_6 ) );
  AND2X1 U150 ( .IN1(n133), .IN2(in_b[5]), .Q(\U3/U2/Z_5 ) );
  AND2X1 U151 ( .IN1(n133), .IN2(in_b[4]), .Q(\U3/U2/Z_4 ) );
  AND2X1 U152 ( .IN1(n133), .IN2(in_b[3]), .Q(\U3/U2/Z_3 ) );
  AND2X1 U153 ( .IN1(n133), .IN2(in_b[2]), .Q(\U3/U2/Z_2 ) );
  NOR2X0 U154 ( .IN1(n134), .IN2(n135), .QN(\U3/U2/Z_1 ) );
  NAND3X0 U155 ( .IN1(n136), .IN2(n137), .IN3(n138), .QN(\U3/U2/Z_0 ) );
  MUX21X1 U156 ( .IN1(n139), .IN2(n140), .S(opcode[1]), .Q(n138) );
  NAND2X0 U157 ( .IN1(n141), .IN2(opcode[0]), .QN(n140) );
  NAND3X0 U158 ( .IN1(n160), .IN2(n126), .IN3(opcode[2]), .QN(n139) );
  NAND2X0 U159 ( .IN1(in_b[0]), .IN2(n133), .QN(n136) );
  INVX0 U160 ( .IN(n134), .QN(n133) );
  NAND2X0 U161 ( .IN1(n141), .IN2(n142), .QN(n134) );
  XNOR2X1 U162 ( .IN1(opcode[1]), .IN2(n160), .Q(n142) );
  MUX21X1 U163 ( .IN1(n132), .IN2(n159), .S(n151), .Q(\U3/U1/Z_7 ) );
  MUX21X1 U164 ( .IN1(n132), .IN2(n159), .S(n152), .Q(\U3/U1/Z_6 ) );
  MUX21X1 U165 ( .IN1(n132), .IN2(n159), .S(n153), .Q(\U3/U1/Z_5 ) );
  MUX21X1 U166 ( .IN1(n132), .IN2(n159), .S(n154), .Q(\U3/U1/Z_4 ) );
  MUX21X1 U167 ( .IN1(n132), .IN2(n159), .S(n155), .Q(\U3/U1/Z_3 ) );
  MUX21X1 U168 ( .IN1(n132), .IN2(n159), .S(n156), .Q(\U3/U1/Z_2 ) );
  MUX21X1 U169 ( .IN1(n132), .IN2(n159), .S(n157), .Q(\U3/U1/Z_1 ) );
  MUX21X1 U170 ( .IN1(n132), .IN2(n159), .S(n158), .Q(\U3/U1/Z_0 ) );
  INVX0 U171 ( .IN(n137), .QN(n159) );
  NAND4X0 U172 ( .IN1(opcode[3]), .IN2(opcode[1]), .IN3(opcode[0]), .IN4(n125), 
        .QN(n137) );
  AO21X1 U173 ( .IN1(n141), .IN2(opcode[0]), .IN3(\U3/U3/Z_0 ), .Q(n132) );
  AND3X1 U174 ( .IN1(n160), .IN2(n126), .IN3(n143), .Q(\U3/U3/Z_0 ) );
  XNOR2X1 U175 ( .IN1(n125), .IN2(opcode[1]), .Q(n143) );
  INVX0 U176 ( .IN(opcode[0]), .QN(n160) );
  NOR2X0 U177 ( .IN1(opcode[2]), .IN2(opcode[3]), .QN(n141) );
  XNOR2X1 U178 ( .IN1(in_b[6]), .IN2(n152), .Q(N99) );
  INVX0 U179 ( .IN(in_a[6]), .QN(n152) );
  XNOR2X1 U180 ( .IN1(in_b[7]), .IN2(n151), .Q(N98) );
  INVX0 U181 ( .IN(in_a[7]), .QN(n151) );
  NOR2X0 U182 ( .IN1(n144), .IN2(n145), .QN(N97) );
  NAND2X0 U183 ( .IN1(n144), .IN2(n145), .QN(N96) );
  AND4X1 U184 ( .IN1(n146), .IN2(n135), .IN3(n147), .IN4(n148), .Q(n145) );
  NOR4X0 U185 ( .IN1(in_b[7]), .IN2(in_b[6]), .IN3(in_b[5]), .IN4(in_b[4]), 
        .QN(n148) );
  NOR2X0 U186 ( .IN1(in_b[3]), .IN2(in_b[2]), .QN(n147) );
  AND4X1 U187 ( .IN1(n158), .IN2(n157), .IN3(n149), .IN4(n150), .Q(n144) );
  NOR4X0 U188 ( .IN1(in_a[7]), .IN2(in_a[6]), .IN3(in_a[5]), .IN4(in_a[4]), 
        .QN(n150) );
  NOR2X0 U189 ( .IN1(in_a[3]), .IN2(in_a[2]), .QN(n149) );
  INVX0 U190 ( .IN(in_a[1]), .QN(n157) );
  INVX0 U191 ( .IN(in_a[0]), .QN(n158) );
  XNOR2X1 U192 ( .IN1(n146), .IN2(in_a[0]), .Q(N105) );
  INVX0 U193 ( .IN(in_b[0]), .QN(n146) );
  XNOR2X1 U194 ( .IN1(n135), .IN2(in_a[1]), .Q(N104) );
  INVX0 U195 ( .IN(in_b[1]), .QN(n135) );
  XNOR2X1 U196 ( .IN1(in_b[2]), .IN2(n156), .Q(N103) );
  INVX0 U197 ( .IN(in_a[2]), .QN(n156) );
  XNOR2X1 U198 ( .IN1(in_b[3]), .IN2(n155), .Q(N102) );
  INVX0 U199 ( .IN(in_a[3]), .QN(n155) );
  XNOR2X1 U200 ( .IN1(in_b[4]), .IN2(n154), .Q(N101) );
  INVX0 U201 ( .IN(in_a[4]), .QN(n154) );
  XNOR2X1 U202 ( .IN1(in_b[5]), .IN2(n153), .Q(N100) );
  INVX0 U203 ( .IN(in_a[5]), .QN(n153) );
endmodule

