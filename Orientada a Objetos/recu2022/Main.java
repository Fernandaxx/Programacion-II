import java.util.Scanner;
public class Main{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Compra [] compras = new Compra[3];
        compras[0] = cargarSimple(in);
        compras[1] = cargarMultiples(5,in);
        //compras[2] = cargarMultiples(10,in);
        
        for (int i=0;i<2;i++){
            System.out.println(compras[i].toString());
        }
    }

    public static Fecha cargarFecha (Scanner in){
        Fecha fecha;
        int dia; String mes; int año;
        System.out.println("Ingrese dia, mes y fecha de la compra (mes en letras)");
        dia= in.nextInt();
        mes=in.next();
        in.nextLine();
        año=in.nextInt();           
        fecha= new Fecha(dia,mes,año);
        return fecha;
    }

    public static Simple cargarSimple (Scanner in){
        Simple simple;
        int dni; String nombreApellido; int numeroAsiento;
        int numeroCompra;int categoria;String nombreEstadio;Fecha fecha;double importe;
        System.out.println("Ingrese numero compra, categoria, nombre estadio, fecha e importe");
        numeroCompra= in.nextInt();
        categoria = in.nextInt();
        while (categoria <1 || categoria >4){
            System.out.println("categoria invalida ingrese otra");
            categoria = in.nextInt();
        }
        nombreEstadio = in.next();
        in.nextLine();
        fecha = cargarFecha(in);
        importe = in.nextDouble();
        System.out.println("int dni, String nombreApellido, int numeroAsiento");
        dni= in.nextInt();
        nombreApellido=in.next();
        in.nextLine();
        numeroAsiento=in.nextInt(); 
        simple = new Simple(dni,nombreApellido,numeroAsiento,numeroCompra,categoria,nombreEstadio,fecha,importe);
        return simple;
    }

    public static Multiples cargarMultiples (int cant, Scanner in){
        Multiples multiples;
        int dni; String nombreApellido; int numeroAsiento;
        int numeroCompra;int categoria;String nombreEstadio;Fecha fecha;double importe;
        System.out.println("Ingrese numero compra, categoria, nombre estadio, fecha e importe");
        numeroCompra= in.nextInt();
        categoria = in.nextInt();
        while (categoria <1 || categoria >4){
            System.out.println("categoria invalida ingrese otra");
            categoria = in.nextInt();
        }
        nombreEstadio = in.next();
        in.nextLine();
        fecha = cargarFecha(in);
        importe = in.nextDouble();
        multiples = new Multiples(cant,numeroCompra,categoria,nombreEstadio,fecha,importe);
        return multiples;
    }
}