module imm_gen (
    input [24:0] imm, // Entrada de inmediato de 25 bits (sin opcode)
    input [2:0] ImmSrc, // Fuente del inmediato (I, S, B, U, J)
    output reg [31:0] ImmExt // Salida extendida a 32 bits
);

    always @* begin
        case (ImmSrc)
            3'b000: // Tipo I
                ImmExt = {{20{imm[31]}}, imm[31:20]};
            3'b001: // Tipo S
                ImmExt = {{20{imm[31]}}, imm[31:25], imm[11:7]};
            3'b101: // Tipo B (Branch)
                ImmExt =  {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
            3'b010: // Tipo U
                ImmExt = {imm[31:12], 12'b0};
            3'b110: // Tipo J (Jump)
                ImmExt = {{11{imm[31]}}, imm[31],imm[19:12], imm[20], imm[30:21], 1'b0};
            default: // Caso por defecto
                ImmExt = 32'b0;
        endcase
    end

endmodule
