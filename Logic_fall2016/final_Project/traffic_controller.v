`include "out.v"
`include "man.v"
`include "auto.v"
`include "noTraffic.v"
`include "bcd_counter.v"

module trafficLightControlSystem (A_Time_L , A_Time_H ,
                                  B_Time_L , B_Time_H ,
                                  A_Light  , B_Light  ,
                                  CLK      , R        ,
                                  A        , B        ,
                                  A_Traffic, B_Traffic);

  input CLK, R, A, B, A_Traffic, B_Traffic;
  output [3:0] A_Time_L, A_Time_H, B_Time_L, B_Time_H;
  output A_Light, B_Light;

  wire timeout;
  wire [3:0] lmsb;
  wire [3:0] llsb;
  wire ltrg;
  wire [1:0] state;
  wire manual;
  wire A_A, A_B;
  wire M_A, M_B;
  auto      automodule (R, CLK, timeout, lmsb, llsb, ltrg, A_A, A_B);
  man       manlmodule (A, B, R, CLK, M_A, M_B, manual);
  out       outmodule  (manual, CLK, A_A, A_B, M_A, M_B, A_Light, B_Light);
  noTraffic notrf      (timeout, A_Light, B_Light, A_Traffic, B_Traffic, CLK);

  wire [3:0] bcdmsb;
  wire [3:0] bcdlsb;
  assign  A_Time_L = bcdlsb,
      B_Time_L = bcdlsb,
      A_Time_H = bcdmsb,
      B_Time_H = bcdmsb;
  wire lcount;
  assign lcount = 1;
  wire luf,muf;
  bcdCntr lsbbcdmodule (bcdlsb, lcount, luf, ltrg, llsb, CLK);
  bcdCntr msbbcdmodule (bcdmsb, luf   , muf, ltrg, lmsb, CLK);
  
  reg cntto;
  assign timeout = cntto; /////////temporary
  always @(posedge CLK)
    #50
    if (luf&muf)
      assign cntto=1;
    else
      assign cntto=0;

endmodule