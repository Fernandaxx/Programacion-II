
Program digitoMaxFunction;



Function DigitoMax (n:integer; max:integer): Integer;

Var 
  dig: integer;
Begin
  dig := n Mod 10;
  If (dig  > max) Then
    max := dig;
  If (n = 0) Then
    DigitoMax := max
  Else
    Begin
      DigitoMax := DigitoMax(n Div 10,max);
    End;
End;


//caso base: n = 0
// reduccion n div 10

Var 
  num,maximo: integer;
Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', DigitoMax(num,maximo));
  readln;
End.
