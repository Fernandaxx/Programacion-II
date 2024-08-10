import java.util.Scanner;
public class Ejer4{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Flota flota= new Flota();
        String patente,destino,horaSalida;
        System.out.println("Patente:");
        patente = in.next();
        Micro micro;
        while(!(patente.toUpperCase().equals("ZZZ000")) && (!flota.estaCompleta())){
            System.out.println("destino:");
            destino= in.next();
            in.nextLine();
            System.out.println("hora de salida:");
            horaSalida=in.next();
            in.nextLine();
            micro = new Micro(patente,destino,horaSalida);
            flota.agregarMicro(micro);
            System.out.println("Patente:");
            patente = in.next();
        }

        System.out.println();
        System.out.println("Ingrese una patente a eliminar");
        String patentee= in.next(); 
        if(flota.buscarMicroPorPatente(patentee) != null) {
            System.out.println("Se elimino");

        }
        else{        
            System.out.println("no se encontro");
        }

        System.out.println();
        System.out.println("Ingrese un destino");
        String destine= in.next(); 
        System.out.println(flota.buscarMicroPorDestino(destine).getPatente());
        System.out.println(flota.buscarMicroPorDestino(destine).getHoraSalida());

    }
}