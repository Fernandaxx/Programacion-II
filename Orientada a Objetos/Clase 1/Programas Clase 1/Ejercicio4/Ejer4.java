import java.util.Scanner;

public class Ejer4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        for (int i = 1; i <= 9; i=i+2) {
            int fact = 1;
            for (int j = 1; j <= i; j++) {
                fact = fact * j;
            }
            System.out.println(i + "! = " + fact);
        }
        in.close();
    }
}