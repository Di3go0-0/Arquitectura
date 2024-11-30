module CU(opCode, funct3, funct7, ALUAsrc, ALUBsrc, DmWr, DMCtrl, RUWr, BrOp, RUDataWrSrc, ALUOp, ImmSrc);
  input logic [6:0] opCode, funct7;
  input logic [2:0] funct3;
  
  output logic ALUAsrc, ALUBsrc, DmWr, RUWr;
  output logic [4:0] BrOp;
  output logic [1:0] RUDataWrSrc;
  output logic [3:0] ALUOp;
  output logic [2:0] ImmSrc, DMCtrl;
  
  always @(*) begin
    // Lógica de la unidad de control
  end
endmodule