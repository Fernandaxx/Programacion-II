;Escriba la subrutina RESTO que calcule el resto de la 
;división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina
;a través de registros.

ORG 1000h
NUM1 DB 20; numerador
NUM2 DB 3 ; denominador
RESULT DB 0

ORG 3000h

RESTO: 
       CMP AL,CL
       JS FIN 
       SUB AL,CL
       JMP RESTO
FIN: RET
      
ORG 2000h

MOV AL, NUM1
MOV CL, NUM2
CALL RESTO
MOV RESULT, AL
HLT
END