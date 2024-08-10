//-------- MODIFICAR TREES ------------------
procedure insertarAB(dato: integer; var a: arbol);
begin
  if (a = nil) then begin
    new(a);
    a^.dato:=dato;
    a^.HI:=nil;
    a^.HD:=nil;
  end else if (dato > a^.dato) then insertarAB(dato, a^.HD)
  else insertarAB(dato, a^.HI);
end;

procedure generarArbol(l: lista; var a: arbol);
begin
  while (l <> nil) do begin
    insertarAB(l^.dato, a);
    l:=l^.sig;
  end;
end;

// Borra un elemento en un ABO. Exito si lo encontro, !exito si no lo encontro.
procedure borrarElemento(var a: arbol; num: integer; var exito: boolean);
var aux: arbol;
begin
  // No encontro el dato a borrar
  if (a=nil) then exito:=false
  // Si es el dato a borrar
  else if (a^.dato=num) then begin
    // Si no tiene hijos, chau
    if (a^.HI=nil) and (a^.HD=nil) then begin
      aux:=a;
      a:=nil;
      dispose(a);
    end
    // Si tiene dos, buscar el menor valor e intercambiar valor con ese. Luego borrar ese elemento
    else if (a^.HI<>nil) and (a^.HD<>nil) then begin
      aux:=getMin(a^.HD);
      a^.dato:=aux^.dato;
      borrarElemento(aux, aux^.dato, exito);
    end
    // Si hay un solo hijo, intercambiar datos con el hijo y eliminar el hijo
    else begin
      if (a^.HI<>nil) then aux := a^.HI
      else aux := a^.HD;
      a^ := aux^;
      dispose(aux);
    end;
    exito := true;
  end
  // Seguir buscando 
  else if (a^.dato>num) then borrarElemento(a^.HI, num, exito)
  else borrarElemento(a^.HD, num, exito);
end;

//-------- TRAVERSE TREES ---------
procedure preOrden(a: arbol);
begin
  if (a <> nil) then begin
    write (a^.dato, '   ');       
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;


procedure enOrden(a: arbol);
begin
  if (a <> nil) then begin
    enOrden (a^.HI);
    write (a^.dato, '   ');       
    enOrden (a^.HD);
  end;
end;

procedure postOrden(a: arbol);
begin
  if (a <> nil) then begin
    postOrden (a^.HI);
    postOrden (a^.HD);
    write (a^.dato, '   ');       
  end;
end;

//---------- BUSQUEDAS --------------
function buscar (a: arbol; v: integer): arbol;
begin
  if (v=a^.dato) or (a=nil) then
    buscar := a
  else if (v>a^.dato) then
    buscar:= buscar(a^.HD,v)
  else 
    buscar:= buscar(a^.HI,v);
end;

function verMin (a: arbol): integer;
begin
  if (a=nil) then verMin:=-1
  else if (a^.HI <> nil) then
    verMin:=verMin(a^.HI)
  else verMin := a^.dato;
end;

procedure verMaxDesordenado(a: arbol; var maxCant, maxCod:integer);
begin
  if (a <> nil) then begin
     if (a^.dato.cant > maxCant) then begin
          maxCant:=a^.dato.cant;
          maxCod:=a^.dato.codigoUsuario;
     end;
    verMaxDesordenado(a^.HI, maxCant, maxCod);
    verMaxDesordenado(a^.HD, maxCant, maxCod);
  end;
end;

// Contar pero como funcion, para retornar un valor solo
function contar(a: arbol; algo): integer
var cant:integer;
begin
  cant := 0;
  if (a <> nil) then begin
    if (a^.dato = algo) then
      cant := cant + 1;
    cant := cant + contar(a^.HI, algo);
    cant := cant + contar(a^.HD, algo);
  end;
  contar := cant;
end;

function existeDesordenado (a: arbol; v: string): boolean;
begin
  if (a=nil) then
    existeDesordenado:=false
  else if (v=a^.dato.titulo) then
    existeDesordenado := true
  else begin
    if not (existeDesordenado(a^.HD,v)) then existeDesordenado:= existeDesordenado(a^.HI,v)
    else existeDesordenado := true;
  end  
end;

function verMax (a: arbol): integer;
begin
  if (a=nil) then verMax:=-1
  else if (a^.HD <> nil) then
    verMax:=verMax(a^.HD)
  else verMax := a^.dato;
end;

procedure buscarAcotado(a: arbol; inf, sup: integer);
begin
  if (a <> nil) then
    if (a^.dato >= inf) then
      if (a^.dato <= sup) then begin
        write(a^.dato, ' ');
        buscarAcotado(a^.hi, inf, sup);
        buscarAcotado (a^.hd, inf, sup);
      end
      else
        buscarAcotado(a^.hi, inf, sup)
    else
      buscarAcotado(a^.hd, inf, sup);
end;

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }
procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
