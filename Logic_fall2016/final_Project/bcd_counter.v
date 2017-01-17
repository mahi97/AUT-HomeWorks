module bcdCntr (bcdOut,count,underflow,loadtrg,load,clk);
  input count,loadtrg,clk;
  input [3:0] load;
  output reg [3:0] bcdOut;
  output reg underflow;

  always @ (posedge clk)
  #1
  begin
    if (~loadtrg & count)
      if (bcdOut==0)
      begin
        #10 bcdOut = 9; //zero to nine
        underflow = 0;
      end 
      else
      begin
        #10 bcdOut = bcdOut - 1;
        if (bcdOut==0)
          underflow=1;
        else
          underflow=0;
        end
    else
    if (loadtrg)
    begin
      #10 bcdOut = load; //loading (thus showing) at very edge*/
      if (bcdOut==0)
        underflow=1;
      else
        underflow=0;

      
    end 
    
  end
endmodule