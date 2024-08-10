
Program ejercicio1;

Uses 
sysutils;

Type 
  str10 = string[10];
  jugador = Record
    dni: longint;
    nombreApellido: string;
    posicion: str10;
    puntaje: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  partido = Record
    estadio: string;
    equipoLocal: string;
    equipoVisitante: string;
    fecha: str10;
    jugadores: lista;
  End;

  listaPartidos = ^nodoPartido;
  nodoPartido = Record
    dato: partido;
    sig: listaPartidos;
  End;


  ListaPF = ^nodoPF;
  nodoPF = Record
    Fecha: str10;
    Puntaje: integer;
    sig: ListaPF;
  End;

  InfoJugador = Record
    dni: longint;
    nombreApellido: string;
    posicion: str10;
    PuntajeFecha: ListaPF;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: InfoJugador;
    HI: Arbol;
    HD: Arbol;
  End;


Procedure cargarFecha(Var s: str10);

Var 
  dia, mes: integer;
Begin
  dia := random(30)+1;
  mes := random(12)+1;
  If (mes = 2) And (dia > 28)Then
    dia := 31;
  If ((mes = 4) Or (mes = 6) Or (mes =9) Or (mes = 11)) And (dia = 31)Then
    dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
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

Procedure cargarJugadores(Var l: lista);

Var 
  j: jugador;
  cant, i, pos: integer;
Begin
  cant := random(10)+22;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          dni := random(36000000)+20000000;
          nombreApellido := Concat('Jugador-', IntToStr(dni));
          pos := random(4)+1;
          Case pos Of 
            1: posicion := 'arquero';
            2: posicion := 'defensa';
            3: posicion := 'mediocampo';
            4: posicion := 'delantero';
          End;
          puntaje := random(10)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant, i: integer;
Begin
  cant := random(10);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          estadio := Concat('Estadio-', IntToStr(random (500)+1));
          equipoLocal := Concat('Equipo-', IntToStr(random (200)+1));
          equipoVisitante := Concat('Equipo-', IntToStr(random (200)+1));
          cargarFecha(fecha);
          jugadores := Nil;
          cargarJugadores(jugadores);
        End;
      agregar(l, p);
    End;
End;



Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion,
              ' y puntaje: ', puntaje);
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
      writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante,
              ' jugado el: ', fecha, ' por los siguientes jugadores: ');
      imprimirJugadores(jugadores);
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

Procedure AgregarPuntaje (Var l:ListaPF; fecha:str10; puntaje:Integer);

Var 
  aux: ListaPF;
Begin
  new(aux);
  aux^.Fecha := fecha;
  aux^.Puntaje := puntaje;
  aux^.sig := l;
  l := aux;
End;


Procedure AgregarDato (Var i:InfoJugador; j:jugador; fecha:str10);
Begin
  i.dni := j.dni;
  i.nombreApellido := j.nombreApellido;
  i.posicion := j.posicion;
End;


Procedure InsertarArbol (Var a:arbol; J:jugador; fecha:str10);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.PuntajeFecha := Nil;
      AgregarDato(a^.dato,J,fecha);
      AgregarPuntaje(a^.dato.PuntajeFecha,fecha,j.puntaje);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.dni > J.dni) Then
        InsertarArbol(a^.HI,J,fecha)
      Else
        If (a^.dato.dni< J.dni) Then
          InsertarArbol(a^.HD,J,fecha)
      Else
        AgregarPuntaje(a^.dato.PuntajeFecha,fecha,j.puntaje);

    End;
End;


Procedure CrearArbol (Var a:arbol;l:listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      While (l^.dato.jugadores <> Nil) Do
        Begin
          InsertarArbol(a,l^.dato.jugadores^.dato,l^.dato.fecha);
          l^.dato.jugadores := l^.dato.jugadores^.sig;
        End;
      l := l^.sig;
    End;
End;

Function TotalPuntaje (l:ListaPF): Integer;

Var 
  suma: Integer;
Begin
  suma := 0;
  While l <> Nil Do
    Begin
      suma := suma + l^.Puntaje;
      l := l^.sig;
    End;
  TotalPuntaje := suma;
End;


Procedure ImprimirDatos (I:InfoJugador);
Begin
  WriteLn('  JUGADOR: ');
  With (I) Do
    Begin
      writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion,
              ' y puntaje total: ', TotalPuntaje(PuntajeFecha));
    End;
End;

Procedure Imprimir (a:Arbol);
Begin
  If (a <> Nil) Then
    Begin
      Imprimir(a^.HD);
      ImprimirDatos(a^.dato);
      WriteLn('----------------------------------');
      imprimir(a^.HI);
    End;
End;


Procedure BusquedaAcotada (a:arbol; inf:LongInt; sup:LongInt; Var total:Integer);

Begin
  If (a <> Nil) Then
    If (a^.dato.dni >= inf) Then
      Begin
        If (a^.dato.dni <= sup) Then
          Begin
            total := total +1;
            busquedaAcotada(a^.HI, inf, sup,total);
            busquedaAcotada (a^.HD, inf, sup,total);
          End
        Else
          busquedaAcotada(a^.HI, inf, sup,total);
        // poda el arbol derecho
      End
  Else
    busquedaAcotada(a^.HD, inf, sup,total);
  // poda el arbol izquierdo
End;



Procedure cantidadJugadores (a:Arbol);

Var 
  tot: Integer;
Begin
  WriteLn('Cantidad de jugadores con DNI entre 30.000.000 y 40.000.000');
  tot := 0;
  BusquedaAcotada(a,30000000,40000000,tot);
  WriteLn(tot);
End;

Procedure EnOrden (a:arbol; pos:str10; Var cant:integer);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI,pos,cant);
      If ( a^.dato.posicion = pos) Then
        cant := cant + 1;
      EnOrden(a^.HD,pos,cant);
    End;
End;

Procedure CantidadPorPosicion (a:Arbol);

Var 
  pos: str10;
  cant: Integer;
Begin
  WriteLn('Ingrese la posicion:');
  ReadLn(pos);
  cant := 0;
  EnOrden(a,pos,cant);
  WriteLn('Cantidad de Jugadores de la posicion ', pos, ':', cant);
End;

Var 
  l: listaPartidos;
  a: Arbol;
Begin
  Randomize;

  l := Nil;
  crearLista(l); {carga automática de la estructura disponible}
  writeln ('Lista generada: ');
  imprimirLista(l);
  a := Nil;
  CrearArbol(a,l);
  imprimir(a);

  cantidadJugadores(a);
  CantidadPorPosicion(a);


  writeln('Fin del programa');
  readln;
End.
