
Program CalculoDePotencia;


Function potencia (x,n: integer): real;
Begin
  If (n = 0) Then
    potencia := 1
  Else
    potencia := x * potencia(x,n-1)
End;

{PROGRAMA PRINCIPAL}

Var 
  n, x: integer;

Begin

  write ('Ingrese base: ');
  Readln (x);
  write ('Ingrese exponente: ');
  Readln (n);
  WriteLn(x,' elevado a la ', n, ' : ' , potencia(x,n): 0: 2);
  readln;
End.
