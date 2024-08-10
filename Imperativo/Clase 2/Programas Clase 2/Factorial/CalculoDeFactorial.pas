
Program CalculoDeFactorial;

Function factorial (x:integer): real;
Begin
  If (x <= 1) Then
    factorial := 1
  Else
    factorial := x* factorial(x-1);
End;

{PROGRAMA PRINCIPAL}

Var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num): 0: 2);
  readln;
End.
