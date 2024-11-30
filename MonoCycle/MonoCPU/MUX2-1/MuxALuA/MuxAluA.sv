module MuxAluA (
    input logic [31:0] Apc,
    input logic [31:0] Brs1,
    input logic MUXopa, // 1 bit de entrada
    output logic [31:0] outMuxa
);

    always @(*) begin
        case(MUXopa)
            1'b1: outMuxa = Apc;  // Apc se asigna si MUXopa es 1
            1'b0: outMuxa = Brs1; // Brs1 se asigna si MUXopa es 0
        endcase
    end

endmodule

