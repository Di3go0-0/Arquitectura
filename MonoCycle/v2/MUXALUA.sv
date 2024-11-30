module MUXALUA(Apc, Brs1, MUXopa, outMuxa);
  input logic [31:0] Apc;
  input logic [31:0] Brs1;
  input logic MUXopa;
  
  output logic [31:0] outMuxa;
  
  always @(*) begin
    case (MUXopa)    	
      1'b1:      
        begin
          outMuxa <= Apc;
        end
      1'b0:         
        begin            
          outMuxa <= Brs1;          
        end
    endcase
  end
endmodule