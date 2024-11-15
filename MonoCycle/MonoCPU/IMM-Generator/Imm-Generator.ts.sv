module imm_gen_tb;

    reg [24:0] imm;
    reg [2:0] ImmSrc;
    wire [31:0] ImmExt;

    // Instanciación del módulo imm_gen
    imm_gen uut (
        .imm(imm),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    initial begin
        // Configuración de archivo para almacenar la simulación en formato VCD
        $dumpfile("dump.vcd");
        $dumpvars(0, imm_gen_tb);

        // Test case 1: I-type immediate
        imm = 25'b0000000000000000000000001;
        ImmSrc = 3'b000;
        #10;
        
        // Test case 2: S-type immediate
        imm = 25'b1111111000000000000000000;
        ImmSrc = 3'b001;
        #10;

        // Test case 3: B-type immediate
        imm = 25'b1000000000000000000000001;
        ImmSrc = 3'b101;
        #10;

        // Test case 4: U-type immediate
        imm = 25'b0000000011111111111111111;
        ImmSrc = 3'b010;
        #10;

        // Test case 5: J-type immediate
        imm = 25'b1111111111111111111111111;
        ImmSrc = 3'b110;
        #10;

        // Test case 6: Default case
        imm = 25'b1010101010101010101010101;
        ImmSrc = 3'b111;
        #10;

        // Fin de la simulación
        $finish;
    end
endmodule
