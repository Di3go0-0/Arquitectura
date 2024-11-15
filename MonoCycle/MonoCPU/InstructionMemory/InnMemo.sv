module Instruction_Memory(
    input logic [31:0] addrIM,  // Dirección de memoria
    output reg [31:0] inst      // Instrucción que se leerá (usamos reg aquí)
);

    logic [7:0] im [0:1023];    // Memoria de 1024 palabras de 8 bits

    // Cargar el archivo de instrucciones
    initial begin  
        $readmemb("program.txt", im);  

        // Mostrar las instrucciones en formato binario
        for (integer i = 0; i < 1020; i = i + 4) begin
            $display("%d --> %b", i, {im[i], im[i+1], im[i+2], im[i+3]});
        end
    end

    // Asignación de la instrucción de la dirección dada
    always @(*) begin
        inst = {im[addrIM], im[addrIM + 1], im[addrIM + 2], im[addrIM + 3]}; 
    end
endmodule
