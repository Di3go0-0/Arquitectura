jal x0, main # llamada a la funcion main
mayor:      add x28, x0, x12    # x28 --> a temporal
            add  x29, x0, x13   # x29 --> b temporal

            blt x28, x29, bmayor # si a < b salta a bmayor

            add x11, x0, x28 # a como retorno de la funcion
            jal x0, return1  # llamada a la funcion return2



bmayor:     add x10, x0, x29 # b como retorno de la funcion
            jal x0, return2  # llamada a la funcion return1

return1:    add x7, x0, x11  # c como retorno de a
            como hago return 0?

return2:    add x7, x0, x10  # c como retorno de bmayor
            como hago return 0?

main:       addi x5, x0, 5  # x5 --> a = 5
            addi x6, x0, 10 # x6 --> b = 10
        
            add x12, x0, x5 # x12 --> a  argumento 1
            add x13, x0, x6 # x13 --> b argumento 2
            jal, x0, mayor  # llamada a la funcion mayor 