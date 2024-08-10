
Program VectorMaxySuma;

Const 
  dimF = 8;  {Dimensi�n f�sica del vector}

Type 

  vector = array [1..dimF] Of LongInt;

  dim = 0..dimF;










{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( Var vec: vector; Var dimL: dim);

Var 
  d: integer;
Begin
  Randomize;  { Inicializa la secuencia de random a partir de una semilla}
  dimL := 0;
  d := random(100);
  While (d <> 99)  And ( dimL < dimF ) Do
    Begin
      dimL := dimL + 1;
      vec[dimL] := d;
      d := random(100);
    End;
End;











{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }
Procedure imprimirVector ( Var vec: vector; Var dimL: dim );

Var 
  i: dim;
Begin
  For i:= 1 To dimL Do
    write ('-----');
  writeln;
  write (' ');
  For i:= 1 To dimL Do
    Begin
      If (vec[i] < 9)Then
        write ('0');
      write(vec[i], ' | ');
    End;
  writeln;
  For i:= 1 To dimL Do
    write ('-----');
  writeln;
  writeln;
End;












{--------------------------------------------------------------------------
Maximo - Calcula el valor maximo de los elementos del vector}

Function max (n1,n2:Integer): Integer;
Begin
  If (n1 > n2) Then
    max := n1
  Else
    max := n2;
End;

Function Maximo (v:vector;i, diml: dim ): Integer;
Begin
  If (diml = i) Then // caso base
    Maximo := v[i]
  Else
    Maximo := max(v[i],Maximo(v,i+1,diml));
End;




{-----------------------------------------------------------
Suma - Calcula la suma de los elementos del vector}

Function Suma (v:vector; i,dimL:dim): Integer;
Begin
  If (i = diml) Then
    Suma := v[i]
  Else
    suma := v[i] + Suma(v, i+1, diml);
End;




{PROGRAMA PRINCIPAL}

Var 
  v: vector;
  dimL : dim;

Begin

  cargarVector(v,dimL);

  writeln('Nros almacenados: ');
  imprimirVector(v, dimL);
  WriteLn('maximo del vector: ', Maximo(v,1,diml));
  WriteLn('Suma de los elementos del vector: ',suma(v,1,diml));
  readln;
End.
