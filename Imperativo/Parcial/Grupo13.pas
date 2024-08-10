
Program Grupo13;

Uses 
sysutils;

Type 
  str70 = string[70];

  persona = Record
    DNI: longint;
    nombre_apellido: str70;
    correo: str70;
    pago: str70;
  End;

  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  entrada = Record
    codigo: longint;
    butaca: 1..100;
    fila: 1..10;
    precio: real;
    fecha_show: fecha;
    platea: 'A'..'K';
    comprador: persona;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: entrada;
    sig: lista;
  End;

  nombres = array [1..20] Of str70;
  plateas = array [1..11] Of char;
  dias = array [1..10] Of integer;

     {Completar con los tipos de datos necesarios}

  datolistaEntrada = Record
    codigo: longint;
    butaca: 1..100;
    fila: 1..10;
    precio: real;
    fecha_show: fecha;
    platea: 'A'..'K';
    pago: str70;
  End;

  listaEntrada = ^nodoEntrada;
  nodoEntrada = Record
    dato: datolistaEntrada;
    sig: listaEntrada;
  End;

  comprador = Record
    DNI: LongInt;
    nombre_apellido: str70;
    correo: str70;

    entradas: listaEntrada;
  End;


  arbol = ^nodoA;
  nodoA = Record
    dato: comprador;
    HI: arbol;
    HD: arbol;
  End;

Procedure cargarFecha(Var f: fecha);

Var 
  v: dias;
  pos: integer;
Begin
  v[1] := 3;
  v[2] := 4;
  v[3] := 6;
  v[4] := 8;
  v[5] := 9;
  v[6] := 12;
  v[7] := 15;
  v[8] := 16;
  v[9] := 17;
  v[10] := 18;
  pos := random(10)+1;
  f.dia := v[pos];
  f.mes := 8;
  f.anio := 2023;
End;

Procedure agregar(Var l: lista; e: entrada);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := e;
  aux^.sig := l;
  l := aux;
End;

Procedure cargarComprador(Var p: persona);

Var 
  pos: integer;
  v,v2,v3: nombres;
Begin
 {Nombres}
  v[1] := 'Lionel Perez';
  v[2] := 'Martin Fernandez';
  v[3] := 'Mariano Gomez';
  v[4] := 'Alejandro Gonzalez';
  v[5] := 'Fermin Martinez';
  v[6] := 'Nicolas Castro';
  v[7] := 'Gonzalo Villareal';
  v[8] := 'Tadeo Pardo';
  v[9] := 'Juan Pablo Silvestre';
  v[10] := 'Mariano Tello';
  v[11] := 'Alejo Ruiz';
  v[12] := 'Agustin Paz';
  v[13] := 'Juan Salto';
  v[14] := 'Matias Pidone';
  v[15] := 'Luis Hernandez';
  v[16] := 'Cristian Herrera';
  v[17] := 'Santiago Manzur';
  v[18] := 'Julian Darino';
  v[19] := 'Victor Abila';
  v[20] := 'Luciano Segura';
  {Correos}
  v2[1] := 'lionel.perez@gmail.com';
  v2[2] := 'martin.fernandez@gmail.com';
  v2[3] := 'mariano.gomez@gmail.com';
  v2[4] := 'alejandro.gonzalez@gmail.com';
  v2[5] := 'fermin.martinez@gmail.com';
  v2[6] := 'nicolas.castro@gmail.com';
  v2[7] := 'gonzalo.villareal@gmail.com';
  v2[8] := 'tadeo.pardo@gmail.com';
  v2[9] := 'juan.pablo.silvestre@gmail.com';
  v2[10] := 'mariano.tello@gmail.com';
  v2[11] := 'alejo.ruiz@gmail.com';
  v2[12] := 'agustin.paz@gmail.com';
  v2[13] := 'juan.salto@gmail.com';
  v2[14] := 'matias.pidone@gmail.com';
  v2[15] := 'luis.hernandez@gmail.com';
  v2[16] := 'cristian.herrera@gmail.com';
  v2[17] := 'santiago.manzur@gmail.com';
  v2[18] := 'julian.darino@gmail.com';
  v2[19] := 'victor.abila@gmail.com';
  v2[20] := 'luciano.segura@gmail.com';
  {M�todo de pago}
  v3[1] := 'Tarjeta de Credito';
  v3[2] := 'Tarjeta de Debito';
  v3[3] := 'Efectivo';

  With (p) Do
    Begin
      DNI := random(18000000)+20000000;
      pos := random(20)+1;
      nombre_apellido := v[pos];
      correo := v2[pos];
      pago := v3[random(3)+1];
    End;
End;

Procedure crearLista(Var l: lista);

Var 
  e: entrada;
  cant,i,j,pos,repe: integer;
  v: plateas;
Begin
  cant := random(100)+1;
  v[1] := 'A';
  v[2] := 'B';
  v[3] := 'C';
  v[4] := 'D';
  v[5] := 'E';
  v[6] := 'F';
  v[7] := 'G';
  v[8] := 'H';
  v[9] := 'I';
  v[10] := 'J';
  v[11] := 'K';
  For i:=1 To cant Do
    Begin
      With (e) Do
        Begin
          codigo := random (100000)+1;
          butaca := random (100)+1;
          fila := random (10)+1;
          pos := random(11)+1;
          platea := v[pos];
          precio := random(75000)+10000;
          cargarFecha(fecha_show);
          cargarComprador(comprador);
        End;
      agregar(l, e);
      repe := random(3)+1;
      If (repe>2)Then
        Begin
          For j:=1 To repe Do
            Begin
              With (e) Do
                Begin
                  codigo := random (100000)+1;
                  butaca := random (100)+1;
                  fila := random (10)+1;
                  pos := random(11)+1;
                  platea := v[pos];
                  precio := random (75000)+10000;
                  cargarFecha(fecha_show);
                End;
              agregar(l, e);
            End;
        End;
    End;
End;


Procedure imprimirComprador(p: persona);
Begin
  With (p) Do
    Begin
      writeln('COMPRADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | CORREO: ', correo, ' | PAGO: '
              ,
              pago);
    End;
End;

Procedure imprimir(e: entrada);
Begin
  With (e) Do
    Begin
      writeln('');
      writeln('ENTRADA: ', codigo, ' | BUTACA: ',butaca, ' | FILA: ', fila, ' | PLATEA: ',
              platea,
              ' | precio: ', precio:0:2, ' | FECHA: ', fecha_show.dia,'/',fecha_show.mes,'/',
              fecha_show.anio);
      imprimirComprador(comprador);
    End;
End;

Procedure imprimirLista(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;




Procedure AgregarLista (Var l:listaEntrada; e:entrada );

Var 
  aux: listaEntrada;
Begin
  new(aux);
  aux^.dato.codigo := e.codigo;
  aux^.dato.butaca := e.butaca;
  aux^.dato.fila := e.fila;
  aux^.dato.precio := e.precio;
  aux^.dato.fecha_show.dia := e.fecha_show.dia;
  aux^.dato.fecha_show.mes := e.fecha_show.mes;
  aux^.dato.fecha_show.anio := e.fecha_show.anio;
  aux^.dato.platea := e.platea;
  aux^.dato.pago := e.comprador.pago;
  aux^.sig := l;
  l := aux;
End;


Procedure AgregarDato (Var c:comprador; e:persona);
Begin
  c.DNI := e.DNI;
  c.nombre_apellido := e.nombre_apellido;
  c.correo := e.correo;

End;

//InsertarNodo en un arbol binario con lista de datos que se repiten del principal
Procedure InsertarArbol (Var a:arbol; e:entrada);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      AgregarDato(a^.dato,e.comprador);
      a^.dato.entradas := Nil;
      AgregarLista(a^.dato.entradas,e);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.DNI > e.comprador.DNI) Then
        InsertarArbol(a^.HI,e)
      Else
        If (a^.dato.DNI < e.comprador.DNI) Then
          InsertarArbol(a^.HD,e)
      Else  // es igual
        AgregarLista(a^.dato.entradas,e);
    End;
End;

//CrearArbol- Crea un arbol a partir de los datos de una lista

Procedure CrearArbol (Var a:arbol;l:lista);
Begin
  While (l <> Nil) Do
    Begin
      InsertarArbol(a,l^.dato);
      l := l^.sig;
    End;
End;

//INCISO B








Function verificar (f:fecha): Boolean;

Var 
  exito: Boolean;
Begin
  exito := False;
  If (f.anio = 2023) And (f.mes = 8) And (f.dia > 3) And (f.dia < 9) Then
    exito := True;
  verificar := exito;
End;

Procedure Informar (c:comprador);

Var 
  min1,min2: Real;
  aux: listaEntrada;
  info1,info2: listaEntrada;
  exito: boolean;
Begin
  min1 := 9999999;
  aux := c.entradas;
  exito := false;
  While (aux <> Nil ) Do
    Begin
      If verificar(aux^.dato.fecha_show) Then
        Begin
          exito := true;
          WriteLn('Las dos entradas mas baratas de:',c.DNI);
          If (aux^.dato.precio < min1) Then
            Begin
              min2 := min1;
              info2 := info1;
              min1 := aux^.dato.precio;
              info1 := aux^.dato;
            End
          Else
            If (aux^.dato.precio < min2) Then
              Begin
                min2 := aux^.dato.precio;
                info2 := aux^.dato;
              End;
        End;
    End;
  If (exito) Then
    Begin
      WriteLn('dni', c.DNI);
      WriteLn(info1.dato.butaca);
      WriteLn(info1.codigo);
      WriteLn(info1.dato.fila);
      WriteLn(info1.dato.platea);

      WriteLn(info2.dato.butaca);
      WriteLn(info2.codigo);
      WriteLn(info2.dato.fila);
      WriteLn(info2.dato.platea);

    End;
End;

Procedure EnOrden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      Informar(a^.dato);
      EnOrden(a^.HD);
    End;
End;



// INCISO C


Function CantEntradas (l:listaEntrada): Integer;

Var 
  total: Integer;
Begin
  total := 0;
  While (l <> Nil) Do
    Begin
      If (l^.dato.pago = 'Efectivo') And (l^.dato.fila > 5) And (l^.dato.fila < 10) Then
        total := total + 1;
      l := l^.sig;
    End;
  CantEntradas := total;
End;


Procedure BusquedaAcotada (a:arbol; inf:LongInt; sup:LongInt);

Begin
  If (a <> Nil) Then
    If (a^.dato.DNI >= inf) Then
      Begin
        If (a^.dato.DNI <= sup) Then
          Begin
            WriteLn('DNi', a^.dato.DNI);
            WriteLn('correo: ', a^.dato.correo);
            WriteLn('entradas efectivo: ', CantEntradas(a^.dato.entradas));
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



//INCISO D



Procedure DineroGastado (l:listaEntrada; Var tot:integer; dinero:real);

Var 
  suma: Real;
  exito: boolean;
  cant: integer;
Begin
  suma := 0;
  exito := false;
  cant := 0;
  While l <> Nil Do
    Begin
      If (l^.dato.pago ='Tarjeta de Credito') Then
        exito := true;
      If (l^.dato.platea = 'A') Or (l^.dato.platea = 'B') Then
        cant := cant + 1;
      suma := suma + l^.dato.precio;
      l := l^.sig;
    End;
  If (exito) Then
    Begin
      tot := cant;
      dinero := suma;
    End;
End;


{Maximo recorriendo todo el arbol}
Procedure VIP (a:arbol; Var max:integer; Var nom:String; Var tot:real);

Var 
  din: real;
  suma: integer;
Begin
  If (a <> Nil) Then
    Begin
      DineroGastado(a^.dato.entradas,suma,din);
      If (suma > max) Then
        Begin
          max := suma;
          nom := a^.dato.nombre_apellido;
          tot := din;
        End;
      vip(a^.HD,max,nom,tot);
      vip(a^.HI,max,nom,tot);
    End;
End;



Procedure BorrarArbol(Var a: arbol);
Begin
  If a <> Nil Then { Si queda algo que borrar }
    Begin
      BorrarArbol(a^.HI);  { Borra la izqda recursivamente }
      borrarlista(a^.dato.entradas);
      dispose(a); { Libera lo que ocupaba el nodo }
      BorrarArbol(a^.HD); { Y luego va por la derecha }
    End;
End;


Var 
  l: lista;
  a: arbol;
  max: Integer;
  nom: str70;
  din: real;
Begin
  Randomize;

  l := Nil;
  crearLista(l); {carga automatica de la estructura disponible}
  writeln ('LISTA GENERADA: ');
  imprimirLista(l);

     {Completar el programa}
  a := Nil;
  CrearArbol(a,l);

  EnOrden(a);

  BusquedaAcotada(a,18000000,32000000);
  max := -1;
  nom := ' ';
  din := 0;
  VIP(a,max,nom,din);
  WriteLn(nom, ' gasto', din);

  BorrarArbol(a);
  writeln('Fin del programa');
  readln;
End.
