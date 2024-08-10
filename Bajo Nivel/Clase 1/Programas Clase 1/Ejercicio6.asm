ORG 1000H
	INI DB 0
	FIN DB 15

	ORG 2000H
	MOV AL, INI
	ADD AH, FIN
SUMA:  INC AL
	CMP AL, AH
	JMP SUMA
	HLT
	END
;JNZ salta si el ultimo valor calculado no es cero
;JS salta si el ultimo valor calculado es negativo
;JMP salto incondicional a la etiqueta