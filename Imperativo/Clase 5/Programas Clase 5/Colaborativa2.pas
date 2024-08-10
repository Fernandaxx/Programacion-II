
Program Colaborativa2;

Type 

  paciente = Record
    Dni: LongInt;
    CodPostal: Integer;
    Ciudad: string;
  End;

  Arbol = ^nodoA;
  nodoA = Record
    dato: paciente;
    TotalInfectados: integer;
    HI: Arbol;
    HD: Arbol;
  End;



Procedure InsertarArbol (Var a:arbol; p:paciente);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := p;
      a^.TotalInfectados := 1;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.CodPostal > p.CodPostal) Then
        InsertarArbol(a^.HI,p)
      Else
        If (a^.dato.CodPostal < p.CodPostal) Then
          InsertarArbol(a^.HD,p)
      Else  // es igual
        a^.TotalInfectados := a^.TotalInfectados + 1;
    End;
End;


Procedure leerpaciente (Var P:paciente);
Begin
  WriteLn('Dni ');
  ReadLn(p.Dni);
  If (p.Dni <> -1) Then
    Begin
      WriteLn('Codigo postal ');
      ReadLn(p.CodPostal);
      WriteLn('Ciudad ');
      ReadLn(p.Ciudad);
    End;
End;

Procedure cargarArbol (Var a:Arbol);

Var 
  p: paciente;
Begin
  leerpaciente(p);
  While (p.Dni <> -1) Do
    Begin
      InsertarArbol(a,p);
      leerpaciente(p);
    End;
End;
