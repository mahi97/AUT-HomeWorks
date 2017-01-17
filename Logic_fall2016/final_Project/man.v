module man(A, B, R, CLK, AL, BL, M);
  input A, B, R, CLK;
  output reg AL, BL, M;

  always @(posedge CLK) begin
    if(M == 0) begin
        if(A == 1 || B == 1) begin
            M = 1;
        end
    end else if(R == 1) begin
        AL = 0;
        BL = 0;
        M  = 0;
    end else begin

      case ({A,B})

        2'b00: begin
          AL = 0; 
          BL = 0; 
        end

        2'b01:begin
          AL = 0;
          BL = 1;
        end 

        2'b10: begin
          AL = 1;
          BL = 0;
        end 

        2'b11: begin
          AL = 0;
          BL = 0;
        end 

      endcase

    end
  end
endmodule