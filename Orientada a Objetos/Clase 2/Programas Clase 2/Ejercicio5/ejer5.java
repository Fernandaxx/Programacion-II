import java.util.Scanner;
public class ejer5 {
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        String [] vector = new String[10];
        for (int i = 0; i < vector.length; i++){
            System.out.println("Ingrese una palabra");
            vector[i] = in.next();
        }
        System.out.println("PALABRA ESCONDIDA");
        for (int i = 0; i < vector.length; i++){
            System.out.print(vector[i].charAt(0));
        }
        
    }
}
