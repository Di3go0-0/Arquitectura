module PC(clk, nxtAddres, outPC);
  input logic clk;
  input logic [31:0] nxtAddres;
  
  output logic [31:0] outPC = 0;
  
  always @(posedge clk) begin  // para flanco de bajada es negedge
  // Es sincronico y depende del clock
     outPC <= nxtAddres;
  end
endmodule

