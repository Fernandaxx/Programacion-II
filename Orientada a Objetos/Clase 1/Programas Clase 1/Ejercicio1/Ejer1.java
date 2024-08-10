import java.util.Scanner;

public class Ejer1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese Lado a");
        double a = in.nextDouble();
        System.out.println("Ingrese Lado b");
        double b = in.nextDouble();
        System.out.println("Ingrese Lado c");
        double c = in.nextDouble();
        if (a < b + c && b < a + c && c < a + b) {
            double Perimetro = a + b + c;
            System.out.println("Perimetro del triangulo: " + Perimetro);
        }
        in.close();

    }
}