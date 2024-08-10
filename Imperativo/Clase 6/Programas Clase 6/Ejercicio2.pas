
Program Ejercicio2;

Type 

  Pasajero = Record
    CodVuelo: String[7];
    millas: integer;
    dni: LongInt;
    NombreApellido: String;
    Clase: String;
  End;

  LPuntos = ^nodoLpuntos;
  nodoLpuntos = Record
    CodVuelo: string[7];
    cantPuntos: Integer;
    sig: LPuntos;
  End;


  datoArbol = Record
    Dni: LongInt;
    nombreApellido: string;
    Puntos: LPuntos;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: DatoArbol;
    HD: arbol;
    HI: arbol;
  End;



Procedure LeerPasajero (Var P:Pasajero);
Begin
  With p Do
    Begin
      WriteLn('Inserte el Codigo de vuelo:');
      ReadLn(CodVuelo);
      If (CodVuelo <> 'fin') Then
        Begin
          WriteLn('Inserte las millas:');
          ReadLn(millas);
          WriteLn('Inserte el dni del pasajero:');
          ReadLn(dni);
          WriteLn('Inserte el nombre y apellido del pasajero:');
          ReadLn(NombreApellido);
          WriteLn('Inserte la clase del vuelo:');
          ReadLn(Clase);
        End;
    End;
End;


Procedure CargarPuntos (Var l:LPuntos; p:Pasajero);

Var 
  aux: LPuntos;
Begin
  new(aux);
  aux^.CodVuelo := p.CodVuelo;
  If (p.Clase = 'Ejecutiva') Then
    aux^.cantPuntos := 100 * p.millas;
  If (p.Clase = 'Turista') Then
    aux^.cantPuntos := 25 * p.millas;
  aux^.sig := l;
  l := aux;
End;


Procedure InsertarArbol (Var a:arbol; p:Pasajero);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.Dni := p.dni;
      a^.dato.nombreApellido := p.NombreApellido;
      a^.dato.Puntos := Nil;
      CargarPuntos(a^.dato.Puntos,p);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.Dni > p.dni) Then
        InsertarArbol(a^.HI,p)
      Else
        If (a^.dato.Dni< p.dni) Then
          InsertarArbol(a^.HD,p)
      Else  // es igual
        CargarPuntos(a^.dato.Puntos,p);
    End;
End;


Procedure crearArbol (Var a:arbol);

Var 
  p: Pasajero;
Begin
  LeerPasajero(p);
  While (p.CodVuelo <> 'fin') Do
    Begin
      InsertarArbol(a,p);
      LeerPasajero(p);
    End;
End;

Function TotalPuntaje (l:LPuntos): Integer;

Var 
  suma: Integer;
Begin
  suma := 0;
  While l <> Nil Do
    Begin
      suma := suma + l^.cantPuntos;
      l := l^.sig;
    End;
  TotalPuntaje := suma;
End;


Procedure MayorPuntaje (a:arbol; Var max:integer;Var nombre:String);

Var 
  tot: Integer;
Begin
  If (a <> Nil) Then
    Begin
      tot := TotalPuntaje(a^.dato.Puntos);
      If (tot > max) Then
        Begin
          max := tot;
          nombre := a^.dato.nombreApellido
        End;
      MayorPuntaje(a^.HI,max,nombre);
      MayorPuntaje(a^.HD,max,nombre);
    End;
End;

Function max (n1, n2:integer): Integer;
Begin
  If n1 > n2 Then
    max := n1
  Else
    max := n2;
End;


Function Maximo (l:LPuntos): Integer;
Begin
  If (l^.Sig = Nil) Then
    Maximo := l^.cantPuntos
  Else
    Maximo := max(l^.cantPuntos, Maximo(l^.Sig));
End;


Procedure BusquedaAcotada (a:arbol; inf:LongInt; sup:LongInt);
Begin
  If (a <> Nil) Then
    If (a^.dato.Dni >= inf) Then
      Begin
        If (a^.dato.Dni <= sup) Then
          Begin
            write('Mayor cantidad de puntaje: ', Maximo(a^.dato.Puntos));
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


Var 
  a: arbol;
  nombre: String;
  maxi: Integer;

Begin
  a := Nil;
  crearArbol(a);
  maxi := -1;
  nombre := ' ';
  MayorPuntaje(a,maxi,nombre);
  WriteLn('Mayor puntaje: ',maxi,' Nombre del Pasajero con mayor puntaje ',nombre);

  BusquedaAcotada(a,40000000,50000000);
End.
