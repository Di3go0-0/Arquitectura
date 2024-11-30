module RU(rs1, rs2, ruWr, rd, dataWR_Ru, clk, ruRs1, ruRs2);
  input logic [4:0] rs1;
  input logic [4:0] rs2;
  input logic [4:0] rd;
  input logic [31:0] dataWR_Ru;
  input logic ruWr;
  input logic clk;
  
  output logic [31:0] ruRs1;
  output logic [31:0] ruRs2;
  
  reg [31:0] ru [0:31];
  
  initial begin
    $readmemb("RU.txt", ru);
  end
  
  assign ruRs1 = ru[rs1];
  assign ruRs2 = ru[rs2];
  
  always @(posedge clk) begin
    if (ruWr) begin
      if (rd != 0) begin
        ru[rd] <= dataWR_Ru;
      end
    end
  end
endmodule