
Program VectorOrdenado;

Const 
  dimF = 8;  {Dimensi�n f�sica del vector}

Type 

  vector = array [1..dimF] Of integer;

  dim = 0..dimF;

{ --------------------------- No salio :(  ---------------------------------- }

Function busquedaDicotomica (vec: vector; n,i,j:integer): boolean;

Var k: integer;
Begin

  k := (j+i) Div 2;
  If (vec[k]= n) Then
    Begin
      busquedaDicotomica := true;
      WriteLn('entre');
    End
  Else
    Begin
      If (k<>j) And (k<>i)Then
        Begin
          If (vec[k] < n) Then
            busquedaDicotomica := busquedaDicotomica(vec,n,k,j);
          If (vec[k] > n) Then
            busquedaDicotomica := busquedaDicotomica(vec,n,i,k);

        End
      Else busquedaDicotomica := false;

    End;
End;

















{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVectorOrdenado ( Var vec: vector; Var dimL: dim);

Var 
  d, pos, j: integer;
Begin
  Randomize;  { Inicializa la secuencia de random a partir de una semilla}
  dimL := 0;
  d := random(100);
  While (d <> 99)  And ( dimL < dimF ) Do
    Begin
      pos := 1;
      While (pos <= dimL) And (vec[pos]< d) Do
        pos := pos + 1;
      For  j:= dimL Downto pos Do
        vec[j+1] := vec[j] ;
      vec[pos] := d;
      dimL := dimL + 1;
      d := random(100)
    End;
End;
















{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( Var vec: vector; Var dimL: dim );

Var 
  i: dim;
Begin
  For i:= 1 To dimL Do
    Write ('-----');
  writeln;
  Write (' ');
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

{PROGRAMA PRINCIPAL}

Var 
  v: vector;
  dimL : dim;
  i,j,n: integer;
  ok: Boolean;
Begin
  i := 1;
  j := dimF;

  cargarVectorOrdenado(v,dimL);
  writeln('Nros almacenados: ');
  imprimirVector(v, dimL);
  WriteLn ('Ingrese el numero a buscar: ');
  ReadLn(n);
  If (busquedaDicotomica(v,n,i,j)) Then
    WriteLn('Se encontro ',n)
  Else WriteLn('No se encontro ',n);
  readln;
End.
