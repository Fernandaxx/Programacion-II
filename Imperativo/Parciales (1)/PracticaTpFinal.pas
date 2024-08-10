
Program TpFinal2;

Uses 
sysutils;

Type 
  str70 = string[70];

  jugador = Record
    DNI: longint;
    nombre_apellido: str70;
    equipo: str70;
    goles: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  partido = Record
    identificador: longint;
    local: str70;
    visitante: str70;
    fecha_partido: fecha;
    estadio: str70;
    goleadores: lista;
  End;

  listaPartidos = ^nodoPartidos;
  nodoPartidos = Record
    dato: partido;
    sig: listaPartidos;
  End;

  nombres = array [1..20] Of str70;

     {Completar con los tipos de datos necesarios}


  ListaFechaGoles = ^nodoFechaGoles;
  nodoFechaGoles = Record
    fechaPartido: fecha;
    CantGoles: Integer;
    sig: ListaFechaGoles;
  End;

  Goleador = Record
    Dni : LongInt;
    nombreApellido: str70;
    equipo: str70;
    FechaGoles : ListaFechaGoles;
  End;

  Arbol = ^nodoA;
  nodoA = Record
    Dato: Goleador;
    HI: Arbol;
    HD: Arbol;
  End;



Procedure cargarFecha(Var f: fecha);
Begin
  f.dia := random(30)+1;
  f.mes := random(12)+1;
  If (f.mes = 2) And (f.dia > 28)Then
    f.dia := 28
  Else
    If ((f.mes = 4) Or (f.mes = 6) Or (f.mes =9) Or (f.mes = 11)) And (f.dia = 31)Then
      f.dia := 30;
  f.anio := 2022;
End;

Procedure agregar(Var l: listaPartidos; p: partido);

Var 
  aux: listaPartidos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure agregarJugador(Var l: lista; j: jugador);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := j;
  aux^.sig := l;
  l := aux;
End;

Procedure cargarEquipos(Var v:nombres );
Begin
  v[1] := 'Atletico Tucuman';
  v[2] := 'Huracan';
  v[3] := 'Gimnasia LP';
  v[4] := 'Godoy Cruz';
  v[5] := 'Argentino Juniors';
  v[6] := 'River';
  v[7] := 'Boca';
  v[8] := 'Racing';
  v[9] := 'Platense';
  v[10] := 'San Lorenzo';
  v[11] := 'Patronato';
  v[12] := 'Estudiantes';
  v[13] := 'Union';
  v[14] := 'Newells';
  v[15] := 'Barracas';
  v[16] := 'Tigre';
  v[17] := 'Arsenal';
  v[18] := 'Sarmiento';
  v[19] := 'Central';
  v[20] := 'Colon';
End;

Procedure cargarJugadores(Var l: lista; local, visitante:str70);

Var 
  j: jugador;
  cant, i, pos, loc_vis: integer;
  v: nombres;
Begin
  cant := random(2);
  v[1] := 'Lionel Perez';
  v[2] := 'Martin Fernandez';
  v[3] := 'Mariano Gomez';
  v[4] := 'Alejandro Gonzalez';
  v[5] := 'Fermin Martinez';
  v[6] := 'Nicolas Castro';
  v[7] := 'Gonzalo Villareal';
  v[8] := 'Tadeo Parodi';
  v[9] := 'Juan Pablo Silvestre';
  v[10] := 'Mariano Sanchez';
  v[11] := 'Alejo Monden';
  v[12] := 'Agustin Paz';
  v[13] := 'Juan Salto';
  v[14] := 'Matias Pidone';
  v[15] := 'Luis Hernandez';
  v[16] := 'Cristian Herrera';
  v[17] := 'Santiago Manzur';
  v[18] := 'Julian Darino';
  v[19] := 'Victor Abila';
  v[20] := 'Luciano Segura';
  If ((local='Colon')Or(visitante='Colon'))Then
    Begin
      With (j) Do
        Begin
          DNI := 34807474;
          nombre_apellido := 'Leandro Romanut';
          equipo := 'Colon';
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          DNI := random(18000000)+20000000;;
          pos := random(20)+1;
          nombre_apellido := v[pos];
          loc_vis := random(2)+1;
          If (loc_vis=1)Then
            equipo := local
          Else
            equipo := visitante;
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant,i,pos,loc,vis: integer;
  v, v2: nombres;
Begin
  cant := random(20)+1;
  v[1] := 'Antonio Vespucio Liberti';
  v[2] := 'Mario Alberto Kempes';
  v[3] := 'Alberto Armando';
  v[4] := 'Ciudad de La Plata';
  v[5] := 'Presidente Peron';
  v[6] := 'Jose Amalfitani';
  v[7] := 'Tomas Adolfo Duco';
  v[8] := 'Libertadores de America';
  v[9] := 'Pedro Bidegain';
  v[10] := 'Nestor Diaz Perez';
  v[11] := 'Marcelo Bielsa';
  v[12] := 'Gigante de Arroyito';
  v[13] := 'Malvinas Argentinas';
  v[14] := 'Brigadier General Estanislao Lopez';
  v[15] := 'Eduardo Gallardon';
  v[16] := 'Jose Maria Minella';
  v[17] := 'Florencio Sola';
  v[18] := 'Monumental Jose Fierro';
  v[19] := 'Nueva Espa�a';
  v[20] := 'Nuevo Francisco Urbano';
  cargarEquipos(v2);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          identificador := random (100000)+1;
          pos := random(20)+1;
          estadio := v[pos];
          loc := random(20)+1;
          local := v2[loc];
          vis := random(20)+1;
          visitante := v2[vis];
          While (local=visitante) Do
            Begin
              vis := random(20)+1;
              visitante := v2[vis];
            End;
          cargarFecha(fecha_partido);
          goleadores := Nil;
          cargarJugadores(goleadores, local, visitante);
        End;
      agregar(l, p);
    End;
End;


Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ',
              goles);
    End;
End;

Procedure imprimirJugadores(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimirJugador(l^.dato);
      l := l^.sig;
    End;
End;

Procedure imprimir(p: partido);
Begin
  With (p) Do
    Begin
      writeln('');
      writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ',
              visitante,
              ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio,
              ' | ESTADIO: ', estadio);
      imprimirJugadores(goleadores);
    End;
End;

Procedure imprimirLista(l: listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;


// INCISO A
Procedure AgregarAdelante (Var l:ListaFechaGoles; gol:integer; f:fecha);

Var 
  aux: ListaFechaGoles;
Begin
  new(aux);
  aux^.fechaPartido.dia := f.dia;
  aux^.fechaPartido.mes := f.mes;
  aux^.fechaPartido.anio := f.anio;
  aux^.CantGoles := gol;
  aux^.sig := l;
  l := aux;
End;


Procedure AgregarDato (Var g:Goleador; j:jugador);
Begin
  g.Dni := j.DNI;
  g.nombreApellido := j.nombre_apellido;
  g.equipo := j.equipo;
End;


Procedure InsertarArbol (Var a:arbol; J:jugador; f:fecha);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.FechaGoles := Nil;
      AgregarDato(a^.dato,J);
      AgregarAdelante(a^.dato.FechaGoles,j.goles,f);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.dni > j.DNI) Then
        InsertarArbol(a^.HI,J,f)
      Else
        If (a^.dato.dni< J.dni) Then
          InsertarArbol(a^.HD,J,f)
      Else
        AgregarAdelante(a^.dato.FechaGoles,j.goles,f);
    End;
End;


Procedure CrearArbol (Var a:arbol;l:listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      While (l^.dato.goleadores <> Nil) Do
        Begin
          InsertarArbol(a,l^.dato.goleadores^.dato,l^.dato.fecha_partido);
          l^.dato.goleadores := l^.dato.goleadores^.sig;
        End;
      l := l^.sig;
    End;
End;

//INCISO B

Function TotalGoles (l:ListaFechaGoles): Integer;

Var 
  total: Integer;
Begin
  total := 0;
  While (l <> Nil) Do
    Begin
      total := total + l^.CantGoles;
      l := l^.sig;
    End;
  TotalGoles := total;
End;


Procedure MaxGoles (a:Arbol; Var max:integer; Var equipo:str70);

Var 
  goles: Integer;
Begin
  If (a <> Nil) Then
    Begin
      goles := TotalGoles(a^.Dato.FechaGoles);
      If (goles > max) Then
        Begin
          max := goles;
          equipo := a^.Dato.equipo;
        End;
      MaxGoles(a^.HI,max,equipo);
      MaxGoles(a^.HD,max,equipo);
    End;
End;


//ascendente -- izq-der  INCISO C
Procedure BusquedaAcotada (a:arbol; inf:LongInt; sup:LongInt);

Begin
  If (a <> Nil) Then
    If (a^.dato.Dni >= inf) Then
      Begin
        If (a^.dato.Dni <= sup) Then
          Begin
            write('DNI: ', a^.dato.Dni, ' Nombre y Apellido: ', a^.Dato.nombreApellido);
            busquedaAcotada(a^.HI, inf, sup);
            busquedaAcotada (a^.HD, inf, sup);
          End
        Else
          busquedaAcotada(a^.HI, inf, sup);
        // poda el arbol derecho
      End
  Else
    busquedaAcotada(a^.HD, inf, sup);
  // poda el arbol izquierdo
End;


// INCISO D

// Devuelve el nodo minimo del arbol}
Function min (a:arbol): arbol;
Begin
  If (a = Nil) Then
    min := Nil
  Else
    If (a^.HI = Nil) Then
      min := a
  Else min := min(a^.HI)
End;


Procedure BorrarListaGoles (Var L:ListaFechaGoles);

Var 
  aux: ListaFechaGoles;
Begin
  While (L <> Nil) Do
    Begin
      aux := L;
      L := L^.sig;
      Dispose(aux);
    End;
End;



Procedure ClonarLista(L1: ListaFechaGoles; Var L2: ListaFechaGoles);

Var 
  aux: ListaFechaGoles;
Begin
  L2 := Nil;
  While (L1 <> Nil) Do
    Begin
      new (aux);
      aux^.CantGoles := L1^.CantGoles;
      aux^.fechaPartido.dia := L1^.fechaPartido.dia;
      aux^.fechaPartido.mes := L1^.fechaPartido.mes;
      aux^.fechaPartido.anio := l1^.fechaPartido.anio;
      aux^.sig := L2;
      L2 := aux;
      L1 := L1^.sig;
    End;
End;



Procedure EliminarNodo (Var a:arbol; num:LongInt; Var exito:Boolean);

Var 
  aux: arbol;
  copia: ListaFechaGoles;
Begin
  If (a = Nil) Then exito := False
  Else
    Begin
      If (a^.dato.Dni > num) Then
        EliminarNodo(a^.HI,num,exito)
      Else
        If (a^.dato.Dni < num) Then
          EliminarNodo(a^.HD,num,exito)
      Else
        Begin
          exito := True;
          BorrarListaGoles(a^.Dato.FechaGoles);
          If (a^.HI = Nil) Then // solo tiene hijo derecho
            Begin
              aux := a;
              a := a^.HD;
              Dispose(aux);
            End
          Else
            If (a^.HD = Nil) Then // solo tiene hijo izq
              Begin
                aux := a;
                a := a^.HI;
                Dispose(aux);
              End
          Else  // tiene dos hijos
            Begin
              aux := min(a^.HD);
              a^.dato.Dni := aux^.dato.Dni;
              a^.Dato.nombreApellido := aux^.Dato.nombreApellido;
              a^.Dato.equipo := aux^.Dato.equipo;


//Copia los datos en una lista con punteros diferentes para poder llamar al Borrarlista sin que se pierdan datos
              ClonarLista(aux^.Dato.FechaGoles,copia);
              a^.Dato.FechaGoles := copia;
              EliminarNodo(a^.HD,a^.dato.Dni,exito);
            End;
        End;
    End;
End;




Procedure imprmirDatos (g:Goleador);

Var 
  l: ListaFechaGoles;
Begin
  WriteLn('---------------------------------------------');
  WriteLn('Dni: ',g.Dni);
  WriteLn('Nombre y Apellido: ',g.nombreApellido);
  WriteLn('equipo: ',g.equipo);
  l := g.FechaGoles;
  While (l <> Nil) Do
    Begin
      WriteLn('Fecha: ');
      WriteLn(l^.fechaPartido.dia, '/ ', l^.fechaPartido.mes, '/ ', l^.fechaPartido.anio);
      WriteLn('Goles', l^.CantGoles);
      l := l^.sig;
    End;
End;




Procedure EnOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      imprmirDatos(a^.Dato);
      EnOrden(a^.HD);
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



Var 
  l: listaPartidos;
  a: Arbol;
  exito: Boolean;
  equipo: str70;
  max: Integer;
Begin
  Randomize;

  l := Nil;
  crearLista(l); {carga automatica de la estructura disponible}
  writeln ('LISTA GENERADA: ');
  imprimirLista(l);

     {Completar el programa}
  a := Nil;
  CrearArbol(a,l);
  equipo := ' ';
  max := -1;
  MaxGoles(a,max,equipo);
  WriteLn('Equipo del Maximo Goleador: ', equipo);

  WriteLn();
  WriteLn('Jugadores con dni entre 28000000 y 32000000');
  BusquedaAcotada(a,28000000,32000000);

  WriteLn();
  EnOrden(a);
  EliminarNodo(a,34807474,exito);
  If exito Then
    Begin
      WriteLn('Se elimino al jugador con dni 34807474');
      EnOrden(a);
    End;
  BorrarArbol(a);
  writeln('Fin del programa');
End.
