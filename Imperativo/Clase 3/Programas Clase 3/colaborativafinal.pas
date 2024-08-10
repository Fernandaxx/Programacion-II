
Program Colaborativa;

Const 
  fin = 0000;

Type 

  Ventas = Record
    cod: Integer;
    cant: Integer;
    fecha: string;
    numCli: Integer;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    cod: integer;
    total: Integer;
    HI: Arbol;
    HD: Arbol;
  End;




Procedure InsertarArbol (Var a:arbol; v:Ventas);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.cod := v.cod;
      a^.total := v.cant;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.cod > v.cod) Then
        InsertarArbol(a^.HI,v)
      Else
        If (a^.cod < v.cod) Then
          InsertarArbol(a^.HD,v)
      Else a^.total := a^.total + v.cant;
    End;
End;




Procedure CargaVenta (Var v:Ventas; Var a:arbol);

Var 
  Num: Integer;
Begin
  WriteLn('Ingrese numero de cliente:');
  ReadLn(num);
  If (num <> fin) Then
    Begin
      v.numCli := num;
      WriteLn('Ingrese codigo de pasta: ');
      ReadLn(v.cod);
      writeln('Ingrese cantidad vendida: ');
      ReadLn(v.cant);
      WriteLn('Ingrese fecha:');
      ReadLn(v.fecha);
      InsertarArbol(a,v);
    End;
End;


//Recorrido EN-Orden // izq-lee-der


Procedure EnOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      Write ('Codigo de pasta: ');
      Writeln(a^.cod, ' ');
      Write('Cantidad total vendida: ');
      Writeln(a^.total, ' ');
      WriteLn();
      EnOrden(a^.HD);
    End;
End;

Procedure Mayores10 (a:Arbol);
Begin
  If (a <> Nil) Then
    Begin
      Mayores10(a^.HI);
      If (a^.total > 10) Then
        Writeln('codigo que vendio mas de 10 kilos: ' ,a^.cod, ' ');
      WriteLn(' ');
      Mayores10(a^.HD);
    End;
End;























{-----------------------------------------------------------------------------
POST-ORDEN - Recorrido que permite desplazarse a través de todos los nodos del árbol }

Procedure postOrden(a:arbol; Var kilosMin: Integer;Var codmin:integer);
Begin
  If (a <> Nil) Then
    Begin
      postOrden(a^.HI,kilosMin,codmin);
      postOrden(a^.HD,kilosMin,codmin);
      If (a^.total < kilosMin) Then
        Begin
          kilosMin := a^.total;
          codmin := a^.cod;
        End;
    End;
End;

Procedure Minimo(a:arbol);

Var 
  codmin: integer;
  kilosMin: Integer;
Begin
  kilosMin := 999;
  codmin := 0000;
  postOrden(a,kilosMin,codmin);
  writeln('Codigo de pasta menos vendido: ', codmin);
  WriteLn(' ');
End;



{Programa Principal}

Var 
  a: Arbol;
  v: Ventas;
  n: Integer;

Begin
  n := 9;

  While (n <> -1) Do
    Begin
      WriteLn('1: inicializar:');
      WriteLn('2: Leer venta:');
      WriteLn('3: Imprimir datos:');
      WriteLn('4: codigo de pasta menos vendido');
      WriteLn('5: Codigos que vendieron mas de 10 kg');
      WriteLn();
      WriteLn('Ingrese un numero para avanzar:');
      ReadLn(n);
      Case n Of 
        1: a := Nil;
        2: CargaVenta(v,a);
        3: EnOrden(a);
        4: Minimo(a);
        5: Mayores10(a);
      End;
    End;
  WriteLn('Fin del programa :)');
End.
