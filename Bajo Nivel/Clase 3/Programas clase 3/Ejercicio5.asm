;Escriba la subrutina ES_VOCAL, que determina si un caracter 
;es vocal o no. La rutina debe recibir el caracter por valor,
;y debe retornar, vía registro, el valor 0FFH si el caracter es 
;una vocal, o 00H en caso contrario

               ORG 1000h
               vocales DB "AEIOUaeiou"
               fin_vocales DB ?
               char DB "a"


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


               ORG 2000h
               MOV AL, char
               CALL ES_VOCAL
               HLT
               END

