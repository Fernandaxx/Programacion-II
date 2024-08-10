;Escribir una subrutina CONCAR que cuente el
;número de caracteres de una cadena de caracteres 
;terminada en “%” almacenada en memoria. 
;La cadena se pasa a la subrutina por referencia vía
;registro


                  ORG 1000h
                  cadena DB "Increible%uwu"

                  ORG 3000h
                  ; Referencia en BX
                  ; Resultado en AX
          CONCAR: MOV AX, 0
     CONCAR_LOOP: CMP BYTE PTR [BX], 25h ; % en ASCII
                  JZ CONCAR_FIN
                  INC AX
                  INC BX
                  JMP CONCAR_LOOP
      CONCAR_FIN: RET

                  ORG 2000h
                  MOV BX, OFFSET cadena
                  CALL CONCAR
                  HLT
                  END
