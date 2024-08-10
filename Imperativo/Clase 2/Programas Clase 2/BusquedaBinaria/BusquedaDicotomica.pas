
Program BusquedaDicotomica;

Const 
  dimF = 8;  {Dimensi�n f�sica del vector}

Type 

  vector = array [1..dimF] Of integer;

  dim = 0..dimF;






















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

Function BusquedaDicotomica (n:integer; vec:vector; i, f: dim): Integer;

Var 
  pos: dim;
Begin
  If (f < i ) Then
    BusquedaDicotomica := -1 // no encontro el elemento
  Else
    Begin
      pos := (i+f) Div 2;
      WriteLn(pos);
      If vec[pos] = n Then
        BusquedaDicotomica := pos
      Else
        If vec[pos] > n Then
          BusquedaDicotomica := BusquedaDicotomica(n,vec,i,pos-1)
      Else
        BusquedaDicotomica := BusquedaDicotomica(n,vec,pos+1,f);
    End;
End;




{PROGRAMA PRINCIPAL}

Var 
  v: vector;
  dimL : dim;
  n: Integer;
  indice: Integer;

Begin

  cargarVectorOrdenado(v,dimL);

  writeln('Nros almacenados: ');
  imprimirVector(v, dimL);
  WriteLn('ingrese el numero a buscar: ');
  ReadLn(n);
  indice := BusquedaDicotomica(n,v,1,diml);
  If indice <> -1 Then
    Write(n,' Esta en el vector en la posicion: ', indice)
  Else
    Write(n,' no esta en el vector');

  readln;
End.
