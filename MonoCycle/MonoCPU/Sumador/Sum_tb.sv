`timescale 1ns / 1ps

module SUM_tb;

  // Señal de entrada
  reg [31:0] addrPC;

  // Señal de salida
  wire [31:0] outSUM;

  // Instancia del módulo a probar
  SUM uut (
    .addrPC(addrPC),
    .outSUM(outSUM)
  );

  // Bloque de prueba
  initial begin
    $dumpfile("dump.vcd");         // Archivo VCD para ver en GTKWave
    $dumpvars(0, SUM_tb);          // Guardar todas las variables del módulo test

    // Monitoreo de señales para depuración
    $monitor("Time: %0t | addrPC: %h | outSUM: %h", 
             $time, addrPC, outSUM);

    // Casos de prueba

    addrPC = 32'h00000000; // Se espera que outSUM = 0 + 8 = 8
    #10;                    // Espera 10 unidades de tiempo

    addrPC = 32'h00000004; // Se espera que outSUM = 4 + 8 = C
    #10;

    addrPC = 32'hFFFFFFF0; // Se espera que outSUM = FFFFFFF0 + 8 = FFFFFFF8
    #10;

    addrPC = 32'h7FFFFFFF; // Se espera que outSUM = 7FFFFFFF + 8 = 80000007
    #10;

    addrPC = 32'h00000010; // Se espera que outSUM = 10 + 8 = 18
    #10;

    // Finaliza la simulación
    $finish;
  end

endmodule
