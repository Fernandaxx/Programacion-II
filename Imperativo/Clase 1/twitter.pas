
Program twitter;

Uses 
sysutils;

Type 
  tweet = Record
    codigoUsuario: integer;
    nombreUsuario: string;
    mensaje: string;
    esRetweet: boolean;
  End;

  listaTweets = ^nodoLista;
  nodoLista = Record
    dato: tweet;
    sig: listaTweets;
  End;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

  listaTweetsUser = ^nodoTweetsUser;
  nodoTweetsUser = Record
    mensaje: String;
    esRetweet: Boolean;
    sig: listaTweetsUser;
  End;


  ListaUsers = ^nodoUsers;
  nodoUsers = Record
    nombreUsuario: String;
    codigoUsuario: Integer;
    tweetsUser: listaTweetsUser;
    sig: ListaUsers;
  End;

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: listaTweets; t: tweet);

Var 
  aux: listaTweets;
Begin
  new(aux);
  aux^.dato := t;
  aux^.sig := l;
  l := aux;
End;



{crearLista - Genera una lista con tweets aleatorios}
Procedure crearLista(Var l: listaTweets);

Var 
  t: tweet;
  texto: string;
  v : array [1..10] Of string;
Begin
  v[1] := 'juan';
  v[2] := 'pedro';
  v[3] := 'carlos';
  v[4] := 'julia';
  v[5] := 'mariana';
  v[6] := 'gonzalo';
  v[7] := 'alejandro';
  v[8] := 'silvana';
  v[9] := 'federico';
  v[10] := 'ruth';

  t.codigoUsuario := random(11);
  While (t.codigoUsuario <> 0) Do
    Begin
      texto := Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
      t.nombreUsuario := v[t.codigoUsuario];
      t.mensaje := texto;
      t.esRetweet := (random(2)=0);
      agregarAdelante(l, t);
      t.codigoUsuario := random(11);
    End;
End;


{imprimir - Muestra en pantalla el tweet}
Procedure imprimir(t: tweet);
Begin
  With (t) Do
    Begin
      write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
      If (esRetweet)Then
        writeln(' Si')
      Else
        writeln('No ');
    End;
End;


{imprimirLista - Muestra en pantalla la lista l}
Procedure imprimirLista(l: listaTweets);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
Procedure agregarOrdenado(Var pri:listaTweets; t:tweet);

Var 
  nuevo, anterior, actual: listaTweets;
Begin
  new (nuevo);
  nuevo^.dato := t;
  nuevo^.sig := Nil;
  If (pri = Nil) Then
    pri := nuevo
  Else
    Begin
      actual := pri;
      anterior := pri;
      While (actual<>Nil) And (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) Do
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


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
Procedure generarNuevaEstructura (lT: listaTweets; Var listaOrdenada: listaTweets);
Begin
  listaOrdenada := Nil;
  While (lT <> Nil) Do
    Begin
      agregarOrdenado(listaOrdenada, lT^.dato);
      lT := lT^.sig;
    End;
End;

Procedure agregarAdelante2 (Var l: listaTweetsUser;d:tweet);

Var 
  aux: listaTweetsUser;
Begin
  new(aux);
  aux^.mensaje := d.mensaje;
  aux^.esRetweet := d.esRetweet;
  aux^.sig := l;
  l := aux;
End;

{ genera la lista de usuarios agragando al inicio recorriendo la lista disponible ordenada para cargar los tweets por persona}
Procedure generarListaUsers (l_ord:listaTweets; Var lUser:ListaUsers);

Var 
  aux: ListaUsers;
  nombre: String;
  codigo: Integer;
Begin
  While (l_ord <> Nil) Do
    Begin
      nombre := l_ord^.dato.nombreUsuario;
      codigo := l_ord^.dato.codigoUsuario;
      New(aux);
      aux^.nombreUsuario := nombre;
      aux^.codigoUsuario := codigo;
      aux^.sig := lUser;
      Aux^.tweetsUser := Nil;
      lUser := aux;
      While (l_ord <> Nil) And (l_ord^.dato.nombreUsuario = nombre) Do
        Begin
          agregarAdelante2(aux^.tweetsUser,l_ord^.dato);
          l_ord := l_ord^.sig;
        End;
    End;
End;

Procedure ImprimirListaUsers (lUser:ListaUsers);
Begin
  While (lUser <> Nil) Do
    Begin
      writeln('--------------------');
      Writeln('Usuario: @', lUser^.nombreUsuario);
      WriteLn('Codigo de Usuario: ', lUser^.codigoUsuario);
      While (lUser^.tweetsUser <> Nil) Do
        Begin
          WriteLn('mensaje: ', lUser^.tweetsUser^.mensaje);
          Write('Retweet: ');
          If (lUser^.tweetsUser^.esRetweet) Then
            Writeln('Si')
          Else Writeln('no');
          lUser^.tweetsUser := lUser^.tweetsUser^.sig;
        End;

      lUser := lUser^.sig;
    End;
End;

Var 
  l, l_ordenada: listaTweets;
  lUser: ListaUsers;
Begin
  Randomize;

  l := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);

     {Se crea la estructura ordenada}
  l_ordenada := Nil;
  generarNuevaEstructura(l,l_ordenada);
  writeln ('Lista ordenada: ');
  imprimirLista(l_ordenada);

     {Completar el programa}
  lUser := Nil;
  generarListaUsers(l_ordenada,lUser);
  ImprimirListaUsers(lUser);

  writeln('Fin del programa');
  readln;
End.
