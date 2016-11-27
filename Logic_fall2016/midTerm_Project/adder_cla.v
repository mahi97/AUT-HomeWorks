`timescale 1ns/100ps

module cla_adder_4bit(A, B, Cin, S, Cout);
	input  [3:0] A;
	input  [3:0] B;
	input  Cin;
	output Cout;
	output [3:0] S;

	wire [3:0] p;
	wire [3:0] g;
	wire [3:1] Ci;

	wire [9:0] w;

	xor #2 p0(p[0], A[0], B[0]);
	xor #2 p1(p[1], A[1], B[1]);
	xor #2 p2(p[2], A[2], B[2]);
	xor #2 p3(p[3], A[3], B[3]);

	and #2 g0(g[0], A[0], B[0]);
	and #2 g1(g[1], A[1], B[1]);
	and #2 g2(g[2], A[2], B[2]);
	and #2 g3(g[3], A[3], B[3]);

	and #2 x20(w[0], p[0], Cin);
	and #2 x21(w[1], p[1],  g[0]);
	and #2 x22(w[2], p[2],  g[1]);
	and #2 x23(w[3], p[3],  g[2]);

	and #3 x30(w[4], p[0], p[1], Cin);
	and #3 x31(w[5], p[1], p[2],  g[0]);
	and #3 x32(w[6], p[2], p[3],  g[1]);

	and #4 x40(w[7], p[0], p[1], p[2], Cin);
	and #4 x41(w[8], p[1], p[2], p[3],  g[0]);

	and #5 x50(w[9], p[0], p[1], p[2], p[3], Cin);

	or #2 c1(Ci[1], g[0], w[0]);
	or #3 c2(Ci[2], g[1], w[1], w[4]);
	or #4 c3(Ci[3], g[2], w[2], w[5], w[7]);
	or #5 c4(Cout, g[3], w[3], w[6], w[8], w[9]);

	xor #2 x0(S[0], Cin, p[0]);
	xor #2 x1(S[1], Ci[1], p[1]);
	xor #2 x2(S[2], Ci[2], p[2]);
	xor #2 x3(S[3], Ci[3], p[3]);


endmodule


module adder_cla_16bit(A, B, Cin, S, Cout);

	input [15:0] A;
	input [15:0] B;
	input Cin;
	output [15:0] S;
	output Cout;

	wire [2:0] w;

	cla_adder_4bit cla0(A[ 3: 0], B[ 3: 0], Cin , S[ 3: 0], w[0]);
	cla_adder_4bit cla1(A[ 7: 4], B[ 7: 4], w[0], S[ 7: 4], w[1]);
	cla_adder_4bit cla2(A[11: 8], B[11: 8], w[1], S[11: 8], w[2]);
	cla_adder_4bit cla3(A[15:12], B[15:12], w[2], S[15:12], Cout);

	// full_adder fa00(A[0] , B[0] , Cin  , S[0] , w[0] );
	// full_adder fa01(A[1] , B[1] , w[0] , S[1] , w[1] );
	// full_adder fa02(A[2] , B[2] , w[1] , S[2] , w[2] );
	// full_adder fa03(A[3] , B[3] , w[2] , S[3] , w[3] );
	// full_adder fa04(A[4] , B[4] , w[3] , S[4] , w[4] );
	// full_adder fa05(A[5] , B[5] , w[4] , S[5] , w[5] );
	// full_adder fa06(A[6] , B[6] , w[5] , S[6] , w[6] );
	// full_adder fa07(A[7] , B[7] , w[6] , S[7] , w[7] );
	// full_adder fa08(A[8] , B[8] , w[7] , S[8] , w[8] );
	// full_adder fa09(A[9] , B[9] , w[8] , S[9] , w[9] );
	// full_adder fa10(A[10], B[10], w[9] , S[10], w[10]);
	// full_adder fa11(A[11], B[11], w[10], S[11], w[11]);
	// full_adder fa12(A[12], B[12], w[11], S[12], w[12]);
	// full_adder fa13(A[13], B[13], w[12], S[13], w[13]);
	// full_adder fa14(A[14], B[14], w[13], S[14], w[14]);
	// full_adder fa15(A[15], B[15], w[14], S[15], Cout );

endmodule