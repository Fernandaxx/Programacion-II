ORG 2000h
  MOV AL,10
  MOV CL,1
  MOV CH,10

  CMP CH,CL
  JNS for

for: INC CL
  ADD AL,AL
  HLT   END         