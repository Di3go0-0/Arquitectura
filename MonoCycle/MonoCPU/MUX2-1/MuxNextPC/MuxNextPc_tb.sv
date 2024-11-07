`timescale 1ns / 1ps

module MUXPC_tb;

  // Señales de entrada
  reg [31:0] Asum;
  reg [31:0] Balures;
  reg MUXopbu;

  // Señal de salida
  wire [31:0] outMuxbu;

  // Instancia del módulo a probar
  MUXPC uut (
    .Asum(Asum),
    .Balures(Balures),
    .MUXopbu(MUXopbu),
    .outMuxbu(outMuxbu)
  );

  // Bloque de prueba
  initial begin
    $dumpfile("dump.vcd");         // Archivo de salida VCD para ver en GTKWave
    $dumpvars(0, MUXPC_tb);        // Guardar todas las variables del módulo test

    // Inicialización de señales
    Asum = 32'h00000000;
    Balures = 32'h00000000;
    MUXopbu = 0;

    // Monitoreo de señales para depuración
    $monitor("Time: %0t | Asum: %h | Balures: %h | MUXopbu: %b | outMuxbu: %h", 
             $time, Asum, Balures, MUXopbu, outMuxbu);

    // Prueba caso 0 (MUXopbu = 0)
    #10 Asum = 32'h12345678; Balures = 32'h87654321; MUXopbu = 0; // Debe asignar Asum a outMuxbu

    // Prueba caso 1 (MUXopbu = 1)
    #10 MUXopbu = 1; // Debe asignar Balures a outMuxbu

    // Cambiar valores de entrada y verificar
    #10 Asum = 32'hAABBCCDD; Balures = 32'hDDEEFF00; MUXopbu = 0; // Debe asignar Asum
    #10 MUXopbu = 1; // Debe asignar Balures

    // Otra prueba con valores diferentes
    #10 Asum = 32'h55555555; Balures = 32'hAAAAAAAA; MUXopbu = 0; // Debe asignar Asum
    #10 MUXopbu = 1; // Debe asignar Balures

    // Finaliza la simulación
    #10 $finish;
  end

endmodule
