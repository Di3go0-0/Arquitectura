module Instruction_Memory(
    input logic [31:0] addrIM,  // Dirección de memoria de instrucciones que se va a leer
    output logic [31:0] inst    // contiene la instruccion leida de la memoria de instrucciones
);

    logic [7:0] im [0:1023];    // Es una memoria de 1024 pocisiones cada una de 8 bits. 
                                // Se puede acceder a cada posición con una dirección de 10 bits
                                // Cada posición de la memoria es de 8 bits, por lo que se pueden almacenar instrucciones de 32 bits en 4 posiciones consecutivas
                                // La memoria de instrucciones es de 1024 posiciones, por lo que se pueden almacenar 1024 instrucciones de 32 bits                                   

    // Cargar el archivo de instrucciones
    initial begin  
        $readmemb("./InstructionMemory/program.txt", im);
    end

    // Asignación de la instrucción de la dirección dada
    always @(*) begin
        inst = {im[addrIM], im[addrIM + 1], im[addrIM + 2], im[addrIM + 3]}; // Crea la instrucción concatenando los 4 bytes de la instrucción
    end
endmodule
