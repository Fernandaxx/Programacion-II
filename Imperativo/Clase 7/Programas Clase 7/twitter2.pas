
Program twitter2;

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

  User = Record
    nombreUsuario: String;
    codigoUsuario: Integer;
    Total: integer;
  End;
  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: User;
    HI: Arbol;
    HD: Arbol;
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
Begin
  t.codigoUsuario := random(2000);
  While (t.codigoUsuario <> 0) Do
    Begin
      texto := Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
      t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
      t.mensaje := texto;
      t.esRetweet := (random(2)=0);
      agregarAdelante(l, t);
      t.codigoUsuario := random(2000);
    End;
End;


{imprimir - Muestra en pantalla el tweet}
Procedure imprimir(t: tweet);
Begin
  With (t) Do
    Begin
      write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ',
            mensaje, ' RT:');
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



Procedure InsertarArbol (Var a:arbol; t:tweet);

Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato.nombreUsuario := t.nombreUsuario;
      a^.dato.codigoUsuario := t.codigoUsuario;
      a^.dato.Total := 1;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin
      If (a^.dato.codigoUsuario > t.codigoUsuario) Then
        InsertarArbol(a^.HI,t)
      Else
        If (a^.dato.codigoUsuario< t.codigoUsuario) Then
          InsertarArbol(a^.HD,t)
      Else
        a^.dato.Total := a^.dato.Total + 1;

    End;
End;


Procedure CrearArbol (Var a:arbol;l:listaTweets);
Begin
  While (l <> Nil) Do
    Begin
      InsertarArbol(a,l^.dato);
      l := l^.sig;
    End;
End;

Procedure enOrden (a:Arbol);
Begin
  If (a <> Nil) Then
    Begin
      enOrden(a^.HI);
      WriteLn;
      WriteLn('Nombre de Usuario: ', a^.dato.nombreUsuario);
      WriteLn('Codigo de Usuario: ', a^.dato.codigoUsuario);
      writeln  ('Cantidad de tweets publicados: ',a^.dato.Total);
      enOrden(a^.HD);
    End;
End;


Procedure BusquedaAcotada (a:arbol; inf:integer; sup:integer);

Begin
  If (a <> Nil) Then
    If (a^.dato.codigoUsuario >= inf) Then
      Begin
        If (a^.dato.codigoUsuario <= sup) Then
          Begin
            WriteLn('El usuario ',a^.dato.nombreUsuario,' Publico ', a^.dato.Total,' tweets');
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


Procedure MaxTweets (a:arbol; Var max:integer; Var nom:String);
Begin
  If (a <> Nil) Then
    Begin
      MaxTweets(a^.HD,max,nom);
      If (a^.dato.Total > max) Then
        Begin
          max := a^.dato.Total;
          nom := a^.dato.nombreUsuario;
        End;
      MaxTweets(a^.HI,max,nom);
    End;
End;

Procedure MayorCantTweets (a:arbol);

Var 
  max: Integer;
  nom: String;
Begin
  max := -1;
  MaxTweets(a,max,nom);
  WriteLn('Usuario con mayor cantidad de tweets:');
  WriteLn(nom);
End;


Var 
  l: listaTweets;
  a: Arbol;
Begin
  Randomize;

  l := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);


  a := Nil;
  CrearArbol(a,l);
  enOrden(a);
  // WriteLn('Cantidad de tweets de los usuarios con codigo entre 100 y 700');
  // BusquedaAcotada(a,100,700);
  MayorCantTweets(a);

  writeln('Fin del programa');
End.
