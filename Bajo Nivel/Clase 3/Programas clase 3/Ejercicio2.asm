;Escribir un programa que calcule la suma de dos 
;números de 32 bits almacenados en la memoria del 
;microprocesador llamando a una subrutina SUM32 para efectuar
;la operación, pasando los parámetros por valor desde el 
;programa principal a través de registros.

ORG 1000h ;MEMORIA DE DATOS

NUM1_L DW 1100000000000000b
NUM1_H DW 0000000000000000b

NUM2_L DW 1000000000000000b
NUM2_H DW 0000000000000000b

RES_L DW 0
RES_H DW 0

ORG 3000h ; SUBRUTINA

SUM32: ADD AX,CX
       ADC BX,DX
       RET
      
ORG 2000h; PROGRAMA 
MOV AX, NUM1_L
MOV BX, NUM1_H

MOV CX, NUM2_L
MOV DX, NUM2_H

CALL SUM32
MOV RES_L, AX
MOV RES_H, BX

HLT
END  