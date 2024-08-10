ORG 1000H
NUM DB 5


ORG 3000H 
FACTORIAL:; DEVUELVE EL NUMERO A MEMORIA (FUNCIONA SOLO HASTA EL FACTORIAL DE 5)
  PUSH AX
  PUSH BX
  PUSH CX
  PUSH DX
  MOV BX, AX ;En BX tengo la dir. del num
  MOV AL,[BX] ;En AL tengo el num. 
  MOV AH, AL ;Tengo en AH num. 
  MOV CL, AL ;iteraciones
  DEC AH
  MOV DL,0 ;

FOR: CMP CL,1
  JZ FIN_FOR
  CALL MUL
  DEC CL
  MOV AH,CL
  DEC AH
  MOV AL,DL
  MOV DL, 0
  JMP FOR


FIN_FOR: MOV [BX],AL 
  POP DX
  POP CX
  POP BX
  POP AX
  RET

MUL: ADD DL,AL
  DEC AH
  CMP AH,0
  JNZ MUL
  RET

ORG 2000H 
MOV AX,OFFSET NUM
CALL FACTORIAL
HLT
END