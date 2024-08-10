
Program encomiendas;

Type 

  encomienda = Record
    codigo: integer;
    peso: integer;
  End;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = Record
    dato: encomienda;
    sig: lista;
  End;

  listaPeso = ^nodoLp;
  nodoLp = Record
    cod: Integer;
    sig: listaPeso;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    peso: Integer;
    lp: listaPeso;
    HI: Arbol;
    HD: Arbol;
  End;













{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
Procedure agregarAdelante(Var l: Lista; enc: encomienda);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l := aux;
End;








{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
Procedure crearLista(Var l: Lista);

Var 
  e: encomienda;
  i: integer;
Begin
  l := Nil;
  For i:= 1 To 20 Do
    Begin
      e.codigo := i;
      e.peso := random (10);
      While (e.peso = 0) Do
        e.peso := random (10);
      agregarAdelante(L, e);
    End;
End;









{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
      l := l^.sig;
    End;
End;




Procedure AgregarLista(Var l: listaPeso; cod:Integer);

Var 
  aux: listaPeso;
Begin
  new(aux);
  aux^.cod := cod;
  aux^.sig := l;
  l := aux;
End;

//InsertarNodo en un arbol binario con lista de datos que se repiten del principal
Procedure InsertarArbol (Var a:arbol; e:encomienda);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.peso := e.peso;
      a^.lp := Nil;
      AgregarLista(a^.lp,e.codigo);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.peso > e.peso) Then
        InsertarArbol(a^.HI,e)
      Else
        If (a^.peso< e.peso) Then
          InsertarArbol(a^.HD,e)
      Else  // es igual
        AgregarLista(a^.lp,e.codigo);
    End;
End;

//CrearArbol- Crea un arbol a partir de los datos de una lista

Procedure CrearArbol (Var a:arbol;l:lista);
Begin
  While (l <> Nil) Do
    Begin
      InsertarArbol(a,l^.dato);
      l := l^.sig;
    End;
End;


//imprime la lista interna al arbol

Procedure ImprimirDatos (l:listaPeso);
Begin
  Write('  Codigos: ');
  While (l <> Nil) Do
    Begin
      Write (' | ', l^.cod);
      l := l^.sig;
    End;
End;

Procedure Imprimir (a:Arbol);
Begin
  If (a <> Nil) Then
    Begin
      Imprimir(a^.HI);
      Write('Peso: ', a^.peso);
      ImprimirDatos(a^.lp);
      WriteLn;
      Imprimir(a^.HD);
    End;
End;

Var 

  l: lista;
  a: Arbol;

Begin
  Randomize;

  crearLista(l);
  writeln ('Lista de encomiendas generada: ');
  imprimirLista(l);

  a := Nil;
  CrearArbol(a,l);
  Imprimir(a);
  readln;
End.
