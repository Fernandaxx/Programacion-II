
Program Colaborativa1;

Const 
  fin = 'Fin';

Type 

  destino = Record
    nombre: string;
    distancia: integer;
    pasajes: Integer;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: destino;
    HI: arbol;
    HD: arbol;

  End;




Procedure LeerDestino (Var d:destino);
Begin
  WriteLn('Nombre del destino:');
  ReadLn(d.nombre);
  If d.nombre <> fin Then
    Begin
      WriteLn('Distancia en kilometros:');
      ReadLn(d.distancia);
      WriteLn('Cantidad de pasajes vendidos:');
      ReadLn(d.pasajes);
    End;
End;


Procedure Insertar (Var a:arbol; d:destino);

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
      If (a^.dato.nombre > d.nombre) Then
        Insertar(a^.HI,d)
      Else
        If (a^.dato.nombre < d.nombre) Then
          Insertar(a^.HD,d)
    End;
End;


Procedure CargarDestino(Var a:arbol);

Var 
  d: destino;
Begin
  LeerDestino(d);
  Insertar(a,d);
End;


Procedure ImprimirDatos (d:destino);
Begin
  WriteLn('Nombre del destino: ', d.nombre);
  WriteLn('Distancia en kilometros: ', d.distancia);
  WriteLn('Pasajes vendidos: ', d.pasajes);
End;


Procedure ImprimirArbol (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      ImprimirArbol(a^.HI);
      ImprimirDatos(a^.dato);
      ImprimirArbol(a^.HD);
    End;
End;



Function Buscar(a:arbol;nom:String): arbol;
Begin
  If (a = Nil) Or (nom = a^.dato.nombre)  Then
    buscar := a
  Else
    Begin
      If (a^.dato.nombre > nom) Then
        Buscar := Buscar(a^.HI,nom)
      Else
        Buscar := Buscar(a^.HD,nom);
    End;
End;


Procedure BuscarDestino (a:arbol);

Var 
  nom: String;
  b: arbol;
Begin
  WriteLn('Ingrese un destino a buscar: ');
  ReadLn(nom);
  b := Buscar(a,nom);
  If (b <> Nil ) Then
    ImprimirDatos(b^.dato)
  Else WriteLn('No se encontro el destino');
End;


Procedure DistanciaMin (a:arbol; Var min:integer; Var d:destino);
Begin
  If (a <> Nil) Then
    Begin
      DistanciaMin(a^.HI,min,d);
      If (a^.dato.distancia < min) Then
        Begin
          min := a^.dato.distancia;
          d := a^.dato;
        End;
      DistanciaMin(a^.HD,min,d);
    End;
End;

Procedure DestinoCercano (a:arbol);

Var 
  min: Integer;
  d: destino;
Begin
  min := 999999;
  DistanciaMin(a,min,d);
  WriteLn('Destino mas cercano:');
  ImprimirDatos(d);
End;

Procedure Sumar (Var a:arbol; nom:String; X:Integer; Var exito:Boolean);

Var 
  dest: arbol;
Begin
  exito := False;
  dest := Buscar(a,nom);
  If (dest <> Nil) Then
    Begin
      dest^.dato.pasajes := dest^.dato.pasajes + X;
      exito := True;
    End;
End;


Procedure SumarPasajes (a:arbol);

Var 
  nom: string;
  X: integer;
  exito: Boolean;
Begin
  writeln('Inserte el nombre del destino a sumarle pasajes:');
  readln(nom);
  writeln('Inserte la cantidad de pasajes a agregar:');
  readln(X);
  Sumar(a,nom,X,exito);
  If Not exito Then
    WriteLn('ERROR');
End;

Procedure Inicializar (Var a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      Inicializar(a^.HI);
      Inicializar(a^.HD);
      Dispose(a);
    End;
  a := Nil;
  WriteLn('Estructuras inicializadas!')
End;


Var 
  a: arbol;
  n: Integer;

Begin
  n := 9;
  While n <> 0 Do
    Begin
      writeln();
      writeln('Menu');
      writeln('  1. Inicializar estructuras ');
      writeln('  2. Cargar un destino');
      writeln('  3. Imprimir Info');
      writeln('  4. Buscar un destino y mostrar Info');
      writeln('  5. Buscar e informar destino mas cercano');
      writeln('  6. Sumar pasajeros');
      writeln('  0. Finalizar el programa');
      readln(n);
      Case n Of 
        1: Inicializar(a);
        2: CargarDestino(a);
        3: ImprimirArbol(a);
        4: BuscarDestino(a);
        5: DestinoCercano(a);
        6: SumarPasajes(a);
      End;
    End;
End.
