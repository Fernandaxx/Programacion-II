import java.util.Scanner;
public class Ppal
{
    public static void main(String [] args){
       Scanner in = new Scanner(System.in);
        Entrenador entrenador = new Entrenador("pepito",30789768,38,30000.8,6);
        Jugador jugador = new Jugador("fran",30789768,38,30000.8,1,20);
        
        System.out.println (entrenador.toString());
        System.out.println (jugador.toString());
    }
}