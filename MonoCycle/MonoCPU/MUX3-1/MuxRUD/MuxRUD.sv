module MUXRUD(Aoutpc, Bdatard, Calures, MUXopRUW, outMuxdm);
  input logic [31:0] Aoutpc; // Entrada 
  input logic [31:0] Bdatard;// Entrada
  input logic [31:0] Calures;// Entrada 
  input logic [1:0] MUXopRUW;// Cantidad de operaciones a realizar 
  
  output logic [31:0] outMuxdm;
  
  always @(*) begin
   
    case (MUXopRUW)    	
      2'b10: outMuxdm <= Aoutpc;
      2'b01: outMuxdm = Bdatard; 
      2'b00: outMuxdm <= Calures;     
    endcase
    //$display("En muxdm --> outMuxdm = %d", outMuxdm);
  end
endmodule