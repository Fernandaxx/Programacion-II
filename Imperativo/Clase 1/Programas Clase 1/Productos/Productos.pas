
Program productos;

Uses 
sysutils;

Type 
  producto = Record
    codigo: integer;
    nombre: string;
    marca: string;
    anio: 2000..2022;
    precio: real;
  End;

  listaProductos = ^nodoLista;
  nodoLista = Record
    dato: producto;
    sig: listaProductos;
  End;


  ListaAnio = ^nodoListaAnio;
  nodoListaAnio = Record
    anio: 2000..2022;
    nombre: String;
    codigo: Integer;
    precio: real;
    sig: ListaAnio;
  End;


  ListaMarca = ^nodoListaMarca;
  nodoListaMarca = Record
    marca: String;
    LAnio: ListaAnio;
    sig: ListaMarca;
  End;


Procedure agregarAdelante(Var l: listaProductos; p: producto);

Var 
  aux: listaProductos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;



{crearLista - Genera una lista con productos aleatorios}
Procedure crearLista(Var l: listaProductos);

Var 
  i,j: integer;
  p: producto;

  v : array [1..10] Of string;
Begin
  v[1] := 'Abercom';
  v[2] := 'Aluminium';
  v[3] := 'ClearWindows';
  v[4] := 'IndArg';
  v[5] := 'La Foret';
  v[6] := 'Open';
  v[7] := 'Portal';
  v[8] := 'Puertamania';
  v[9] := 'PVCPremium';
  v[10] := 'Ventalum';

  For i:=random(10) Downto 1 Do {for de marca}
    Begin
      p.marca := v[i];
      For j:=random(5) Downto 1 Do {for de anio}
        Begin
          p.anio := 2016+j;
          p.codigo := random(10);
          While (p.codigo <> 0) Do
            Begin
              p.nombre := Concat('Producto-', IntToStr(random (200)));
              p.precio := random(1000000);
              agregarAdelante(l, p);
              p.codigo := random(10);
            End;
        End;
    End;
End;


{imprimir - Muestra en pantalla el producto}
Procedure imprimir(p: producto);
Begin
  With (p) Do
    Begin
      writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ',
              precio:2:2);
    End;
End;


{imprimirLista - Muestra en pantalla la lista l}
Procedure imprimirLista(l: listaProductos);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;

{agregarElemento - Resuelve la inserción de la estructura ordenada}
Procedure agregarOrdenado(Var pri:ListaAnio; t:producto);

Var 
  nuevo, anterior, actual: ListaAnio;
Begin
  new (nuevo);
  nuevo^.anio := t.anio;
  nuevo^.nombre := t.nombre;
  nuevo^.codigo := t.codigo;
  nuevo^.precio := t.precio;
  nuevo^.sig := Nil;
  If (pri = Nil) Then
    pri := nuevo
  Else
    Begin
      actual := pri;
      anterior := pri;
      While (actual<>Nil) And (actual^.anio < nuevo^.anio) Do
        Begin
          anterior := actual;
          actual := actual^.sig;
        End;
      If (anterior = actual) Then
        pri := nuevo
      Else
        anterior^.sig := nuevo;
      nuevo^.sig := actual;
    End;
End;


Procedure GenerarListaPorMarca (Var Lm: ListaMarca; l:listaProductos);

Var 
  marca: String;
  aux: ListaMarca;
Begin
  While (l <> Nil) Do
    Begin
      marca := l^.dato.marca;
      new(aux);
      aux^.marca := marca;
      aux^.LAnio := Nil;
      aux^.sig := Lm;
      lm := aux;
      While (l <> Nil) And (l^.dato.marca = marca) Do
        Begin
          agregarOrdenado(aux^.LAnio,l^.dato);
          l := l^.sig;
        End;
    End;
End;


Procedure Informar (lm: ListaMarca);

Var 
  cant: Integer;
  aux: ListaAnio;

Begin
  While (lm <> Nil) And (lm^.marca > 'Abercom') Do
    Begin
      lm := lm^.sig;
    End;
  If (lm = Nil) Or (Lm^.marca <> 'Abercom') Then
    Begin
      writeln('No hay ninguna marca con nombre Abercom');
    End
  Else
    Begin

      cant := 0;
      aux := lm^.LAnio;
      While (aux <> Nil)  And (aux^.anio < 2018) Do
        aux := aux^.sig;


      While (aux <> Nil) And (aux^.anio <= 2020) Do
        Begin
          If (aux^.precio > 1) Then
            cant := cant + 1;
          aux := aux^.sig;
        End;
      writeln('Hay ', cant, ' productos con precio mayor a $100.000');
    End;
End;




Procedure imprimirPorAnio (l:ListaAnio);

Var 
  anio: Integer;
  total: Integer;
Begin
  While (l <> Nil) Do
    Begin
      total := 0;
      anio := l^.anio;
      WriteLn('Anio: ', anio);
      While (l <> Nil) And (l^.anio = anio) Do
        Begin
          WriteLn('Codigo de Producto ',l^.codigo, ' Nombre: ', l^.nombre, ' Precio: ', l^.precio:2:
                  2 );
          total := total + 1;
          l := l^.sig;
        End;
      WriteLn(' Total Productos del anio ', anio, ' ', total);
    End;
End;

Procedure reporte (lm:ListaMarca);

Begin
  While (lm <> Nil) Do
    Begin
      WriteLn('Marca: ', lm^.marca);
      imprimirPorAnio(lm^.LAnio);
      lm := lm^.sig;
    End;
End;


Var 
  l: listaProductos;
  lm: ListaMarca;
Begin
  Randomize;

  l := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  lm := Nil;
  GenerarListaPorMarca(lm,l);
  reporte(lm);
  WriteLn;
  Informar(lm);

End.
