program parcial;


Type
  str70 = string[70];
  duenio = record
    DNI:longint;
    nombre_apellido:str70;
    direccion:str70;
  end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;

  mascota = record
    id:integer;
    tipo:str70;
    peso:real;
    ingreso:fecha;
    cantInter:integer;
    owner:duenio;
  end;
  dataLista = record
    id:integer;
    tipo:str70;
    peso:real;
    ingreso:fecha;
    cantInter:integer;
  end;
  lista = ^nodoLista;
  nodoLista = record
    data:dataLista;
    sig:lista;
  end;

  dataArbol  = record
    DNI:longint;
    nombre_apellido:str70;
    direccion:str70;
    mascotas:lista;
    cantInter:integer;
  end;
  arbol = ^nodoArbol;
  nodoArbol = record
    data:dataArbol;
    HI:arbol;
    HD:arbol;
  end;
  regMin = record
    cant:integer;
    direccion:str70;
  end;


Procedure AgregarAdelante ( var l: lista; id:integer;tipo:str70; peso:real; ingreso:fecha; cantInter:integer);
var
   aux: lista;
begin
     new(aux);
     aux^.data.cantInter:= cantInter;
     aux^.data.id:= id;
     aux^.data.ingreso:= ingreso;
     aux^.data.peso:= peso;
     aux^.data.tipo:= tipo; {Creo el nodo y cargo el dato}
     aux^.sig:= l;	{Enlazo el siguiente y asigno el nuevo inicio}
     l:= aux;
end;

Procedure generarData(var nData:dataArbol; r:mascota);
begin
     with nData do begin
        DNI:= r.owner.DNI;
        nombre_apellido:= r.owner.nombre_apellido;
        direccion:= r.owner.direccion;
        mascotas:= nil;
        cantInter:= r.cantInter;
        agregarAdelante(mascotas,r.id,r.tipo,r.peso,r.ingreso,r.cantInter); // No paso el registro completo porque tambien tiene el registro del dueño que no se usa
     end;
end;

Procedure insertarArbol(Var a:arbol;data:mascota);
var
   data2:dataArbol;
Begin
  If (a = Nil) Then
    Begin
      new(a);
      generarData(data2,data);
      a^.data := data2;
      a^.HD := Nil;
      a^.HI := Nil;
    End
  Else
    If (a^.data.DNI < data.owner.DNI) Then
      insertarArbol(a^.HD,data)
  Else
    If (a^.data.DNI > data.owner.DNI) Then
      insertarArbol(a^.HI,data)
    else begin
        a^.data.cantInter:= a^.data.cantInter+ data.cantInter;
        agregarAdelante(a^.data.mascotas, data.id, data.tipo,  data.peso, data.ingreso, data.cantInter );
    end;
End;
Procedure leerFecha(var F:fecha);
begin
  writeln('Ingrese el dia:');
  readln(f.dia);
  writeln('Ingrese el mes:');
  readln(f.mes);
  writeln('Ingrese el anio:');
  readln(f.anio);
end;


Procedure leerMascota(var r:mascota);
begin
  with r do begin
    writeln('Ingrese el DNI:');
    readln(owner.DNI);
    if (owner.DNI <> 90909090) then begin
      writeln('Ingrese nombre y apellido:');
      readln(owner.nombre_apellido);
      writeln('Ingrese la direccion:');
      readln(owner.direccion);
      writeln('Ingrese el ID:');
      readln(id);
      writeln('Ingrese el tipo de mascota:');
      readln(tipo);
      writeln('Ingrese el peso:');
      readln(peso);
      leerFecha(ingreso);
      writeln('Ingrese la cantidad de intervenciones:');
      readln(cantInter);
    end;
  end;
end;


Procedure getMin(a:arbol; var min:regMin);
begin
  if (a <> nil) then
    begin
      getMin(a^.HI,min);
      if (a^.data.cantInter < min.cant) then begin
        min.cant:=a^.data.cantInter;
        min.direccion:= a^.data.direccion;
      end;
      getmin(a^.HD,min);

    end;
end;

Procedure cargarArbol(var a:arbol);
var
  reg:mascota;
begin
  leerMascota(reg);
  while (reg.owner.DNI <> 90909090) do begin
    insertarArbol(a,reg);
    leerMascota(reg);
  end;
end;

Procedure verValoresRango ( a : Arbol; inf : longint; sup : longint);
begin
  if ( a <> nil ) then
    if ( a^.data.DNI >= inf) then
      if ( a^.data.DNI <= sup ) then begin
       verValoresRango ( a^.hd, inf, sup);
       writeln('----------------------------------');
       writeln('DNI: ',a^.data.DNI);
       writeln('Nombre y Apellido: ',a^.data.nombre_apellido);
       verValoresRango (a^.hi, inf, sup );
      end
      else
          VerValoresRango(a^.hi, inf, sup)
    else
      VerValoresRango(a^.hd, inf, sup);
end;
function checkMascotas(l:lista):boolean;
var
   aux:lista; exito:boolean;
begin
  exito:= false;
  aux:= l;
  while (aux <> nil) and (not exito) do begin
    exito:= (( aux^.data.peso > 10) and ((aux^.data.ingreso.mes >= 1) and (aux^.data.ingreso.mes <= 3)));
    aux:= aux^.sig;
  end;
  checkMascotas:= exito;
end;
Procedure imprimirMascotas(l:lista);
begin
  while (l <> nil) do begin
    if (( l^.data.peso > 10) and ((l^.data.ingreso.mes >= 1) and (l^.data.ingreso.mes <= 3))) then
       writeln('Identificador: ', l^.data.id);
    l:= l^.sig;
  end;
end;
Procedure imprimirClientes(var a:arbol);
begin
  if (a <> nil)then begin
    imprimirClientes(a^.HI);
    if (checkMascotas(a^.data.mascotas)) then begin
     writeln('----------------------------------');
     writeln('Nombre y Apellido: ',a^.data.nombre_apellido);
     imprimirMascotas(a^.data.mascotas);
     end;
    imprimirClientes(a^.HD);

    end;

end;

var
  arbolito:arbol;
  min: regMin;
begin
  arbolito:= nil;
  cargarArbol(arbolito);
  min.cant:= 9999;
  getMin(arbolito,min);
  writeln('----------------------------------');
  if (min.cant <> 9999) then
    writeln('El cliente con menor cantidad de intervenciones de todas sus mascotas vive en:',min.direccion)
  else
    writeln('No se encontro el cliente con menor cantidad de intervenciones de todas sus mascotas');
  writeln('Clientes con DNI entre 15000000 y 30000000:');
  writeln;
  verValoresRango(arbolito,15000000,30000000);
  writeln('----------------------------------');
  writeln;
  writeln('Clientes que cumplen con las condiciones de sus mascotas:');
  writeln;
  imprimirClientes(arbolito);
  writeln('----------------------------------');
  readln;
end.

