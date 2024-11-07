`timescale 1ns / 1ps

module MUXRUD_tb;

  // Entradas
  reg [31:0] Aoutpc;
  reg [31:0] Bdatard;
  reg [31:0] Calures;
  reg [1:0] MUXopRUW;

  // Salida
  wire [31:0] outMuxdm;

  // Instancia del módulo a probar
  MUXRUD uut (
    .Aoutpc(Aoutpc),
    .Bdatard(Bdatard),
    .Calures(Calures),
    .MUXopRUW(MUXopRUW),
    .outMuxdm(outMuxdm)
  );

  // Bloque de inicialización
  initial begin
    $dumpfile("dump.vcd");         // Archivo de salida VCD
    $dumpvars(0, MUXRUD_tb);       // Guardar todas las variables del módulo test

    // Inicialización de las señales
    Aoutpc = 32'h00000000;
    Bdatard = 32'h00000000;
    Calures = 32'h00000000;
    MUXopRUW = 2'b00;

    // Monitoreo de señales para debug
    $monitor("Time: %0t | Aoutpc: %h | Bdatard: %h | Calures: %h | MUXopRUW: %b | outMuxdm: %h", 
              $time, Aoutpc, Bdatard, Calures, MUXopRUW, outMuxdm);

    // Caso de prueba 1: MUXopRUW = 00 (Salida de la ALU)
    #10 Calures = 32'hAAAA5555;
    MUXopRUW = 2'b00;
    #10;

    // Caso de prueba 2: MUXopRUW = 01 (Salida de la memoria de datos)
    #10 Bdatard = 32'h12345678;
    MUXopRUW = 2'b01;
    #10;

    // Caso de prueba 3: MUXopRUW = 10 (Resultado de la siguiente instrucción)
    #10 Aoutpc = 32'h87654321;
    MUXopRUW = 2'b10;
    #10;

    // Caso de prueba 4: Cambiar todas las entradas
    #10 Aoutpc = 32'hFFFFFFFF;
    Bdatard = 32'h00000000;
    Calures = 32'h55555555;
    MUXopRUW = 2'b00; // Debe seleccionar Calures
    #10 MUXopRUW = 2'b01; // Debe seleccionar Bdatard
    #10 MUXopRUW = 2'b10; // Debe seleccionar Aoutpc
    #10;

    // Finaliza la simulación
    $finish;
  end

endmodule
