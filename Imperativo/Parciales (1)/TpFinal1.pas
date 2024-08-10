
Program TpFinal1;

Const 

  fin = 90909090;

Type 

  tfecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: 1900..2100;
  End;

  mascota = Record
    id: Integer;
    tipo: String;
    peso: real;
    fecha: tfecha;
    cantInt: Integer;
  End;

  cliente = Record
    dni: LongInt;
    NombreApellido: string;
    direccion: String;
  End;


  listaMascotas = ^nodo;
  nodo = Record
    dato: mascota;
    sig: listaMascotas;
  End;

  informacion = Record
    infoCliente: cliente;
    Mascotas: ListaMascotas;
    totalIntevenciones: integer;
  End;


  arbol = ^nodoA;
  nodoA = Record
    dato: informacion;
    HI: arbol;
    HD: arbol;
  End;



Procedure AgregarMascota (Var l:listaMascotas; m:mascota);

Var 
  aux: listaMascotas;
Begin
  new(aux);
  aux^.dato := m;
  aux^.sig := l;
  l := aux;
End;


Procedure InsertarArbol (Var a:arbol; c:cliente ; m:mascota);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.infoCliente := c;
      a^.dato.Mascotas := Nil;
      AgregarMascota(a^.dato.Mascotas,m);
      a^.HI := Nil;
      a^.HD := Nil;
      a^.dato.totalIntevenciones := m.cantInt;
    End
  Else
    Begin
      If (a^.dato.infoCliente.dni > c.dni) Then
        InsertarArbol(a^.HI,c,m)
      Else
        If (a^.dato.infoCliente.dni < c.dni) Then
          InsertarArbol(a^.HD,c,m)
      Else  // es igual
        Begin
          a^.dato.totalIntevenciones := a^.dato.totalIntevenciones + m.cantInt;
          AgregarMascota(a^.dato.Mascotas,m);
        End;
    End;
End;


Procedure CargarInformacion( Var c:cliente; Var m:mascota);
Begin
  writeLn('Ingrese DNI: ');
  ReadLn(c.dni);
  If (c.dni <> fin ) Then
    Begin
      writeLn('Ingrese Nombre y apellido: ');
      ReadLn(c.NombreApellido);
      writeLn('Ingrese direccion: ');
      ReadLn(c.direccion);
      writeLn('Ingrese id de mascota: ');
      ReadLn(m.id);
      writeLn('Ingrese tipo de mascota: ');
      ReadLn(m.tipo);
      writeLn('Ingrese peso de mascota: ');
      ReadLn(m.peso);
      writeln('Ingrese fecha de ingreso: ');
      writeLn('Ingrese dia de ingreso: ');
      ReadLn(m.fecha.dia);
      writeLn('Ingrese mes de ingreso: ');
      ReadLn(m.fecha.mes);
      writeLn('Ingrese año de ingreso: ');
      ReadLn(m.fecha.anio);
      WriteLn('Ingrese cantidad de intervenciones: ');
      ReadLn(m.cantInt);
    End;
End;


Procedure CrearArbol (Var a:arbol);

Var 
  c: cliente;
  m: mascota;
Begin
  CargarInformacion (c,m);
  While (c.dni <> fin) Do
    Begin
      InsertarArbol(a,c,m);
      CargarInformacion(c,m);
    End;
End;

Procedure MinIntervenciones (a:arbol; Var min:integer; Var direc:String);
Begin
  If (a <> Nil) Then
    Begin
      MinIntervenciones(a^.HI,min,direc);
      If (a^.dato.totalIntevenciones < min) Then
        Begin
          min := a^.dato.totalIntevenciones;
          direc := a^.dato.infoCliente.direccion;
        End;
      MinIntervenciones(a^.HD,min,direc);
    End;
End;


Procedure imprimirMinimo (a:arbol);

Var 
  min: Integer;
  direc: String;
Begin
  min := 999;
  MinIntervenciones(a,min,direc);
  WriteLn('Direccion del cliente:');
  WriteLn(direc);
End;

Procedure BusquedaAcotada (a:arbol; inf:LongInt; sup:LongInt);

Begin
  If (a <> Nil) Then
    If (a^.dato.infoCliente.dni >= inf) Then
      Begin
        If (a^.dato.infoCliente.dni <= sup) Then
          Begin
            busquedaAcotada (a^.HD, inf, sup);
            WriteLn('DNI ',a^.dato.infoCliente.dni,' Nombre ', a^.dato.infoCliente.NombreApellido);
            busquedaAcotada(a^.HI, inf, sup);
          End
        Else
          busquedaAcotada(a^.HI, inf, sup);
        // poda el arbol der
      End
  Else
    busquedaAcotada(a^.HD, inf, sup);
  // poda el arbol izquierdo
End;




Function verificarMascota (m:mascota): Boolean;

Var 
  exito: Boolean;
Begin
  exito := False;
  If (m.peso > 10) And (m.fecha.mes >= 1) And (m.fecha.mes <= 3) And (m.fecha.anio = 2023) Then
    exito := True;
  verificarMascota := exito;
End;



Procedure recorrerLista(l:listaMascotas);
Begin
  While (l<>Nil) Do
    Begin
      If (verificarMascota(l^.dato)) Then
        WriteLn('tipo:', l^.dato.tipo, 'ID ', l^.dato.id);
      l := l^.sig;
    End;
End;

Procedure enOrden (a:Arbol);
Begin
  If (a <> Nil) Then
    Begin
      enOrden(a^.HI);
      WriteLn('nombre: ', a^.dato.infoCliente.NombreApellido);
      recorrerLista(a^.dato.Mascotas);
      enOrden(a^.HD);
    End;
End;



Var 
  a: arbol;

Begin
  a := Nil;
  CrearArbol(a);
  // imprimirMinimo(a);
  // BusquedaAcotada(a,15000000,30000000);
  enOrden(a);


End.
