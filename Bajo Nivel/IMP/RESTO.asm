ORG 1000h
num1 DB 19
num2 DB 5

ORG 3000h
RESTO: MOV DL,0
CMP AL,0; si es 0 el dividendo
JZ FIN
LAZO: 
SUB AL,AH 
CMP AL,AH; si AH es mayor, AL va a ser el resto
JNS LAZO
FIN:RET

ORG 2000h
MOV AL,num1
MOV AH,num2
CALL RESTO
HLT
END