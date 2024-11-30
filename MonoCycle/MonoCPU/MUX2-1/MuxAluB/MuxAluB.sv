module MuxAluB(Ars2, Bimext, MUXopb, outMuxb);
  input logic [31:0] Ars2;
  input logic [31:0] Bimext;
  input logic MUXopb;
  
  output logic [31:0] outMuxb;
  
  always @(*) begin
    case (MUXopb)    	
      1'b1: outMuxb <= Bimext;
      1'b0: outMuxb <= Ars2;          
    endcase   
  end
endmodule
