module imm_gen (
    input [24:0] imm, // Entrada de inmediato de 25 bits (sin opcode)
    input [2:0] ImmSrc, // Fuente del inmediato (I, S, B, U, J)
    output reg [31:0] ImmExt // Salida extendida a 32 bits
);
    always @* begin
        case (ImmSrc)
            3'b000: // Tipo I
                ImmExt = {{20{imm[24]}}, imm[24:13]};
            3'b001: // Tipo S
                ImmExt = {{20{imm[24]}}, imm[24:18], imm[4:0]};
            3'b101: // Tipo B (Branch)
                ImmExt =  {{19{imm[24]}}, imm[24], imm[0], imm[23:18], imm[4:1], 1'b0};
            3'b010: // Tipo U
                ImmExt = {imm[24:5], 12'b0};
            3'b110: // Tipo J (Jump)
                ImmExt = {{11{imm[24]}}, imm[24], imm[12:5], imm[13], imm[23:14], 1'b0};
            default: // Caso por defecto
                ImmExt = 32'b0;
        endcase
    end
endmodule
