        jal x0, main #0

        suma:   add x28, x0, x12 #4  #x12 (X) se pasa de argumento a temporal
                add x29, x0, x13 #8 #x13 (Y) se pasa de argumento a temporal 
                
                #suma
                add x30, x28, x29 #12 #X30 guarda la suma de X y Y
                add x10, x0, x30 #16 #x10 como retorno guarda x30
                jal x0, return1

        return1:    add x7, x0, x10 #20  #x6 como temporal --> z = x10 

                    #creamos un temporal para almacenar el 25
                    addi x31, x0, 25 #24

                    #comparamos al revez
                    blt x7, x31, return2 #28 #si x7 es menor que x31

                    #si x7 es mayor que x31 continuamos
                    addi, x7, x0, 0  #32  # le asignamos a x7 cero

                    add x11, x0, x7 #36  #retornamos en x11 x7

                    jal x0, fin #40


        return2:    add x11, x0, x7 #44 #retornaos en x11 x7
                    jal x0, fin #48



        main:   addi x5, x0, 10 #52 #x5 --> x = 10
                addi x6, x0, 20 #56 #x6 --> y = 20
                
                #argumentos 
                add x12, x0, x5 #60 #x12 --> x5 como argumento X
                add x13, x0, x6 #64 #x13 --> x6 como argumento Y

                jal x0, suma #68


        fin:    

