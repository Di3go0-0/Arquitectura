`timescale 1ns / 1ps

module PC_tb;

  // Señales de entrada
  reg clk;
  reg [31:0] nxtAddres;

  // Señal de salida
  wire [31:0] outPC;

  // Instancia del módulo a probar
  PC uut (
    .clk(clk),
    .nxtAddres(nxtAddres),
    .outPC(outPC)
  );

  // Generador de reloj: alterna cada 5 unidades de tiempo (10 ns por ciclo)
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Genera un ciclo de reloj de 10 unidades de tiempo
  end

  // Bloque de prueba
  initial begin
    $dumpfile("dump.vcd");         // Archivo VCD para ver en GTKWave
    $dumpvars(0, PC_tb);           // Guardar todas las variables del módulo test

    // Inicialización de señales
    nxtAddres = 32'h00000000;

    // Monitoreo de señales para depuración
    $monitor("Time: %0t | clk: %b | nxtAddres: %h | outPC: %h", 
             $time, clk, nxtAddres, outPC);

    // Establecer valores de nxtAddres y verificar outPC en flancos de reloj

    // Espera un ciclo de reloj y cambia nxtAddres
    #10 nxtAddres = 32'h12345678; // outPC debería actualizarse a 12345678 en el siguiente flanco positivo de clk
    #10 nxtAddres = 32'hAABBCCDD; // outPC debería actualizarse a AABBCCDD en el siguiente flanco positivo
    #10 nxtAddres = 32'hFFFFFFFF; // outPC debería actualizarse a FFFFFFFF en el siguiente flanco positivo
    #10 nxtAddres = 32'h00000001; // outPC debería actualizarse a 00000001 en el siguiente flanco positivo

    // Finaliza la simulación
    #20 $finish;
  end

endmodule
