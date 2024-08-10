import java.util.Scanner;

public class Ejer4{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Jugador [] jugadores = new Jugador[3];
        String nombre; 
        int dni, edad, partidos,goles;
        for (int i =0; i<jugadores.length; i++){
            System.out.println("Inserte: Nombre, Dni, Edad , Partidos , Goles");
            nombre=in.next();
            in.nextLine();
            dni= in.nextInt();
            edad=in.nextInt();
            partidos=in.nextInt();
            goles=in.nextInt();
            jugadores[i]= new Jugador(nombre,dni,edad,partidos,goles);
        }
        System.out.println("Jugadores que jugaron mas de 100 partidos: " + Mas100Partidos(jugadores)); 
    }

    public static int Mas100Partidos(Jugador [] jugadores){
        int cant=0;
        for(int i =0 ; i < jugadores.length; i++){
            if (jugadores[i].getPartidos() > 100){
                cant++;
            }
        }
        return cant;
    }
}