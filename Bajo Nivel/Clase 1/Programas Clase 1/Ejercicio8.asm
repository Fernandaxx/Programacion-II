;Realice un programa en Assembler que permita realizar
;la suma de todos los valores de una tabla.
;Almacene el resultado en memoria principal.

ORG 1000h
tabla DB 1,2,3,4,5
DIM EQU 5; dimension de la tabla 
Result DW 0; resultado

ORG 2000h
MOV BX , OFFSET tabla ; Puntero al elemento a sumar
MOV AL,0; indice 
Mov CX,0
sumar: ADD CL, [BX]
INC BX
INC AL

CMP AL, DIM
JNZ sumar 
mov Result, CX; guarda resultado
HLT
END

