ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20
  FIN 	DB ?
  TOTAL 	DB 0
  MAX 	DB 11

ORG 2000H
       	MOV AL, 0
        MOV CL, OFFSET FIN - OFFSET TABLA 
      	MOV BX, OFFSET TABLA
  COMP:	MOV AL, [BX]                     
        	INC BX                           
        	DEC CL                        
        	CMP MAX, AL              
        	JS MINyEQ                   
        	CMP CL, 0
        	JZ FINAL                          
        	JMP COMP
MINyEQ: 	ADD TOTAL, 1
        	JMP COMP
FINAL: 	HLT
		END