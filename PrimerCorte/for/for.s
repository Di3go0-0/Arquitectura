jal x0, main #saltamos a main

sumatoria:  add x6, x0, x12 #x6 (n) como temporal de x12 (argumento) 
            
            #Auxiliares
            addi x7, x0, 0 #x7 --> i = 0
            addi x28, x0, 0 #x28 --> suma = 0

            
            #empezamos el for
            jal x0, for

# condicion e incremento
for:    bge x7, x6, exitfor # si x7 (i) es mayor o igual rompe el for
        
        #si no es mayor o igual hacemos los incrementos
        add x28, x28, x7 #hacemos suma += i
        addi x7, x7, 1 #aumentamos (i) de uno en uno

        jal x0, for #volvemos al ciclo

exitfor:    add x10, x0, x28 #x10 como retorno --> suma
            
            add x29, x0, x10 #x29 (resultado) le asignamos el valor del retorno de la funcion

            add x11, x0, x0 # return 0

main:   addi x5, x0, 10 # #x7 --> n = 10
        add x12, x0, x5 # #x12 como argumento --> x7 = n

        jal x0, sumatoria