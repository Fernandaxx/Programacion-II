;Usando la subrutina ROTARIZQ del ejercicio 1, 
;escriba una subrutina ROTARDER que haga una rotación
;hacia la derecha de un byte almacenado en la memoria 
;del microprocesador. Dicho byte y el número de posiciones
;a rotar deben pasarse por valor desde el programa principal
;a la subrutina a través de registros.

ORG 1000H
numeroBinario DW 1000000010100101b
cantRotaciones DW 3


ORG 3000H

               ; AX almacena numero binario a rotar
               ; CX almacena la cantidad de rotaciones
     ROTARIZQ: DEC CX
               JS ROTARIZQ_FIN
               ADD AX,AX
               JNC ROTARIZQ
               INC AX
               JMP ROTARIZQ
 ROTARIZQ_FIN: RET


               ; AX almacena numero binario a rotar
               ; CX almacena la cantidad de rotaciones
     ROTARDER: SUB CX, 16
               NEG CX
               JMP ROTARIZQ
               RET



ORG 2000H
MOV AX, numeroBinario
MOV CX, cantRotaciones
CALL ROTARDER
HLT
END
