
















{Se debe crear una estructura que totalice el saldo de diferentes cuentas bancarias a
partir de los movimientos realizados
Se necesita rápido acceso por nro. de cuenta.
Puede haber mucha información irrelevante para la solución dentro de los movimientos
realizados.}

//DATOS DE CUENTAS BANCARIAS

Program Repetidos;


Type 

  CuentaBancaria = Record
    numCuenta: Integer;
    saldo: Integer;
    fecha: string;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: CuentaBancaria;
    total: Integer;
    HI: Arbol;
    HD: Arbol;
  End;



Procedure Insertar (Var a:arbol; c:CuentaBancaria);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := c;
      a^.HI := Nil;
      a^.HD := Nil;
      a^.total := c.saldo;
    End
  Else
    Begin
      If (a^.dato.numCuenta > c.numCuenta) Then
        InsertarArbol(a^.HI,c)
      Else
        If (a^.dato.numCuenta < c.numCuenta) Then
          InsertarArbol(a^.HD,c)
      Else  // es igual
        a^.total := a^.total + c.saldo;
    End;
End;


















{Se nos pide crear una estructura que contenga las compras de un cliente a medida que van
ocurriendo.
Además debemos permitir la búsqueda eficiente por DNI del cliente.}


// DATOS DE UN CLIENTE EN LAS COMPRAS DE UN ANIO

Type 

  DatoCliente = Record
    numCliente = Integer;
    Dni: LongInt;
  End;

  compra = Record
    dni: LongInt;
    datosdelacompra1: Integer;
    datosdelacompra2: integer;
  End;

  lista = ^nodo;
  nodo = Record
    datos: Compra;
    sig: lista;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: DatoCliente;
    l: lista;
    HI: Arbol;
    HD: Arbol;
  End;


  //Agregar adelante
Procedure AgregarCompraLista(Var l: lista; c:compra);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := c;
  aux^.sig := l;
  l := aux;
End;



Procedure Insertar (Var a:arbol; c:compra);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := c;
      a^.HI := Nil;
      a^.HD := Nil;
      AgregarCompraLista(a^.l,c);
    End
  Else
    Begin
      If (a^.dato.dni > c.dni) Then
        InsertarArbol(a^.HI,c)
      Else
        If (a^.dato.dni< c.dni) Then
          InsertarArbol(a^.HD,c)
      Else  // es igual
        AgregarCompraLista(a^.l,c);
    End;
End;

Begin

End.













{Se tiene un árbol con información bancaria. Esta estructura posee por cada DNI de
cliente los datos de los movimientos realizados en su cuenta.

Se quieren generar los resúmenes de cuenta y se necesita imprimir los datos de cada
cliente.

Los datos como nombre apellido y dirección, están almacenados en una lista ordenada por
DNI.}


// DATOS QUE SE ENCUENTRAN EN OTRAS ESTRUCTURAS

Type 

  datosCliente = Record
    nombre: string;
    apellido: String;
    direccion = string;
  End;

  lista = ^nodo;
  nodo = Record
    dato: DatoCliente;
    sig: lista;
  End;

  infoBancaria = Record
    dni: LongInt;
  End;

  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: InfoBancaria;
    HI: Arbol;
    HD: Arbol;
  End;


Procedure EnOrden (a:Arbol, l:lista);

Var 
  d: DatoCliente;
Begin
  If (a <> Nil) Then
    Begin
      EnOrden(a^.HI);
      d := buscarDatos(l,a^.dato.dni);
      imprimirResumen(a^.dato,d);
      // imprime los datos del cliente y toda la info
      EnOrden(a^.HD);
    End;
End;
