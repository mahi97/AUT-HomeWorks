module out(S, CLK, A_A, A_B, M_A, M_B, A, B);
  input  S, CLK, A_A, A_B, M_A, M_B;
  output reg A, B;

  always @(posedge CLK)begin
    if (S) begin
      A = M_A;
      B = M_B;  
    end
    else begin
      A = A_A;
      B = A_B;
    end
  end

endmodule