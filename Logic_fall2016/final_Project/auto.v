module auto(reset, CLK, timeout, load_msb, load_lsb, load_trg, lightA, lightB); //this state's for debugging
  input  reset;
  input  CLK;
  input  timeout;
  output reg [3:0] load_msb;
  output reg [3:0] load_lsb;
  output reg lightA;
  output reg lightB;
  output reg load_trg;
  reg [1:0] state; //outputted for debugging

  always @(reset)
    begin
      state = 0;
      //load_lsb = 4'b0000; //0
      //load_msb = 4'b1001; //9
      //lightA   = 1;
      //lightB   = 0;
      load_trg = 1;
    end

  always @(posedge CLK & ~reset)
    begin
      
        if (~reset)
        if (timeout)
        begin
          load_trg = 1;
          state = state + 1;
        end
        else
        begin
          load_trg = 0;
        end
          
      case (state)
        2'b00:
        begin
           load_lsb = 4'b0000; //0
           load_msb = 4'b1001; //9
           lightA   = 1;
           lightB   = 0;
        end
        2'b01:
        begin
           load_lsb = 4'b0101; //5
           load_msb = 4'b0000; //0
           lightA   = 0;
           lightB   = 0;
        end
        2'b10:
        begin
           load_lsb = 4'b0000; //0
           load_msb = 4'b0011; //3
           lightA   = 0;
           lightB   = 1;
        end
        2'b11:
        begin
           load_lsb = 4'b0101; //5
           load_msb = 4'b0000; //0
           lightA   = 0;
           lightB   = 0;
        end
      endcase
    end

endmodule