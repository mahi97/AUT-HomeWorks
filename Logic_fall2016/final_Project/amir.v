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
		A_Traffic=0;
		B_Traffic=0;
		#1050
		R=0;
		#1000
		A=1;
		#1000
		A=0;
		#1000
		#200000
		$finish;
	end

endmodule


module trafficLightControlSystem (A_Time_L,A_Time_H,B_Time_L,B_Time_H,A_Light,B_Light,CLK,R,A,B,A_Traffic,B_Traffic);
	input CLK,R,A,B,A_Traffic,B_Traffic;
	output [3:0] A_Time_L,A_Time_H,B_Time_L,B_Time_H;
	output A_Light,B_Light;

	wire timeout;
	wire [3:0] lmsb;
	wire [3:0] llsb;
	wire ltrg;
	wire [1:0] state;
	auto automodule (R,CLK,timeout,lmsb,llsb,ltrg,A_Light,B_Light,state);
	wire [3:0] bcdmsb;
	wire [3:0] bcdlsb;
	assign 	A_Time_L = bcdlsb,
			B_Time_L = bcdlsb,
			A_Time_H = bcdmsb,
			B_Time_H = bcdmsb;
	wire lcount;
	assign lcount = 1;
	reg mcount = 0;
	always @(1)
		if (bcdmsb==4'b0000)
			mcount=1;
		else
			mcount=0;

	bcdCntr msbbcdmodule (bcdmsb,lcount,ltrg,lmsb,mcount);
	bcdCntr lsbbcdmodule (bcdlsb,lcount,ltrg,llsb,CLK);

	reg cntto;
	assign timeout = A; /////////temporary
	always @(1)
		if ((bcdmsb==0)&(bcdlsb==1))
			assign cntto=1;
		else
			assign cntto=0;


endmodule

module auto(reset, CLK, timeout, load_msb, load_lsb, load_trg, lightA, lightB, state); //this state's for debugging
	input  reset;
	input  CLK;
	input  timeout;
	output reg [3:0] load_msb;
	output reg [3:0] load_lsb;
	output reg lightA;
	output reg lightB;
	output reg load_trg;
	output reg [1:0] state; //outputted for debugging
	reg [1:0] timeOutDelayed;

	always @(reset)
		begin
			state = 0;
			load_trg = 1;
			timeOutDelayed = 1;
		end

	always @(posedge CLK)
		begin
			timeOutDelayed = {timeOutDelayed[0],timeout};
			
			if (~reset)
				case (timeOutDelayed)
					2'b00:
					begin
						#10 load_trg = 0;
					end
					2'b01:
					begin
						#10
						state = state + 1;
						load_trg = 1;
					end
					2'b10:
					begin
						#10 load_trg = 0;
					end
					2'b11:
					begin
						#10 load_trg = 0;
					end
				endcase

			case (state)
				2'b00:
				begin
					#10 load_lsb = 4'b0000; //0
					#10 load_msb = 4'b1001; //9
					#10 lightA   = 1;
					#10 lightB   = 0;
				end
				2'b01:
				begin
					#10 load_lsb = 4'b0101; //5
					#10 load_msb = 4'b0000; //0
					#10 lightA   = 0;
					#10 lightB   = 0;
				end
				2'b10:
				begin
					#10 load_lsb = 4'b0000; //0
					#10 load_msb = 4'b0011; //3
					#10 lightA   = 0;
					#10 lightB   = 1;
				end
				2'b11:
				begin
					#10 load_lsb = 4'b0101; //5
					#10 load_msb = 4'b0000; //0
					#10 lightA   = 0;
					#10 lightB   = 0;
				end
			endcase
		end

endmodule

module bcdCntr (bcdOut,count,loadtrg,load,clk);
	input count,loadtrg,clk;
	input [3:0] load;
	output [3:0] bcdOut;
	reg [3:0] bcdOut;

	always @ (posedge clk)
	begin
		if (~loadtrg)
			if (bcdOut)
				#10 bcdOut = bcdOut - 1; //counting down
			else
				#10 bcdOut = 4'b1001; //zero to nine
		else
			#10 bcdOut = load; //loading (thus showing) at very edge*/
	end
endmodule

module noTraffic (timeout,AisGreen,BisGreen,AisEmpty,BisEmpty,clk,emptiness); //emptiness is called an output just for debugging
	input AisGreen,BisGreen,AisEmpty,BisEmpty,clk;
	output timeout;
	output [2:0] emptiness; //for debugging
	reg timeout;
	reg [2:0] emptiness; //mandatory for counting, not just for debugging

	always @ (posedge clk)
	begin
		if (AisGreen) //A's green, if empty then timeout
			if (AisEmpty & ~BisEmpty)
				#10 emptiness = emptiness + 1;
			else
				#10 emptiness = 0;
		else
			if (BisGreen) //B's green, if empty then timeout
				if (BisEmpty & ~AisEmpty)
					#10 emptiness = emptiness + 1;
				else
					#10 emptiness = 0;
			else //Neither's green, reset
				#10 emptiness = 0;
		
		if (emptiness >= 5)
			begin
				#10 timeout = 1;
				emptiness = 5; //8 overflow -caused by some bug- can cause malfunction, so this term's for overflow prevention
			end
		else
			#10 timeout = 0;
	end
endmodule

/*module manual (A,B,R,CLK,AL,BL,M);

endmodule*/



