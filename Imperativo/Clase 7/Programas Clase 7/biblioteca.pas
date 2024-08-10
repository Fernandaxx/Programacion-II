
Program biblioteca;

Const 
  fin = 0;

Type 
  libro = Record
    titulo: string;
    ISBN: Integer;
    Clasificador: string;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: libro;
    HI: arbol;
    HD: arbol;
  End;

Procedure LeerLibro (Var l:libro);
Begin
  WriteLn('Ingrese ISBN:');
  ReadLn(l.ISBN);
  If (l.ISBN <> fin) Then
    Begin
      WriteLn('Ingrese titulo: ');
      ReadLn(l.titulo);
      WriteLn('Ingrese Clasificador Bibliografico:');
      ReadLn(l.Clasificador);
    End;
End;

Procedure InsertarArbol (Var a:arbol; e:libro);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := e;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.ISBN > e.ISBN) Then
        InsertarArbol(a^.HI,e)
      Else
        If (a^.dato.ISBN < e.ISBN) Then
          InsertarArbol(a^.HD,e)
    End;
End;


Procedure CrearArbol (Var a:arbol);

Var 
  l: libro;
Begin
  LeerLibro(l);
  While l.ISBN <> fin Do
    Begin
      InsertarArbol(a,l);
      LeerLibro(l);
    End;
End;









//BuscarEnArbol - busca un dato (integer) en el arbol y devuelve el puntero de su ubicacion o nil si no lo encontro}

Function Buscar(a:arbol; d:Integer): Boolean;
Begin
  If (a = Nil) Or (d = a^.dato)  Then
    buscar := False
  Else
    If (a^.dato.ISBN = d) Then
      Buscar := True
  Else
    Begin
      If (a^.dato.ISBN > d) Then
        Buscar := Buscar(a^.HI,d)
      Else
        Buscar := Buscar(a^.HD,d);
    End;
End;



Function existetitulo (a: arbol; c: String): boolean;
Begin
  If (a=Nil) Then
    existetitulo := false
  Else If (v=a^.dato.Clasificador) Then
         existetitulo := true
  Else
    Begin
      If Not (existetitulo(a^.HD,v)) Then existetitulo := existetitulo(a^.HI,v)
      Else existetitulo := true;
    End
End;

Procedure verMaxDesordenado(a: arbol; cod:String; Var cant:integer);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato.clasif = cod) Then
        Begin
          cant := cant+1;
        End;
      verMaxDesordenado(a^.HI, cod, cant);
      verMaxDesordenado(a^.HD, cod, cant);
    End;
End;


Program Ejercicio2;

Const 

  FIN = 0;

Type 

  libro = Record
    titulo: String;
    ISBN: integer;
    clasificador_bibliografico: String;
  End;

  arbol = ^nodoArbol;
  nodoArbol = Record
    dato: libro;
    HI: arbol;
    HD: arbol;
  End;

{-----------------------------------------}

Procedure leerlibro(Var lib:libro);
Begin
  writeln(' titulo: ');
  readln(lib.titulo);
  writeln(' ISBN: ');
  readln(lib.ISBN);
  writeln(' clasificador bibliografico: ');
  readln(lib.clasificador_bibliografico);
End;


Procedure insertar(Var a:arbol;lib:libro);

Var 
  nue: arbol;
Begin
  If (a=Nil)Then
    Begin
      new(nue);
      nue^.dato := lib;
      nue^.HD := Nil;
      nue^.HI := Nil;
      a := nue;
    End
  Else
    Begin
      If (a^.dato.ISBN>lib.ISBN)Then
        insertar(a^.HI,lib)
      Else
        If (a^.dato.ISBN<lib.ISBN)Then
          insertar(a^.HD,lib)
    End;
End;

Procedure CrearArbol(Var a:arbol);

Var 
  lib: libro;
Begin
  leerlibro(lib);
  While (lib.ISBN<>FIN) Do
    Begin
      insertar(a,lib);
      leerlibro(lib);
    End;
End;




{procedure existe(a:arbol;isbnX:integer;var b:boolean);
begin
  if (a=nil) then
    b := false
  else
  begin
    if (isbnX < a^.dato.ISBN) then
      existe(a^.HI,isbnX,b)
    else if (isbnX > a^.dato.ISBN) then
      existe(a^.HD,isbnX,b)
    else
        b:=true;
end;}

Function existe(a:arbol;isbnX:integer): boolean;
Begin
  If (a=Nil) Then
    existe := false
  Else
    Begin
      If (isbnX < a^.dato.ISBN) Then
        existe := existe(a^.HI,isbnX)
      Else If (isbnX > a^.dato.ISBN) Then
             existe := existe(a^.HD,isbnX)
      Else
        existe := true;
    End;
End;

Procedure cuantasveces(a:arbol;codX:String;Var c:integer);
Begin
  If (a<>Nil)Then
    Begin
      cuantasveces(a^.HI,codX,c);
      If (a^.dato.clasificador_bibliografico=codX) Then
        c := c+1;
      cuantasveces(a^.HD,codX,c);
    End;
End;



{procedure aparece(a:arbol; titX:String; var s:boolean);
begin
  if(a<>nil)and(s<>true) then begin
     aparece(a^.HI,titX,s);
     if(a^.dato.titulo=titX)then s:=true;
     aparece(a^.HD,titX,s);
  end;
end;}



{function apareceEnArbol(a: arbol; titX: String): Boolean;
var
  b: Boolean;
begin
  if (b<>true) then begin
  b := false;
  if (a <> nil) then begin
    apareceEnArbol(a^.HI, titX);
    if (a^.dato.titulo = titX) and not(b) then begin
      b := true;
    end;
    apareceEnArbol(a^.HD, titX);
  end;
  end;
  apareceEnArbol := b;
end;}


{------------------------------------------------------}

Var 
  a: arbol;
  isbnX: integer;
  b1,s: boolean;
  codX,titX: string;
  c: integer;
Begin
  a := Nil;
  s := false;
  crearArbol(a);


{writeln('escribir el isbn a buscar: '); read(isbnX);
  b1:=existe(a,isbnX);
    if(b1) then writeln('el codigo, ',isbnX,' existe')
    else writeln('el codigo, ',isbnX,' no existe');
  writeln('escribir el clasificador blbliografico a buscar: '); read(codX);
  cuantasveces(a,codX,c);
  writeln('el codigo ',codX,' aparece ',c,' veces');}
  writeln('escribir el titulo a buscar: ');
  readln(titX);
  While (titX<>'salir') Do
    Begin
      aparece(a,titX,s);
      If (s) Then writeln('el titulo, ',titX,' aparece')
      Else writeln('el titulo, ',titX,' no aparece');
      writeln('escribir el titulo a buscar: ');
      readln(titX);
      s := false;
    End;

  writeln('pulsa enter para finalizar');
  readln();
  readln();
End.
