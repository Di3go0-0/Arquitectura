module BRU(
  input logic [31:0] RS1,        // Primer registro fuente
  input logic [31:0] RS2,        // Segundo registro fuente
  input logic [4:0] BrOp,        // Código de operación para branch
  output logic NextPCSrc         // Señal para decidir el siguiente PC
);

  always @(*) begin
    case (BrOp[4:3])
      2'b10: // Salto incondicional (Branch Always)
        NextPCSrc = 1;

      2'b01: // Condiciones de rama
        case (BrOp[2:0])
          3'b000: NextPCSrc = (RS1 == RS2);             // BEQ: Branch if equal
          3'b001: NextPCSrc = (RS1 != RS2);             // BNE: Branch if not equal
          3'b100: NextPCSrc = ($signed(RS1) < $signed(RS2)); // BLT: Branch if less than
          3'b101: NextPCSrc = ($signed(RS1) >= $signed(RS2)); // BGE: Branch if greater or equal
          3'b110: NextPCSrc = (RS1 < RS2);              // BLTU: Branch if less than unsigned
          3'b111: NextPCSrc = (RS1 >= RS2);             // BGEU: Branch if greater or equal unsigned
          default: NextPCSrc = 0;                       // Caso por defecto (sin branch)
        endcase

      2'b00: // No branch
        NextPCSrc = 0;

      default: // Caso por defecto
        NextPCSrc = 0;
    endcase
  end

endmodule

