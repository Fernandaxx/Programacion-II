;Escribir un programa que calcule la suma de dos números 
;de 32 bits almacenados en la memoria del microprocesador
;llamando a una subrutina SUM32, pasando los parámetros por
;referencia desde el programa principal a través de 
;registros.

ORG 1000h ;MEMORIA DE DATOS

NUM1_L DW ?
NUM1_H DW ?

NUM2_L DW ?
NUM2_H DW ?

RES_L DW 0
RES_H DW 0

ORG 3000h ; SUBRUTINA

SUM32: PUSH AX
       MOV AX, [BX]
       MOV BX, DX
       ADD AX,[BX]
       POP BX 
       MOV DX, [BX]
       MOV BX,CX
       ADC DX, [BX]   
       RET
      
ORG 2000h; PROGRAMA 
MOV AX, OFFSET NUM1_H
MOV BX, OFFSET NUM1_L

MOV CX,OFFSET NUM2_H
MOV DX,OFFSET NUM2_L

CALL SUM32

MOV RES_H, DX
MOV RES_L, AX

HLT
END  