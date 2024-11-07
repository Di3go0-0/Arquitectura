module MUXRUD(Aoutpc, Bdatard, Calures, MUXopRUW, outMuxdm);
  input logic [31:0] Aoutpc; // Entrada 
  input logic [31:0] Bdatard;// Entrada
  input logic [31:0] Calures;// Entrada 
  input logic [1:0] MUXopRUW;// Cantidad de operaciones a realizar 
  
  output logic [31:0] outMuxdm;
  
  always @(*) begin
   
    case (MUXopRUW)    	
      2'b10:      
        begin
          //Resultado la siguiente instrucción 
          outMuxdm <= Aoutpc;
        end
      2'b01:         
        begin   
          //Salida de la memoria de datos
          outMuxdm = Bdatard; 
        end
      2'b00:         
        begin  
          //Salida de la ALU 
          outMuxdm <= Calures;          
        end      
    endcase
    //$display("En muxdm --> outMuxdm = %d", outMuxdm);
  end
endmodule