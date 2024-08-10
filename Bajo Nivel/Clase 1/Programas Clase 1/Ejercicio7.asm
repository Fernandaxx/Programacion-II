;Realice un programa en Assembler que permita realizar
;la suma de todos los valores de una tabla.
;Almacene el resultado en memoria principal.

ORG 1000h
tabla DB 01h, 02h, 03h, 04h
DIM EQU 4 ; dimension de la tabla
res DW 0000h ; Resultado

ORG 2000h
MOV BX, OFFSET tabla ; actua como pointer al elemento a sumar de la tabla
MOV AL, 0; Indice
MOV CL, 0; Suma

sumar: ADD CL, [BX]
INC BX
INC AL

CMP AL, DIM
JNZ sumar

mov res, CX ; guardar resultado
hlt
end

