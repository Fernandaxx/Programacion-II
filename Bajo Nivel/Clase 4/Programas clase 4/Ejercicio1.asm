ORG 1000H
numeroBinario DW 1000000010100101b
cantRotaciones DW 1

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


ORG 2000H
MOV AX, numeroBinario
MOV CX, cantRotaciones
CALL ROTARIZQ
HLT
END
