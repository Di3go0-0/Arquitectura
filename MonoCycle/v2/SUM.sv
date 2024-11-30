module SUM(addrPC, outSUM);
  input logic [31:0] addrPC;
  
  output logic [31:0] outSUM;
    
  always @(*) begin
    assign outSUM = addrPC + 32'b100;
  end
endmodule