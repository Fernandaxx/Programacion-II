import java.util.Scanner;
public class Main{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Compra [] compras = new Compra[3];
        for(int i=0 ; i < compras.length; i++){
            compras[i] = cargarCompra(in);
        }

    }

    public static Compra cargarCompra (Scanner in){

        Compra compra = null;
        int numeroCompra;int categoria;String nombreEstadio;Fecha fecha;double importe;
        System.out.println("Ingrese numero compra, categoria, nombre estadio, fecha e importe");
        numeroCompra= in.nextInt();
        categoria = in.nextInt();
        fecha = cargarFecha(in);
        importe = in.nextDouble();
        int option;
        System.out.println("(1) Simple , (2) multiples");
        option = in.nextInt();
        while (option<1 || option >2){
            System.out.println("(1) Simple , (2) multiples");
            option = in.nextInt();
        }
        switch (option) {
            case 1:
                int dni; String nombreApellido; int numeroAsiento;
                System.out.println("int dni, String nombreApellido, int numeroAsiento");
                dni= in.nextInt();
                nombreApellido=in.next();
                in.nextLine();
                numeroAsiento=in.nextInt(); 
                compra = new Simple(dni,nombreApellido,numeroAsiento,numeroCompra,categoria,nombreEstadio,fecha,importe);
                return compra;
            case 2: 
                
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
    
    public static Multiples cargarMultiples (int cant, Scanner in){
        
    }
}