module MUXDM(Aoutpc, Bdatard, Calures, MUXopRUW, outMuxdm);
  input logic [31:0] Aoutpc;
  input logic [31:0] Bdatard;
  input logic [31:0] Calures;
  input logic [1:0] MUXopRUW;
  
  output logic [31:0] outMuxdm;
  
  always @(*) begin
    /*$display("En muxdm --> MUXopRUW = %d", MUXopRUW);
    $display("En muxdm --> Aoutpc = %d", Aoutpc);
    $display("En muxdm --> Bdatard = %d", Bdatard);
    $display("En muxdm --> Calures = %d", Calures);*/
    case (MUXopRUW)    	
      2'b10:      
        begin
          //Resultado la siguiente instrucción 
          outMuxdm <= Aoutpc;
        end
      2'b01:         
        begin   
          //Salida de la memoria de datos
          $display("En muxdm --> MUXopRUW = %d", MUXopRUW);
    $display("En muxdm --> Aoutpc = %d", Aoutpc);
    $display("En muxdm --> Bdatard = %d", Bdatard);
    $display("En muxdm --> Calures = %d", Calures);
          outMuxdm = Bdatard; 
          $display("En muxdm --> outMuxdm = %d", outMuxdm);
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