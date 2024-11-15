module SUM(addrPC, outSUM);
  input logic [31:0] addrPC;
  output logic [31:0] outSUM;

  always @(*) begin // Es asyncronico, en cualquier momento puede pasar, no depende del clock
    outSUM = addrPC + 32'b100; // 1000 es una constante que se suma a la dirección del PC
  end
endmodule
