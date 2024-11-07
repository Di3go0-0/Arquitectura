Para ejecutar un archivo con su test es:

- Compilar 
    ```bash
    iverilog -o nombreGenerado.vvp modulo.sv modulo_tb.sv
    ```
- Correr archivo compilado
    ```bash
    vvp nombreGenerado.vvp
    ```
- Ver señales
    ```bash
    gtkwave dump.vcd 
    ```
