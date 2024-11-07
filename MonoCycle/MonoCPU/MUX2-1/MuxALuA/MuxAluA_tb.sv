`timescale 1ns / 1ps

module test_muxalu;

  // Señales de prueba
  reg [31:0] Apc;
  reg [31:0] Brs1;
  reg MUXopa;
  wire [31:0] outMuxa;

  // Instancia del módulo MuxAluA
  MuxAluA uut (
    .Apc(Apc),
    .Brs1(Brs1),
    .MUXopa(MUXopa),
    .outMuxa(outMuxa)
  );

  // Generación del archivo de volcado para GTKWave
 initial begin
    $dumpfile("dump.vcd");      // Nombre del archivo VCD para GTKWave
    $dumpvars(0, test_muxalu);   // Volcar todas las variables en el módulo test_muxalu
  end

  // Inicialización y casos de prueba
  initial begin
    // Inicialización
    Apc = 32'h00000000;
    Brs1 = 32'h00000000;
    MUXopa = 0;

    // Monitor para mostrar valores en consola
    $monitor("Apc = %h, Brs1 = %h, MUXopa = %b, outMuxa = %h", Apc, Brs1, MUXopa, outMuxa);

    // Caso de prueba 1: Seleccionar Brs1 (MUXopa = 0)
    #10 Apc = 32'hAAAAAAAA; Brs1 = 32'h55555555; MUXopa = 0;
    #10;

    // Caso de prueba 2: Seleccionar Apc (MUXopa = 1)
    #10 MUXopa = 1;
    #10;

    // Caso de prueba 3: Cambiar Apc y mantener MUXopa = 1
    #10 Apc = 32'h12345678;
    #10;

    // Caso de prueba 4: Cambiar Brs1 y MUXopa = 1
    #10 Brs1 = 32'h87654321;
    #10;

    // Caso de prueba 5: Cambiar a MUXopa = 0 y observar Brs1
    #10 MUXopa = 0;
    #10;

    // Fin de la simulación
    $finish;
  end

endmodule
