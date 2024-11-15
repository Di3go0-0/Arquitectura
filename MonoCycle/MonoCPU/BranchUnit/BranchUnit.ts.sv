module branch_unit_tb;

    reg [31:0] rs1;
    reg [31:0] rs2;
    reg [4:0] BrOp;
    wire NextPCSrc;

    // Instancia del módulo branch_unit
    branch_unit uut (
        .rs1(rs1),
        .rs2(rs2),
        .BrOp(BrOp),
        .NextPCSrc(NextPCSrc)
    );

    initial begin
        // Archivo VCD para la simulación
        $dumpfile("branch_unit_tb.vcd");
        $dumpvars(0, branch_unit_tb);

        // Caso de prueba 1: BrOp[4] = 1 (debe forzar NextPCSrc a 1)
        rs1 = 32'd10;
        rs2 = 32'd20;
        BrOp = 5'b10000;
        #10;

        // Caso de prueba 2: BrOp[4:3] = 2'b00 (debe forzar NextPCSrc a 0)
        rs1 = 32'd10;
        rs2 = 32'd20;
        BrOp = 5'b00000;
        #10;

        // Caso de prueba 3: BrOp = 5'b01000 (rs1 == rs2)
        rs1 = 32'd15;
        rs2 = 32'd15;
        BrOp = 5'b01000;
        #10;

        // Caso de prueba 4: BrOp = 5'b01001 (rs1 != rs2)
        rs1 = 32'd15;
        rs2 = 32'd20;
        BrOp = 5'b01001;
        #10;

        // Caso de prueba 5: BrOp = 5'b01100 (rs1 < rs2, signed comparison)
        rs1 = -32'sd5;
        rs2 = 32'sd10;
        BrOp = 5'b01100;
        #10;

        // Caso de prueba 6: BrOp = 5'b01101 (rs1 >= rs2, signed comparison)
        rs1 = 32'sd10;
        rs2 = -32'sd5;
        BrOp = 5'b01101;
        #10;

        // Caso de prueba 7: BrOp = 5'b01110 (rs1 < rs2, unsigned comparison)
        rs1 = 32'd10;
        rs2 = 32'd20;
        BrOp = 5'b01110;
        #10;

        // Caso de prueba 8: BrOp = 5'b01111 (rs1 >= rs2, unsigned comparison)
        rs1 = 32'd20;
        rs2 = 32'd10;
        BrOp = 5'b01111;
        #10;

        // Fin de la simulación
        $finish;
    end
endmodule
