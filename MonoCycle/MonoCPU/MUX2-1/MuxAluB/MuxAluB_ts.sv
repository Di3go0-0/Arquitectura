module MuxAluB_ts;

  // Definición de señales de prueba
  reg [31:0] Ars2;       // Entrada 1
  reg [31:0] Bimext;     // Entrada 2
  reg MUXopb;            // Selección
  wire [31:0] outMuxb;   // Salida

  // Instancia del módulo MuxAluB
  MuxAluB uut (
    .Ars2(Ars2),
    .Bimext(Bimext),
    .MUXopb(MUXopb),
    .outMuxb(outMuxb)
  );

  // Procedimiento de prueba
  initial begin
    // Archivo de volcado para la visualización en GTKWave
    $dumpfile("dump_mux.vcd");
    $dumpvars(0, MuxAluB_ts);

    // Test Case 1: MUXopb = 0, se debe seleccionar Ars2
    Ars2 = 32'hAAAA_AAAA;
    Bimext = 32'h5555_5555;
    MUXopb = 1'b0;
    #10;
    $display("MUXopb = %b | outMuxb = %h (esperado: %h)", MUXopb, outMuxb, Ars2);

    // Test Case 2: MUXopb = 1, se debe seleccionar Bimext
    MUXopb = 1'b1;
    #10;
    $display("MUXopb = %b | outMuxb = %h (esperado: %h)", MUXopb, outMuxb, Bimext);

    // Test Case 3: Cambiando entradas para MUXopb = 0
    Ars2 = 32'h1234_5678;
    Bimext = 32'h8765_4321;
    MUXopb = 1'b0;
    #10;
    $display("MUXopb = %b | outMuxb = %h (esperado: %h)", MUXopb, outMuxb, Ars2);

    // Test Case 4: Cambiando entradas para MUXopb = 1
    MUXopb = 1'b1;
    #10;
    $display("MUXopb = %b | outMuxb = %h (esperado: %h)", MUXopb, outMuxb, Bimext);

    // Fin de la simulación
    $finish;
  end

endmodule
