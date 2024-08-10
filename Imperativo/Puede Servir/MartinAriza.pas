program MartinAriza;
uses crt;
type

  RegFecha = record
    dia: 1..31;
    mes: 1..12;
    periodo: 2000..2023;
  end;

  RegMascota = record
    identificador: string;
    tipoAnimal: string;
    peso: real;
    FechaIng: RegFecha;
    CantIntervenciones: integer;
  end;

  Intervenciones = ^nodoIntervenciones;
  nodoIntervenciones = record
    dato: RegMascota;
    sig: Intervenciones;
  end;

  RegDueno = record
    DNI: longint;
    nombre: string;
    apellido: string;
    direccion: string;
  end;

  RegArbol = record
    DNI: longint;
    nombre: string;
    apellido: string;
    direccion: string;
    Mascotas: Intervenciones;
    TotIntervenciones: integer;
  end;

  Arbol = ^nodoArbol;
  nodoArbol = record
    data: RegArbol;
    HI: arbol;
    HD: arbol;
  end;

  limites = record
    limInf: longint;
    limSup: longint;
  end;


Procedure VerificarMascotas(l :Intervenciones);
begin
  while (l<>nil) do begin
    if (l^.dato.FechaIng.mes >= 1) and (l^.dato.FechaIng.mes <= 3) and (l^.dato.peso > 10) then
      write('Identificador: ',l^.dato.identificador,' Tipo de mascota: ',l^.dato.tipoAnimal,' ');
    l:= l^.sig;
  end;
end;


{ARBOLES - RECORRIDO EN - ORDEN. }
Procedure enOrden10kg(a:arbol);
Begin
    If (a <> Nil) Then
      Begin
        enOrden10kg(a^.HI);
        write('Nombre: ',a^.data.nombre,' Apellido: ',a^.data.apellido,' ');
        VerificarMascotas(a^.data.Mascotas);
        enOrden10kg(a^.HD);
      End;
End;




{ARBOLES - RECORRIDO ACOTADO EN UN ABB. }
Procedure verValoresRango ( a : Arbol; inf : longint; sup : longint);
begin
    if ( a <> nil ) then
      if ( a^.data.DNI >= inf) then
        if ( a^.data.DNI <= sup ) then begin
         verValoresRango ( a^.hd, inf, sup);
         write('DNI: ', a^.data.DNI,' Nombre: ',a^.data.nombre,' Apellido: ',a^.data.apellido, ' - ' );
         verValoresRango (a^.hi, inf, sup );
        end
        else
            VerValoresRango(a^.hd, inf, sup)
      else
        VerValoresRango(a^.hi, inf, sup);
end;








{ARBOLES - RECORRIDO EN - ORDEN. }
Procedure enOrden(a:arbol;var domicilio:string;var min: integer);
Begin
    If (a <> Nil) Then
      Begin
        enOrden(a^.HI,domicilio,min);
        if (a^.data.TotIntervenciones < min) then begin
          min:= a^.data.TotIntervenciones;
          domicilio:= a^.data.direccion;
        end;
        enOrden(a^.HD,domicilio,min);
      End;
End;

Procedure CargarDatos(var pet: RegMascota; var amo: RegDueno);
begin
  writeln('Ingresar DNI:');
  readln(amo.DNI);
  if (amo.DNI <>  90909090) then begin
    writeln('Ingresar nombre:');
    readln(amo.nombre);
    writeln('Ingresar apellido:');
    readln(amo.apellido);
    writeln('Ingresar direccion:');
    readln(amo.direccion);
    writeln('Ingresar identificador:');
    readln(pet.identificador);
    writeln('Ingresar tipo de animal:');
    readln(pet.tipoAnimal);
    writeln('Ingresar peso:');
    readln(pet.peso);
    writeln('Ingresar dia:');
    readln(pet.FechaIng.dia);
    writeln('Ingresar mes:');
    readln(pet.FechaIng.mes);
    writeln('Ingresar anio:');
    readln(pet.FechaIng.periodo);
    writeln('Ingresar la cantidad de intervenciones:');
    readln(pet.CantIntervenciones);
  end;
end;


{LISTAS - AGREGAR AL INICIO. }
Procedure agregarAdelante ( var l: Intervenciones; mascota: Regmascota);
var
  aux: Intervenciones;
begin
  new(aux);   {Creo el nodo y cargo el dato}
  aux^.dato.CantIntervenciones:= mascota.CantIntervenciones;
  aux^.dato.FechaIng.dia:= mascota.FechaIng.dia;
  aux^.dato.FechaIng.mes:= mascota.FechaIng.mes;
  aux^.dato.FechaIng.periodo:= mascota.FechaIng.periodo;
  aux^.dato.peso:= mascota.peso;
  aux^.dato.tipoAnimal:= mascota.tipoAnimal;
  aux^.dato.identificador:= mascota.identificador;
  aux^.sig:= l;
  l:= aux;     {Enlazo el siguiente y asigno el nuevo inicio}
end;


{ARBOLES - OPERACION INSERTAR NODO. }
Procedure insertarArbol(Var abo:arbol;pet:regMascota;amo:RegDueno);
Begin
  If (abo = Nil) Then
    Begin
      new(abo);
      abo^.data.DNI := amo.DNI;
      abo^.data.nombre:= amo.nombre;
      abo^.data.apellido:= amo.apellido;
      abo^.data.direccion:= amo.direccion;
      abo^.data.TotIntervenciones:= pet.CantIntervenciones;
      abo^.data.Mascotas:= nil;
      agregarAdelante(abo^.data.Mascotas,pet);
      abo^.HD := Nil;
      abo^.HI := Nil;
    End
  Else
    If (abo^.data.DNI < amo.DNI) Then
      insertarArbol(abo^.HD,pet,amo)
  Else
    If (abo^.data.DNI > amo.DNI) Then
      insertarArbol(abo^.HI,pet,amo)
    else begin
      abo^.data.TotIntervenciones:= abo^.data.TotIntervenciones + pet.CantIntervenciones;
      agregarAdelante(abo^.data.Mascotas,pet);
    end;
End;


Procedure CargarArbolxReg (var a:arbol);
var
  Mascota: RegMascota;
  Dueno: RegDueno;
begin
  CargarDatos(mascota,dueno);
  while (dueno.DNI <> 90909090) do begin
    insertarArbol(a,mascota,dueno);
    CargarDatos(mascota,dueno);
  end;
end;


var
  arbolito: arbol;
  domicilio: string;
  IntervencionesMinimas: integer;
  lim:limites;
begin
  clrscr;
  {a)}
  arbolito:= nil;
  CargarArbolxReg(arbolito);
  {b)}
  writeln('');
  IntervencionesMinimas:= 999;
  enOrden(arbolito,domicilio,IntervencionesMinimas);
  writeln('el domicilio del cliente que tiene la menor cantidad de intervenciones entre todas sus mascotas es: ',domicilio);
  writeln('');
  {c)}
  lim.limInf:= 15000000;
  lim.limSup:= 30000000;
  verValoresRango(arbolito,lim.limInf,lim.limSup);
  writeln('');
  {d)}
  enOrden10kg(arbolito);
  readkey;
end.

