;sustituciones: si el caracter es “A”, debe sustituirlo por el caracter “@”, si el caracter es “E”
;debe sustituirlo por el numero “3”, si el caracter es “I”, debe cambiarlo por el caracter “!”, en cambio si el
;caracter es “O” debe cambiarlo por el número “0”, finalmente si el caracter “U” debe reemplazarlo por su
;minúscula, es decir, el caracter “u”.

;: la letra “A” es el 41H, “E” es el 45H, “I” es el 49H, “O” es el 4FH y “U” es el 55H, mientras que la
;letra “u” es 75H, por su parte el “@” es 40H, el “!” es 21H y los números están en el rango 30H..39H.

ORG 1000h
CHAR DB "I"
vocales DB "AEIOU"
fin_vocales DB ?

ORG 3000h

ENCRYPT: 
PUSH BX 
PUSH AX
MOV BX,SP
ADD BX,6 ; POS DIR DE CHAR
MOV BX, [BX] ; DIRECCION DE CHAR
MOV AL,[BX]; COPIO VALOR DE CHAR
CMP AL,41H
JZ SIGOA
CMP AL,45H
JZ SIGOE
CMP AL,49H
JZ SIGOI
CMP AL,4FH
JZ SIGOO
CMP AL,55H
JZ SIGOU

SIGOA: MOV BYTE PTR[BX],40H; SI ES A --> @
JMP FIN
SIGOE: MOV BYTE PTR[BX],03H ;SI ES E --> 3
JMP FIN
SIGOI: MOV BYTE PTR[BX],21H ;SI ES I --> !
JMP FIN
SIGOO: MOV BYTE PTR[BX],00H;SI ES O --> 0
JMP FIN
SIGOU: MOV BYTE PTR[BX],75H;SI ES U --> u
JMP FIN

FIN: 
POP AX
POP BX
RET


; Caracter en AL
; Si es vocal, AH=FFh; de lo contrario, AH=00h
ES_VOCAL: 
PUSH BX
PUSH AX
PUSH CX
PUSH DX
MOV BX,AX
MOV AL,[BX]
MOV BX, OFFSET vocales - 1 ;disminuye para poder comparar el primer caracter
MOV AH, 00h              
ES_VOCAL_LOOP:
INC BX
CMP BX, OFFSET fin_vocales
JZ ES_VOCAL_FIN
CMP AL, [BX]
JNZ ES_VOCAL_LOOP
MOV AH, 0FFh
ES_VOCAL_FIN: 
POP DX
POP CX
POP AX
POP BX
RET


ORG 2000h


MOV AX, OFFSET CHAR
CALL ES_VOCAL
CMP AL,0FFh
JZ SIGO
JMP FIN2
SIGO:PUSH AX
CALL ENCRYPT 
POP AX

FIN2: HLT
END
