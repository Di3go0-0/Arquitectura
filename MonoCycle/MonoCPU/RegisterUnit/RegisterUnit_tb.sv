`timescale 1ns / 1ps

module RegisterUnit_tb;

  // Señales de entrada
  reg clk;
  reg [4:0] rs1;
  reg [4:0] rs2;
  reg [4:0] rd;
  reg [31:0] DataWr;
  reg RUWr;

  // Señales de salida
  wire [31:0] RURs1;
  wire [31:0] RURs2;

  // Instancia del módulo a probar
  RegisterUnit uut (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .DataWr(DataWr),
    .RUWr(RUWr),
    .RURs1(RURs1),
    .RURs2(RURs2)
  );

  // Generador de reloj
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Reloj de 10 ns
  end

  // Bloque de prueba
  initial begin
    $dumpfile("dump.vcd");         // Archivo de salida VCD
    $dumpvars(0, RegisterUnit_tb); // Guardar todas las variables del módulo test

    // Inicialización de señales
    rs1 = 5'd0;
    rs2 = 5'd1;
    rd = 5'd0;
    DataWr = 32'h00000000;
    RUWr = 0;

    // Monitoreo de señales para debug
    $monitor("Time: %0t | rs1: %d | rs2: %d | rd: %d | DataWr: %h | RUWr: %b | RURs1: %h | RURs2: %h", 
             $time, rs1, rs2, rd, DataWr, RUWr, RURs1, RURs2);

    // Prueba de lectura inicial (sin escritura)
    #10 rs1 = 5'd2; // Leer el valor en el registro 2
    #10 rs2 = 5'd3; // Leer el valor en el registro 3
    #10 rs1 = 5'd4; rs2 = 5'd5; // Leer los valores en los registros 4 y 5

    // Prueba de escritura (RUWr = 1)
    #10 rd = 5'd6; DataWr = 32'hDEADBEEF; RUWr = 1; // Escribir en el registro 6
    #10 RUWr = 0; // Deshabilitar escritura

    // Verificar si el valor escrito se puede leer
    #10 rs1 = 5'd6; // Leer el valor en el registro 6 (debe ser 0xDEADBEEF)
    
    // Otra prueba de escritura en un registro diferente
    #10 rd = 5'd7; DataWr = 32'hCAFEBABE; RUWr = 1; // Escribir en el registro 7
    #10 RUWr = 0; // Deshabilitar escritura

    // Leer nuevamente los registros para verificar valores
    #10 rs1 = 5'd7; // Leer el valor en el registro 7 (debe ser 0xCAFEBABE)
    #10 rs2 = 5'd6; // Leer el valor en el registro 6 (debe seguir siendo 0xDEADBEEF)

    // Finaliza la simulación
    #10 $finish;
  end

endmodule
