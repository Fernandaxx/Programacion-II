
Program ejercicioClase4;

Const 
  fin = 'ZZZ';

Type 

  tnombre = String[50];

  alumno = Record
    nombre : tnombre;
    apellido: tnombre;
    dni: LongInt;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: alumno;
    HI: arbol;
    HD: arbol;
  End;


Procedure LeerAlumno (Var d:alumno);
Begin
  WriteLn('Nombre del Alumno:');
  ReadLn(d.nombre);
  If d.nombre <> fin Then
    Begin
      WriteLn('Apellido del Alumno:');
      ReadLn(d.apellido);
      WriteLn('Dni del Alumno');
      ReadLn(d.dni);
    End;
End;


//InsertarNodo en un arbol binario

Procedure InsertarArbol (Var a:arbol; d:alumno);

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
      If (a^.dato.dni > d.dni) Then
        InsertarArbol(a^.HI,d)
      Else
        If (a^.dato.dni < d.dni) Then
          InsertarArbol(a^.HD,d);
    End;
End;

Procedure CargarArbol (Var a:arbol);

Var 
  d: alumno;
Begin
  LeerAlumno(d);
  While (d.nombre <> fin) Do
    Begin
      InsertarArbol(a,d);
      LeerAlumno(d);
    End;
End;

Procedure BorrarArbol(Var a: arbol);
Begin
  If a <> Nil Then { Si queda algo que borrar }
    Begin
      BorrarArbol(a^.HI); { Borra la izqda recursivamente }
      dispose(a); { Libera lo que ocupaba el nodo }
      BorrarArbol(a^.HD); { Y luego va por la derecha }
    End;
End;

Procedure ImprimirDato (d:alumno);
Begin
  WriteLn('Nombre: ', d.nombre, ' Apellido: ', d.apellido, ' Dni: ', d.dni);
End;

Procedure Imprimir (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      Imprimir(a^.HI);
      ImprimirDato(a^.dato);
      Imprimir(a^.HD);
    End;
End;




















Procedure BuscarDNI (a:arbol; dni: LongInt; Var alu:alumno);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato.dni = dni) Then
        alu := a^.dato
      Else
        Begin
          If (a^.dato.dni > dni) Then
            BuscarDNI(a^.HI,dni,alu)
          Else BuscarDNI(a^.HD,dni,alu);
        End;
    End
  Else
    alu.dni := -1 // no se encontro
End;










{


//BuscarEnArbol - busca un dato en el arbol y devuelve el puntero de su ubicacion o nil si no lo encontro

Function Buscar(a:arbol;apellido:tnombre): arbol;
Begin
  If (a = Nil) Or (apellido = a^.dato.apellido)  Then
    buscar := a
  Else
    Begin
      If (a^.dato.apellido > apellido) Then
        Buscar := Buscar(a^.HI,apellido)
      Else
        Buscar := Buscar(a^.HD,apellido);
    End;
End;


Procedure BuscarApellido (a:arbol);

Var 
  apellido: tnombre;
  aux: arbol;
Begin

  WriteLn('Ingrese un Apellido a buscar: ');
  ReadLn(apellido);
  While apellido <> fin Do
    Begin
      aux := Buscar(a,apellido);
      If (aux = Nil ) Then
        WriteLn('No se encontro a el alumno!')
      Else
        Begin
          WriteLn('DATOS:');
          ImprimirDato(aux^.dato);
        End;
      WriteLn('Ingrese un Apellido a buscar: ');
      ReadLn(apellido);
    End;
End;
}



Procedure BuscarApellido (a:arbol; apellido:tnombre);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato.apellido = apellido) Then
        ImprimirDato(a^.dato);
      BuscarApellido(A^.HI,apellido);
      BuscarApellido(a^.HD,apellido);
    End;
End;


// Programa Principal

Var 
  a: arbol;
  alu: alumno;
  dni: LongInt;


Begin
  a := Nil;
  CargarArbol(a);
  Imprimir(a);

  WriteLn('Ingrese un DNI a buscar: ');
  ReadLn(dni);

  BuscarDNI(a,dni,alu);
  If (alu.dni = -1 ) Then
    WriteLn('No se encontro el dni del alumno!')
  Else
    Begin
      WriteLn('DATOS:');
      ImprimirDato(alu);
    End;
  BuscarApellido(a,'avila');
  BorrarArbol(a);
End.
