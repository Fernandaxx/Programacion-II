
Program BusquedaAcotada;

Type 

  // Lista de enteros
  lista = ^nodoL;
  nodoL = Record
    dato: integer;
    sig: lista;
  End;

  // Arbol de enteros
  arbol = ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;















{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: Lista; nro: integer);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l := aux;
End;














{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con numeros aleatorios }
Procedure crearLista(Var l: Lista);

Var 
  n: integer;
Begin
  l := Nil;
  n := random (20);
  While (n <> 0) Do
    Begin
      agregarAdelante(L, n);
      n := random (20);
    End;
End;















{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      write(l^.dato, ' - ');
      l := l^.sig;
    End;
End;















{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

Function ContarElementos (l: listaNivel): integer;

Var c: integer;
Begin
  c := 0;
  While (l <> Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;
  contarElementos := c;
End;













{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atras en l}

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue: listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If l= Nil Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;














{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del Arbol a por niveles }

Procedure imprimirpornivel(a: arbol);

Var 
  l, aux, ult: listaNivel;
  nivel, cant, i: integer;
Begin
  l := Nil;
  If (a <> Nil)Then
    Begin
      nivel := 0;
      agregarAtras (l,ult,a);
      While (l<> Nil) Do
        Begin
          nivel := nivel + 1;
          cant := contarElementos(l);
          write ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              write (l^.info^.dato, ' - ');
              If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
              If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
              aux := l;
              l := l^.sig;
              dispose (aux);
            End;
          writeln;
        End;
    End;
End;

//InsertarNodo en un arbol binario


Procedure InsertarNodoA (Var a:arbol; d:integer);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := d;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato > d) Then
        InsertarNodoA(a^.HI,d)
      Else
        If (a^.dato < d) Then
          InsertarNodoA(a^.HD,d);
    End;
End;



//CrearArbol- Crea un arbol a partir de los datos de una lista

Procedure CrearArbol (Var a:arbol;l:lista);
Begin
  While (l <> Nil) Do
    Begin
      InsertarNodoA(a,l^.dato);
      l := l^.sig;
    End;
End;


Procedure EnOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      Write(a^.dato, ' ');
      EnOrden(a^.HD);
    End;
End;

// No poda el arbol
Procedure ImprimirAcotado (a:arbol;inf:Integer;sup:Integer);

Begin
  If (a <> Nil) Then
    Begin
      If ( a^.dato >= inf) And (a^.dato <= sup) Then
        WriteLn(a^.dato);
      ImprimirAcotado(a^.HI,inf,sup);
      ImprimirAcotado(a^.HD,inf,sup);
    End;
End;

Procedure BusquedaAcotada (a:arbol; inf:integer; sup:integer);

Begin
  If (a <> Nil) Then
    If (a^.dato >= inf) Then
      Begin
        If (a^.dato <= sup) Then
          Begin
            write(a^.dato, ' ');
            busquedaAcotada(a^.HI, inf, sup);
            busquedaAcotada (a^.HD, inf, sup);
          End
        Else
          busquedaAcotada(a^.HI, inf, sup);
        // poda el arbol derecho
      End
  Else
    busquedaAcotada(a^.HD, inf, sup);
  // poda el arbol izquierdo

End;


Var 

  l: lista;
  a: arbol;
  inf,sup: Integer;

Begin
  Randomize;

  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  CrearArbol(a,l);
  WriteLn();
  imprimirpornivel(a);
  EnOrden(a);
  WriteLn();
  WriteLn('inserte limites inf-sup');
  ReadLn(inf,sup);
  WriteLn('imprimir acotado');
  ImprimirAcotado(a,inf,sup);
  WriteLn('busqueda acotado');
  BusquedaAcotada(a,inf,sup);

  readln;
End.
