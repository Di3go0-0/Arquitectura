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
        $readmemb("program.txt", im); // Leer el txt.

        // Mostrar las instrucciones en formato binario
        // for (integer i = 0; i < $size(im); i = i + 4) begin   // Recorre toda la memoria IM de 4 en 4 bytes
        //     $display("%d --> %b", i, {im[i], im[i+1], im[i+2], im[i+3]}); // Muestra la instrucción en formato binario 
        //     // El %d es para mostrar el número de instrucción y el %b es para mostrar la instrucción en formato binario
        //     // {im[i], im[i+1], im[i+2], im[i+3]} es para concatenar los 4 bytes de la instrucción
        // end
    end

    // Asignación de la instrucción de la dirección dada
    always @(*) begin
        inst = {im[addrIM], im[addrIM + 1], im[addrIM + 2], im[addrIM + 3]}; // Crea la instrucción concatenando los 4 bytes de la instrucción
    end
endmodule