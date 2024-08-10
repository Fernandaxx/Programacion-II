
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

  productoAnio = Record
    codigo: Integer;
    nombre: string;
    anio: 2000..2022;
    precio: real;
  End;

  listaProductosPorAnio = ^nodoProd;
  nodoProd = Record
    dato: ProdutoAnio;
    sig: listaProductosPorAnio;
  End;

  ListaMarcas = ^nodoMarcas;
  nodoMarcas = Record
    marca: String;
    listaAnio: listaProductosPorAnio;
    sig: ListaMarcas;
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
      writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
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

Procedure Agregar (Var l:listaProductosPorAnio; d:producto);

Var 
  aux: listaProductosPorAnio;
Begin
  new(aux);
  aux^.sig := l;
  aux^.dato.nombre := d.nombre;
End;

Procedure generarListaPorMarca (l:listaProductos; Var lm:ListaMarcas);

Var 
  aux: ListaMarcas;
  marca: String;
Begin
  While (l <> Nil) Do
    Begin
      marca := l^.dato.marca;
      new(aux);
      aux^.marca := marca;
      aux^.listaAnio := Nil;
      aux^.sig := lm;
      While (l <> Nil) And (marca = l^.dato.marca) Do
        Begin
          Agregar(aux^.listaAnio,l^.dato);
          l := l^.sig;
        End;
      lm := aux;
    End;
End;

Var 
  l: listaProductos;
  lm: ListaMarcas;
Begin
  Randomize;

  l := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  lm := Nil;
  generarListaPorMarca(l,lm);
  imprimirListaPorMarca(lm)
  readln;
End.
