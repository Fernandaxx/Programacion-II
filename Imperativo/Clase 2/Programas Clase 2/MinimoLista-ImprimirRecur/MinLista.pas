
Program MinLista;

Type 
  Lista = ^Nodo;
  Nodo = Record
    Datos: integer;
    Sig: Lista;
  End;

Var 
  L: Lista;
  n: integer;


Procedure AgregarAdelante (Var L:lista; num:integer);

Var nue: Lista;
Begin
  New(nue);
  nue^.datos := num;
  nue^.sig := L;
  L := nue;
End;


Procedure Imprimir (pri:lista);
Begin
  While (pri <> Nil) Do
    Begin
      write (pri^.datos, '|');
      pri := pri^.sig
    End;
  writeln;
End;



















{---------------------------------------------------------------------
Minimo - módulo recursivo Mínimo que devuelve el mínimo valor de la lista}
Function min (n1, n2:integer): Integer;
Begin
  If n1 < n2 Then
    min := n1
  Else
    min := n2;
End;


Function Minimo (l:Lista): Integer;
Begin
  If (l^.Sig = Nil) Then
    Minimo := l^.Datos
  Else
    Minimo := min(l^.Datos, Minimo(l^.Sig));
End;


{-------------------------------------------------------------------------
Imprime recursivo- }
Procedure ImprimirRecursivo ( l:lista);
Begin
  write(l^.Datos, ' ');
  If (l^.Sig <> Nil) Then
    ImprimirRecursivo(l^.sig);
End;

Begin
  L := Nil;
  randomize;
  n := random (100);
  While (n<>0) Do
    Begin
      AgregarAdelante (L, n);
      n := random (100);
    End;
  writeln ('Lista generada: ');
  imprimir (L);
  Writeln ('minimo de la lista: ',Minimo(L)) ;
  ImprimirRecursivo(l);
  readln
End.
