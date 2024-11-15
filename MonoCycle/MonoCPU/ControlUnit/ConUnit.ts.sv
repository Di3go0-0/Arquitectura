module control_unit_tb;
  // Señales de entrada
  reg [6:0] OpCode;
  reg [2:0] Funct3;
  reg [6:0] Funct7;

  // Señales de salida
  wire RUWr;
  wire AlUASrc;
  wire AlUBSrc;
  wire DMWr;
  wire [1:0] RUDataWrSrc;
  wire [2:0] DMCtrl;
  wire [2:0] ImmSrc;
  wire [3:0] ALUOp;
  wire [4:0] BrOp;

  // Instancia de la unidad de control
  control_unit dut (
    .OpCode(OpCode),
    .Funct3(Funct3),
    .Funct7(Funct7),
    .RUWr(RUWr),
    .AlUASrc(AlUASrc),
    .AlUBSrc(AlUBSrc),
    .DMWr(DMWr),
    .RUDataWrSrc(RUDataWrSrc),
    .DMCtrl(DMCtrl),
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp),
    .BrOp(BrOp)
  );

  // Procedimiento inicial para aplicar estímulos
  initial begin
    // Inicializar señales
    OpCode = 7'b0000000;
    Funct3 = 3'b000;
    Funct7 = 7'b0000000;

    // Generar archivo VCD para visualización
    $dumpfile("control_unit_tb.vcd");
    $dumpvars(0, control_unit_tb);

    // Aplicar diferentes combinaciones de OpCode, Funct3 y Funct7
    // Ejemplo de instrucción tipo R
    OpCode = 7'b0110011; Funct3 = 3'b000; Funct7 = 7'b0000000; #10;
    $display("OpCode: %b, Funct3: %b, Funct7: %b, RUWr: %b, AlUASrc: %b, AlUBSrc: %b, DMWr: %b, RUDataWrSrc: %b, DMCtrl: %b, ImmSrc: %b, ALUOp: %b, BrOp: %b",
             OpCode, Funct3, Funct7, RUWr, AlUASrc, AlUBSrc, DMWr, RUDataWrSrc, DMCtrl, ImmSrc, ALUOp, BrOp);

    // Ejemplo de instrucción tipo I
    OpCode = 7'b0010011; Funct3 = 3'b000; Funct7 = 7'b0000000; #10;
    $display("OpCode: %b, Funct3: %b, Funct7: %b, RUWr: %b, AlUASrc: %b, AlUBSrc: %b, DMWr: %b, RUDataWrSrc: %b, DMCtrl: %b, ImmSrc: %b, ALUOp: %b, BrOp: %b",
             OpCode, Funct3, Funct7, RUWr, AlUASrc, AlUBSrc, DMWr, RUDataWrSrc, DMCtrl, ImmSrc, ALUOp, BrOp);

    // Ejemplo de instrucción tipo S
    OpCode = 7'b0100011; Funct3 = 3'b000; Funct7 = 7'b0000000; #10;
    $display("OpCode: %b, Funct3: %b, Funct7: %b, RUWr: %b, AlUASrc: %b, AlUBSrc: %b, DMWr: %b, RUDataWrSrc: %b, DMCtrl: %b, ImmSrc: %b, ALUOp: %b, BrOp: %b",
             OpCode, Funct3, Funct7, RUWr, AlUASrc, AlUBSrc, DMWr, RUDataWrSrc, DMCtrl, ImmSrc, ALUOp, BrOp);

    // Ejemplo de instrucción tipo B
    OpCode = 7'b1100011; Funct3 = 3'b000; Funct7 = 7'b0000000; #10;
    $display("OpCode: %b, Funct3: %b, Funct7: %b, RUWr: %b, AlUASrc: %b, AlUBSrc: %b, DMWr: %b, RUDataWrSrc: %b, DMCtrl: %b, ImmSrc: %b, ALUOp: %b, BrOp: %b",
             OpCode, Funct3, Funct7, RUWr, AlUASrc, AlUBSrc, DMWr, RUDataWrSrc, DMCtrl, ImmSrc, ALUOp, BrOp);

    // Finalizar la simulación
    $finish;
  end
endmodule