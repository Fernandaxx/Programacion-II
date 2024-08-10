import java.util.Scanner;

public class Ejer3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese un numero");
        int num = in.nextInt();
        int fact = 1;
        for (int j = 1; j <= num; j++) {
        fact = fact*j;
        }
        System.out.println(num + "! = "  + fact );
    
}
}