
module PC(clk, nxtAddres, outPC);
  input logic clk;
  input logic [31:0] nxtAddres;
  
  output logic [31:0] outPC = 32'b0;
  
  always @(posedge clk) begin
     outPC <= nxtAddres;
  end
endmodule