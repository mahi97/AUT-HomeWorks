`timescale 1ns/100ps
`include "adder_rca.v"
`include "adder_cla.v"

module adderTestBench;

	reg [15:0] A;
	reg [15:0] B;
	reg Cin = 1'b0;

	wire Cout;
	wire [15:0] S;
	wire [15:0] S2;
	wire Cout2;

	adder_rca_16bit rca(A, B, Cin, S, Cout);
	adder_cla_16bit cla(A, B, Cin, S2, Cout2);
	initial begin
	
		$dumpfile("main.vcd");
    	$dumpvars(0, adderTestBench);

    	#1
    	A = 16'b0000000000000000;
    	B = 16'b0000000000000000;
    	#200
    	A = 16'b0010010001101011;
    	B = 16'b0000110000010101;
    	#200
    	B = B + 16'b1111110111101000;
    	#200

    	$finish;

	end


endmodule