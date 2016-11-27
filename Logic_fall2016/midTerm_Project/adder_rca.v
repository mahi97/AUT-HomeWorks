`timescale 1ns/100ps

module full_adder(A, B, Cin, S, Cout);
	input  A;
	input  B;
	input  Cin;
	output Cout;
	output S;

	wire w1;
	wire w2;
	wire w3;

	xor #2 xor1(w1  , A  , B );
	xor #2 xor2(S   , Cin, w1);
	and #2 and1(w2  , A  , B );
	and #2 and2(w3  , Cin, w1);
	or  #2 or1(Cout, w2 , w3);

endmodule


module adder_rca_16bit(A, B, Cin, S, Cout);

	input [15:0] A;
	input [15:0] B;
	input Cin;
	output [15:0] S;
	output Cout;

	wire [14:0] w;

	full_adder fa00(A[0] , B[0] , Cin  , S[0] , w[0] );
	full_adder fa01(A[1] , B[1] , w[0] , S[1] , w[1] );
	full_adder fa02(A[2] , B[2] , w[1] , S[2] , w[2] );
	full_adder fa03(A[3] , B[3] , w[2] , S[3] , w[3] );
	full_adder fa04(A[4] , B[4] , w[3] , S[4] , w[4] );
	full_adder fa05(A[5] , B[5] , w[4] , S[5] , w[5] );
	full_adder fa06(A[6] , B[6] , w[5] , S[6] , w[6] );
	full_adder fa07(A[7] , B[7] , w[6] , S[7] , w[7] );
	full_adder fa08(A[8] , B[8] , w[7] , S[8] , w[8] );
	full_adder fa09(A[9] , B[9] , w[8] , S[9] , w[9] );
	full_adder fa10(A[10], B[10], w[9] , S[10], w[10]);
	full_adder fa11(A[11], B[11], w[10], S[11], w[11]);
	full_adder fa12(A[12], B[12], w[11], S[12], w[12]);
	full_adder fa13(A[13], B[13], w[12], S[13], w[13]);
	full_adder fa14(A[14], B[14], w[13], S[14], w[14]);
	full_adder fa15(A[15], B[15], w[14], S[15], Cout );

endmodule