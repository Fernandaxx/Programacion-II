import java.util.Scanner;
public class Ejer3{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Micro micro = new Micro("ABC123","Mar del Plata","5:00 am");
        int numeroAsiento;
        System.out.println("Bienvenido - Numero de asiento");
        numeroAsiento = in.nextInt();
        while(numeroAsiento != -1 && !micro.microLleno()) {
            if (micro.estadoAsiento(numeroAsiento)){
                micro.ocuparAsiento(numeroAsiento);
                System.out.println("Se ocupo el asiento " + numeroAsiento);
            }
            else{
                System.out.println("El asiento elegido esta ocupado, el proximo asiento libre es: "+ micro.primerAsientoLibre());
            }
            System.out.println("Bienvenido - Numero de asiento");
            numeroAsiento = in.nextInt(); 
        }
        System.out.println("cantidad de asientos ocupados " + micro.getCantAsientosOcupados());
        in.close();
    }
}