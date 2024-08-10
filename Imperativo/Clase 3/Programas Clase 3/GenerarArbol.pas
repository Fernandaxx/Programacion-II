
Program GenerarArbol;

Type 

  // Lista de enteros
  lista =   ^nodoL;
  nodoL =   Record
    dato:   integer;
    sig:   lista;
  End;

  // Arbol de enteros
  arbol =   ^nodoA;
  nodoA =   Record
    dato:   integer;
    HI:   arbol;
    HD:   arbol;
  End;

  // Lista de Arboles
  listaNivel =   ^nodoN;
  nodoN =   Record
    info:   arbol;
    sig:   listaNivel;
  End;


  //AgregarAdelante - Agrega nro adelante de l

Procedure agregarAdelante(Var l: Lista; nro: integer);

Var 
  aux:   lista;
Begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l := aux;
End;


//CREARLISTA - Genera una lista con numeros aleatorios 
Procedure crearLista(Var l: Lista);

Var 
  n:   integer;
Begin
  l := Nil;
  n := random (20);
  While (n <> 0) Do
    Begin
      agregarAdelante(L, n);
      n := random (20);
    End;
End;


//IMPRIMIRLISTA - Muestra en pantalla la lista l 
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      write(l^.dato, ' - ');
      l := l^.sig;
    End;
End;



//CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l 

Function ContarElementos (l: listaNivel): integer;

Var 
  c: integer;
Begin
  c := 0;
  While (l <> Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;
  contarElementos := c;
End;



//AGREGARATRAS - Agrega un elemento atras en l

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var 
  nue:  listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If l= Nil Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;



//IMPRIMIRPORNIVEL - Muestra los datos del Arbol a por niveles 

Procedure imprimirpornivel(a: arbol);

Var 
  l, aux, ult:   listaNivel;
  nivel, cant, i:   integer;
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
              If (l^.info^.HI <> Nil) Then
                agregarAtras (l,ult,l^.nfo^.HI);
              If (l^.info^.HD <> Nil) Then
                agregarAtras (l,ult,l^. info^.HD);
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


//Recorrido PRE-Orden // lee-izq-der

Procedure PreOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      Write(a^.dato, ' ');
      PreOrden(a^.HI);
      PreOrden(a^.HD);
    End;
End;



//Recorrido EN-Orden // izq-lee-der


Procedure EnOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      Write(a^.dato, ' ');
      EnOrden(a^.HD);
    End;
End;


//Recorrido POST-Orden  // izq-der-lee


Procedure PostOrden (a:arbol);

Begin
  If (a <> Nil) Then
    Begin
      PostOrden(a^.HI);
      PostOrden(a^.HD);
      Write(a^.dato,' ');
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





//BuscarEnArbol - busca un dato (integer) en el arbol y devuelve el puntero de su ubicacion o nil si no lo encontro}

Function Buscar(a:arbol;d:Integer):   arbol;
Begin
  If (a = Nil) Or (d = a^.dato)  Then
    buscar := a
  Else
    Begin
      If (a^.dato > d) Then
        Buscar := Buscar(a^.HI,d)
      Else
        Buscar := Buscar(a^.HD,d);
    End;
End;



//DatoAbuscar - busca datos hasta que se ingresa el numero 0}

Procedure BuscarDato (a:arbol);

Var 
  n:   Integer;
Begin
  WriteLn('Inserte el dato a buscar en el arbol: ');
  Read(n);
  While (n <> 0) Do
    Begin
      If (Buscar(a,n) <> Nil) Then
        Writeln('se encontro el dato!')
      Else
        WriteLn('No se encontro el dato!');
      WriteLn('Inserte el dato a buscar en el arbol: ');
      Read(n);
    End;
End;



//MinArbol- recibe un árbol y devuelva el valor mínimo. si el árbol es vacío, retornar -1.


Function VerMin (a:arbol):   Integer;
Begin
  If (a=Nil) Then
    VerMin := -1
  Else
    Begin
      If (a^.HI <> Nil) Then
        VerMin := VerMin(a^.HI)
      Else
        VerMin := a^.dato;
    End;
End;



//MaxArbol- recibe un árbol y devuelva el valor maximo. si el árbol es vacío, retornar -1


Function VerMax (a:arbol):   Integer;
Begin
  If (a=Nil) Then
    VerMax := -1
  Else
    Begin
      If (a^.HD <> Nil) Then
        VerMax := VerMax(a^.HD)
      Else
        VerMax := a^.dato;
    End;
End;


//-------------------PROGRAMA PRINCIPA-------------------


Var 

  l:   lista;
  a:   arbol;

Begin
  Randomize;

  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  Writeln;
  CrearArbol(a,l);
  imprimirpornivel(a);

  PreOrden(a);
  WriteLn;

  EnOrden(a);
  WriteLn;

  PostOrden(a);
  WriteLn;

  BuscarDato(a);
  WriteLn;

  WriteLn('minimo del arbol:', VerMin(a));
  WriteLn('maximo del arbol:', VerMax(a));
  ReadLn;
End.
