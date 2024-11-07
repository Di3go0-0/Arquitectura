module MuxAluB(Ars2, Bimext, MUXopb, outMuxb);
  input logic [31:0] Ars2;
  input logic [31:0] Bimext;
  input logic MUXopb;
  
  output logic [31:0] outMuxb;
  
  always @(*) begin
    case (MUXopb)    	
      1'b1:      
        begin
          outMuxb <= Bimext;
        end
      1'b0:         
        begin            
          outMuxb <= Ars2;          
        end
    endcase   
  end
endmodule