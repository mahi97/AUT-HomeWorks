`timescale 1ms/1ns

module tstb_autoplusmodule;
	reg CLK,R,A,B,A_Traffic,B_Traffic;
	wire [3:0] A_Time_L,A_Time_H,B_Time_L,B_Time_H;
	wire A_Light,B_Light;		

	initial
	begin
		CLK = 1'b1;
	end

	always 
		#500 CLK = ~CLK;

	trafficLightControlSystem finally (A_Time_L,A_Time_H,B_Time_L,B_Time_H,A_Light,B_Light,CLK,R,A,B,A_Traffic,B_Traffic);

	initial
	begin

    $dumpfile("main.vcd");
    $dumpvars(0, tstb_autoplusmodule);

		R=1;
		A=0;
		B=0;
		A_Traffic=1;
		B_Traffic=1;
		#1050
				// R=0;
		// #3000
		// R=1;
		// #2000
		// R=0;
		// #1000
		// A_Traffic=0;
		// #6000
		// #200000

		//Test Case For Project1



#50000		R=1;	A=0;	B=0;	A_Traffic=1;	B_Traffic=1;	
#50000		R=0;
#150000	B=1;
#10000		B=0;
#150000	R=1;	A=0;	B=0;
#50000		R=0;	A=0;	B=0;
#100000	R=0;	A=1;	B=0;
#10000		A=0;
////////////////////////////////////////////////////////////////END OF BASIC FEATURES 


////////////////////////////////////////////////////////////////START OF TESTING FEATURES_1 
#50000 R=1;		A=0;	B=0; 	A_Traffic = 1;	B_Traffic = 1;
#50000 R=0;
#10000 A_Traffic = 0; 
B_Traffic = 0; 
#5000 B_Traffic = 1;
#3000 B_Traffic = 0;
#5000 B_Traffic = 1;
#3000 B_Traffic = 0;
#5000  B_Traffic = 1;
#10000 B_Traffic = 0;
#3000 A_Traffic = 1;
#3000 A_Traffic = 0;
#3000 A_Traffic = 1;
#3000 A_Traffic = 0;
#3000 A_Traffic = 1;
#10000 A_Traffic=0;
#10000  B_Traffic = 1;
#10000  B_Traffic = 0;


		$finish;
	end

endmodule