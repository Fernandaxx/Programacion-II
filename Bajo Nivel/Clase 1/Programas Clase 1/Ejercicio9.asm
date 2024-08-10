;Escriba un programa que sume los valores en DB de las 
;posiciones de 2 tablas de igual tamaño y almacene los 
;resultados en una tercera tabla en memoria.

ORG 1000h
tabla1 DB 1,2,3
tabla2 DB 3,2,1
result DB 0,0,0
DIM EQU 3

ORG 2000h

MOV AX, 0; indice
suma:
MOV BX, OFFSET tabla1 
ADD BX,AX
MOV DL , [BX]
MOV BX , OFFSET tabla2
ADD BX,AX
ADD DL, [BX]
MOV BX, OFFSET result
ADD BX, AX
MOV [BX],DL
INC AX

CMP AX,DIM
JNZ suma

HLT
END