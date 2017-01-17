`timescale 10ns/100ps
`include "out.v"
`include "auto1.v"
`include "man.v"

module outTestBench;

	reg A;
	reg B;
	reg CLK;
	reg R = 1'b1;
	reg T;


	wire [3:0] la1;
	wire [3:0] la2;
	wire lt;
	wire A_LA;
	wire A_LB;
	wire M_LA;
	wire M_LB;
	wire M;
	wire O_LA;
	wire O_LB;
	

	auto autMod(R, CLK, T, la1, la2, lt, A_LA, A_LB);
	man  manMod(A, B, R, CLK, M_LA, M_LB, M);
	out  outMod(M, CLK, A_LA, A_LB, M_LA, M_LB, O_LA, O_LB);
	initial begin
		CLK = 1'b1;
	end

	always
		#10 CLK = ~CLK;

	initial begin
	
		$dumpfile("main.vcd");
    	$dumpvars(0, tstb_autoplusmodule);

    	#1
    	A = 1'b0;
    	B = 1'b0;
    	R = 1'b1;
    	T = 1'b0;
    	#100
    	R = 1'b0;
    	#200
    	// A = 1'b0;
    	// B = 1'b0;
    	R = 1'b0;
    	T = 1'b1;
    	#200    
		// A = 1'b0;
    	// B = 1'b1;
    	R = 1'b0;
    	T = 1'b0;
    	#200
    	// A = 1'b1;
    	// B = 1'b1;
    	R = 1'b0;
    	T = 1'b1;
    	#200
    	// A = 1'b1;
    	// B = 1'b0;
    	R = 1'b0;
    	T = 1'b0;
    	#200
    	// A = 1'b0;
    	// B = 1'b0;
    	R = 1'b0;
    	T = 1'b1;
    	#200    
		// A = 1'b0;
    	// B = 1'b1;
    	R = 1'b0;
    	T = 1'b0;
    	#200
    	// A = 1'b1;
    	// B = 1'b1;
    	R = 1'b0;
    	T = 1'b1;
    	#200
    	// A = 1'b1;
    	// B = 1'b0;
    	R = 1'b1;
    	T = 1'b0;
    	$finish;

	end


endmodule