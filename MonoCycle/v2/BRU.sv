module BRU(Aru, Bru, BrOp, NextPCSrc);
  input logic [31:0] Aru;
  input logic [31:0] Bru;
  input logic [4:0] BrOp;
  
  output logic NextPCSrc;
  
  always @(*) begin
    if(BrOp[4] == 1'b1) 
      begin
        NextPCSrc <= 1;
      end 
    else 
      begin 
        if(BrOp[4:3] == 2'b01)
          begin         
            case (BrOp[2:0])          
              3'b000: NextPCSrc <= (Aru == Bru);          
              3'b001: NextPCSrc <= (Aru != Bru);          
              3'b100: NextPCSrc <= (Aru < Bru);          
              3'b101: NextPCSrc <= (Aru >= Bru);       
              3'b110: NextPCSrc <= ($unsigned(Aru) < $unsigned(Bru));
              3'b111: NextPCSrc <= ($unsigned(Aru) >= $unsigned(Bru)); 
            endcase
          end
        else
          begin
            if (BrOp[4:3] == 2'b00)
              begin              
                NextPCSrc <= 0;
              end
          end
      end
  end
endmodule