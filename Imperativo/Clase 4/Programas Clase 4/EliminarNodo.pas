
Program EliminarNodo;

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
CREARLISTA - Genera una lista con n�meros aleatorios }
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
AGREGARATRAS - Agrega un elemento atr�s en l}

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
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

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

Procedure InsertarArbol (Var a:arbol; d:integer);

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
        InsertarArbol(a^.HI,d)
      Else
        If (a^.dato < d) Then
          InsertarArbol(a^.HD,d);
    End;
End;

//CrearArbol- Crea un arbol a partir de los datos de una lista

Procedure CrearArbol (Var a:arbol;l:lista);
Begin
  a := Nil;
  While (l <> Nil) Do
    Begin
      InsertarArbol(a,l^.dato);
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














{-----------------------------------------------------------------------
Devuelve el nodo minimo del arbol}
Function min (a:arbol): arbol;
Begin
  If (a = Nil) Then
    min := Nil
  Else
    If (a^.HI = Nil) Then
      min := a
  Else min := min(a^.HI)
End;




Procedure EliminarNodo (Var a:arbol; num:Integer; Var exito:Boolean);

Var 
  aux: arbol;
Begin
  If (a = Nil) Then exito := False
  Else
    Begin
      If (a^.dato > num) Then
        EliminarNodo(a^.HI,num,exito)
      Else
        If (a^.dato < num) Then
          EliminarNodo(a^.HD,num,exito)
      Else
        Begin
          exito := True;
          If (a^.HI = Nil) Then // solo tiene hijo derecho
            Begin
              aux := a;
              a := a^.HD;
              Dispose(aux);
            End
          Else
            If (a^.HD = Nil) Then // solo tiene hijo izq
              Begin
                aux := a;
                a := a^.HI;
                Dispose(aux);
              End
          Else  // tiene dos hijos
            Begin
              aux := min(a^.HD);
              a^.dato := aux^.dato;
              EliminarNodo(a^.HD,a^.dato,exito);
            End;
        End;
    End;
End;


Procedure BorrarArbol(Var a: arbol);
Begin
  If a <> Nil Then { Si queda algo que borrar }
    Begin
      BorrarArbol(a^.HI); { Borra la izqda recursivamente }
      dispose(a); { Libera lo que ocupaba el nodo }
      BorrarArbol(a^.HD); { Y luego va por la derecha }
    End;
End;


Var 

  l: lista;
  a: arbol;
  dato: Integer;
  exito: Boolean;

Begin
  Randomize;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  CrearArbol(a,l);
  WriteLn('ARBOL:');
  EnOrden(a);
  WriteLn();
  imprimirpornivel(a);
  WriteLn('inserte un dato a borrar:');
  ReadLn(dato);

  While (dato <> -1) Do
    Begin
      EliminarNodo(a,dato,exito);
      If exito Then
        WriteLn('Se borro el dato:', dato)
      Else WriteLn('No se encontro el elemento!');
      EnOrden(a);
      imprimirpornivel(a);
      WriteLn();
      WriteLn('inserte un dato a borrar:');
      ReadLn(dato);
    End;
  BorrarArbol(a);
End.
