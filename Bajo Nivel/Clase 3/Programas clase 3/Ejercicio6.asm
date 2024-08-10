;Usando la subrutina anterior escribir la subrutina VOCALES,
;que recibe una cadena por referencia, y devuelve, en un registro,
; la cantidad de vocales que tiene esa cadena

               ORG 1000h
               vocales DB "AEIOUaeiou"
               fin_vocales DB ?
               cadena DB "camionA"
               fin_cadena DB ?


               ORG 3000h
               ; Caracter en AL
               ; Si es vocal, AH=FFh; de lo contrario, AH=00h
ES_VOCAL:      MOV BX, OFFSET vocales - 1 ;disminuye para poder comparar el primer caracter
               MOV AH, 00h              
ES_VOCAL_LOOP: INC BX
               CMP BX, OFFSET fin_vocales
               JZ ES_VOCAL_FIN
               CMP AL, [BX]
               JNZ ES_VOCAL_LOOP
               MOV AH, 0FFh
ES_VOCAL_FIN:  RET

              ; BX es la referencia a la cadena
              ; CX es la longitud de la cadena
              ; DX almacena la cantidad de vocales
CANT_VOCALES: 
              MOV DX,0
CANT_VOCALES_LOOP: 
             DEC  CX
             JS CANT_VOCALES_FIN
             MOV AL, [BX]
             PUSH BX 
             CALL ES_VOCAL
             POP BX
             INC BX
             CMP AH,0 
             JZ CANT_VOCALES_LOOP
             INC DX
             JMP CANT_VOCALES_LOOP
CANT_VOCALES_FIN: RET 

             
               ORG 2000h
               MOV BX, OFFSET cadena
               MOV CX, OFFSET fin_cadena - OFFSET cadena
               CALL CANT_VOCALES
               HLT
               END
