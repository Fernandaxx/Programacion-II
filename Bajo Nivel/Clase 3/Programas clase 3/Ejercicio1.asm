;Escribir un programa que calcule la suma de dos 
;números de 32 bits almacenados en la memoria del 
;microprocesador sin hacer llamados a subrutinas,
;resolviendo el problema desde el programa principal


;Sumar los 16 bits altos
;Sumar los 16 bits bajos (si hay acarreo, flag C=1)
;Validar la condición C=1 e incrementar los 16 bits altos

ORG 1000h 
NUM1_L DW 1100000000000000b
NUM1_H DW 0000000000000000b

NUM2_L DW 1000000000000000b
NUM2_H DW 0000000000000000b

RES_L DW 0
RES_H DW 0

ORG 2000h
MOV AX, NUM1_H
ADD AX, NUM2_H ; AX SUMA LA PARTE ALTA

MOV CX,NUM1_L
ADD CX,NUM2_L ; CX SUMA LA PARTE BAJA

MOV RES_L, CX
MOV RES_H, AX

ADC AX, 0 

HLT
END