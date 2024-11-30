module tb_TLD;
    logic clk;

    // Instanciar el módulo TLD
    TLD uut (
        .clk(clk)
    );

    // Generar un reloj
    always #5 clk = ~clk;

    // Inicialización del testbench
    initial begin
        clk = 0;
        // Aquí puedes agregar instrucciones de prueba, reset, etc.
        // Por ejemplo, aplica una instrucción de prueba y observa las señales
        #20;  // Espera 20 unidades de tiempo para ver el comportamiento
        $finish;
    end
endmodule
