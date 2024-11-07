module MUXPC(Asum, Balures, MUXopbu, outMuxbu);
  input logic [31:0] Asum;
  input logic [31:0] Balures ;
  input logic MUXopbu; 
  
  output logic [31:0] outMuxbu = 32 /*sumi 88 pp32 0 fact80 pot172*/;

  always @(*) begin
    case (MUXopbu)    	
      1'b1: outMuxbu <= Balures;
      1'b0: outMuxbu <= Asum;
    endcase   
  end
endmodule