module noTraffic (timeout,AisGreen,BisGreen,AisFull,BisFull,clk); //emptiness is called an output just for debugging
  input AisGreen,BisGreen,AisFull,BisFull,clk;
  output timeout;
  reg timeout;
  reg [2:0] emptiness; //mandatory for counting, not just for debugging

  always @ (posedge clk)
  #1
  begin
    if (AisGreen) //A's green, if empty then timeout
      if (~AisFull & BisFull)
        #10 emptiness = emptiness + 1;
      else
        #10 emptiness = 0;
    else
      if (BisGreen) //B's green, if empty then timeout
        if (~BisFull & AisFull)
          #10 emptiness = emptiness + 1;
        else
          #10 emptiness = 0;
      else //Neither's green, reset
        #10 emptiness = 0;
    #10
    if (emptiness >= 5)
      begin
        timeout = 1;
        emptiness = 5; //8 overflow -caused by some bug- can cause malfunction, so this term's for overflow prevention
      end
    else
      timeout = 0;
  end
endmodule