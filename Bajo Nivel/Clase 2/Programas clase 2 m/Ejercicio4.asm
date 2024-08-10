;Escriba un programa en lenguaje Assembly que permita sumar dos operandos 
;de tipo DW. Si la suma da como resultado el valor 100,
;se termina el programa. En cambio, si la suma da como
;resultado un valor mayor a 100 se debe ir decrementando 
;en 1 el resultado hasta poder terminar. 
;(Se termina cuando el número llega a 100).


ORG 1000h
NUM1 DW 100
NUM2 DW 50
VALOR EQU 100

ORG 2000h

MOV AX ,NUM1
ADD AX,NUM2

WHILE: 
CMP AX,VALOR
JZ FIN
JS INCREMENTAR
JMP DECREMENTAR

INCREMENTAR: INC AX 
             JMP WHILE
             
DECREMENTAR: DEC AX
             JMP WHILE
FIN: HLT    
END