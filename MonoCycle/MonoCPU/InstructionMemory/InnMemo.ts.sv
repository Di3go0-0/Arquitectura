module Instruction_Memory_tb;
    // Señales para conectar al DUT (Device Under Test)
    logic [31:0] addrIM;    // Dirección de memoria
    wire [31:0] inst;       // Instrucción que se leerá (cambiado a wire)
    // Instanciación del módulo bajo prueba (DUT)
    Instruction_Memory dut (
        .addrIM(addrIM),
        .inst(inst)
    );
    // Inicialización y generación de estímulos
    initial begin
        // Inicializamos la simulación (archivo VCD para la visualización)
        $dumpfile("Instruction_Memory_tb.vcd");
        $dumpvars(0, Instruction_Memory_tb);
        // Prueba con diferentes direcciones de memoria
        addrIM = 0; // Primera dirección
        #10;         // Esperamos 10 unidades de tiempo
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 4; // Segunda dirección (dirección siguiente de 4 bytes)
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 8; // Tercera dirección
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 12; // Cuarta dirección
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 16; // Quinta dirección
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 1020; // Dirección cerca del final
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        addrIM = 1024; // Fuera del rango, debe manejarse adecuadamente
        #10;
        $display("Address: %0d, Instruction: %b", addrIM, inst);
        // Finalizar la simulación
        $finish;
    end
endmodule