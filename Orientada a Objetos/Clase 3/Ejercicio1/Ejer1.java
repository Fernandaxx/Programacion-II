import java.util.Scanner;

public class Ejer1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese lado1");
        double lado1 = in.nextDouble();
        System.out.println("Ingrese lado2");
        double lado2 = in.nextDouble();
        System.out.println("Ingrese lado3");
        double lado3 = in.nextDouble();
        System.out.println("Ingrese Color de Relleno");
        String relleno = in.next();
        in.nextLine();
        System.out.println("Ingrese linea");
        String linea = in.next();
        in.nextLine();
        Triangulo triangulo = new Triangulo(relleno,linea,lado1,lado2,lado3);
        System.out.println("Perimetro "+ triangulo.getPerimetro());
        System.out.println("Area "+ triangulo.getArea());
    }
}