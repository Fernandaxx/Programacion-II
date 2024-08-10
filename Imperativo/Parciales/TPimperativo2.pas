
Program arboles;

Const fin = '0000/0';

Type 
  str6 = string[10];

  tfecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: 1900..2100;
  End;

  alumno = Record
    nombreApellido: string;
    legajo: str6;
    nota: integer;
    fecha: tfecha;
    carrera: string;
  End;

  lista = ^nodoL;
  nodoL = Record
    dato: alumno;
    sig: lista;
  End;

  materia = Record
    codigo: integer;
    nombre: string;
    alumnos: lista;
  End;




  // Arbol de materias
  arbol = ^nodoA;
  nodoA = Record
    dato: materia;
    HI: arbol;
    HD: arbol;
  End;




Procedure LeerAlumno(Var m:materia; Var alu:alumno);
Begin
  WriteLn('Ingrese legajo alumno: ');
  ReadLn(alu.legajo);
  If (alu.legajo <> fin) Then
    Begin
      WriteLn('Ingrese nombre y apellido');
      readln(alu.nombreApellido);
      WriteLn('Ingrese carrera: ');
      readln(alu.carrera);
      WriteLn('Ingrese codigo de materia: ');
      readln(m.codigo);
      WriteLn('Ingrese nombre de materia: ');
      readln(m.nombre);
      WriteLn('Ingrese nota de materia: ');
      readln(alu.nota);
      WriteLn('Fecha de aprobacion de la materia');
      WriteLn('Ingrese dia: ');
      readln(alu.fecha.dia);
      WriteLn('Ingrese mes: ');
      readln(alu.fecha.mes);
      WriteLn('Ingrese año: ');
      readln(alu.fecha.anio);
    End;
End;
Procedure agregarAdelante(Var l: Lista; alu: alumno);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := alu;
  aux^.sig := l;
  l := aux;
End;


Procedure insertar(Var a:arbol; m:materia; alu:alumno);
Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.codigo := m.codigo;
      a^.dato.nombre := m.nombre;
      a^.dato.alumnos := Nil;
      agregarAdelante(a^.dato.alumnos, alu);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.codigo > m.codigo) Then
        Insertar(a^.HI,m,alu)
      Else
        If (a^.dato.codigo < m.codigo) Then
          Insertar(a^.HD,m,alu)
      Else agregarAdelante(a^.dato.alumnos, alu);
    End;
End;

Procedure CargarArbol(Var a:arbol);

Var m: materia;
  alu: alumno;
Begin
  LeerAlumno(m,alu);
  While (alu.legajo <> fin) Do
    Begin
      insertar(a,m,alu);
      LeerAlumno(m,alu);
    End;
End;

Function cumple(alu:alumno): Boolean;

Var exito: boolean;
Begin
  exito := false;
  If (alu.nota >7) And (alu.carrera = 'LS') Then
    exito := true;
  cumple := exito;
End;

Procedure promedioLista(l:Lista; nom:String);

Var prom: real;
  cump, tot: integer;
Begin
  cump := 0;
  tot := 0;
  While (l <> Nil) Do
    Begin
      If (cumple(l^.dato)) Then cump := cump +1;
      tot := tot+1;
      l := l^.sig
    End;
  prom := cump/tot;
  WriteLn('El promedio de aprobados con mas de 7 en ',nom, ' fue ',prom);

End;


Procedure Promedio (a:arbol);
Begin
  If (a<>Nil) Then
    Begin
      Promedio(a^.HD);
      PromedioLista(a^.dato.alumnos,a^.dato.nombre);
      Promedio(a^.HI);
    End;
End;

Function Aprobados(l:lista): integer;

Var tot: integer;
Begin
  tot := 0;
  While (l <> Nil) Do
    Begin
      If (l^.dato.nota > 4) Then tot := tot+1;
      l := l^.sig;
    End;
  Aprobados := tot;
End;

Procedure maxAprobados (a:arbol;Var max:integer;Var cod:integer);

Var tot: Integer;
Begin
  If (a<>Nil) Then
    Begin
      maxAprobados(a^.HD,max,cod);
      tot := Aprobados(a^.dato.alumnos);
      If (tot > max) Then
        Begin
          cod := a^.dato.codigo;
          max := tot;
        End;
      maxAprobados(a^.HI,max,cod);
    End;
End;

Function AprobadosCumple(l:lista): integer;

Var tot: integer;
Begin
  tot := 0;
  While (l <> Nil) Do
    Begin
      If ( (l^.dato.nota > 4) And (l^.dato.fecha.mes >=4) And (l^.dato.fecha.mes <=6)
         ) Then tot := tot+1;
      l := l^.sig;
    End;
  AprobadosCumple := tot;
End;


Procedure AprobadosAbJu(a:arbol;Var tot:integer);
Begin
  If (a<>Nil) Then
    Begin
      AprobadosAbJu(a^.HD,tot);
      tot := tot + AprobadosCumple(a^.dato.alumnos);
      AprobadosAbJu(a^.HI,tot);


    End;
End;


Var  a: arbol;
  max,cod,tot: integer;
Begin
  tot := 0;
  max := -1;
  a := Nil;
  CargarArbol(a);
  promedio(a);
  maxAprobados(a,max,cod);
  WriteLn('La materia con mas aprobados fue ',cod,' con ',max);
  AprobadosAbJu(a,tot);
  writeln('La cantidad de aprobados entre abril y junio fue de ',tot,' alumnos ');
End.
