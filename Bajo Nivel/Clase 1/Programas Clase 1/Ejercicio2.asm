; definicion de variables
; nombreVariable - especificador_tipo  - valorInicial
; Especificador DB --> Byte --> 8bits
;Especificador DW --> Word --> 16bits --> se utilizan dos posiciones de memoria 2bytes
ORG 1000 ; origen, donde empieza la memoria de dato, las direcciones de memoria
var1 DW 0001
ORG 2000 ;origen de la memoria de instrucciones 
MOV AX,var1 ; copia el contenido de var1 a AX
end
