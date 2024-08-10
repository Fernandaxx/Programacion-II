
Program palindromo;
Const 
  LongMax = 50;

Type 
  letras = array [1..LongMax] Of char;

  palabra = Record
    p: letras;
    Long: 0..LongMax;
  End;




Procedure CargarVector (Var pal:palabra);

Var 
  letra: char;
Begin
  Writeln('letra: ');
  Readln(letra);
  pal.Long := 0;
  While  (letra <> ' ') And (pal.Long < LongMax) Do
    Begin
      pal.Long := pal.Long +1;
      pal.p[pal.Long] := letra;
      Writeln('letra: ');
      Readln(letra);
    End;
End;

Procedure Imprimir (pal:palabra);

Var 
  i: Integer;
Begin
  WriteLn('Palabra: ');
  For i:= 1 To pal.Long Do
    Write(pal.p[i]);
End;

Function Palindromo (p:letras; i,f:integer): Boolean;

Begin
  If  (i = f) Or (f < i) Then // una sola letra o se cruzan los indices
    Palindromo := true
  Else
    If (p[i] <> p[f]) Then // no es palindromo
      Palindromo := false
  Else
    Begin
      i := i+1;
      f := f-1;
      Palindromo := Palindromo(p,i,f);
    End;
End;


Function EsPalindromo (pal:palabra): Boolean;

Var 
  i,f: Integer;
Begin
  i := 1;
  f := pal.Long;
  EsPalindromo := Palindromo(pal.p,i,f);
End;

{------------------------------------------------------------------
Programa Principal}

Var 
  pal: palabra;


Begin
  CargarVector(pal);
  Imprimir(pal);
  WriteLn('');
  WriteLn('La palabra es palindromo?');
  If EsPalindromo(pal) Then
    WriteLn('si')
  Else writeln('no es')

End.
