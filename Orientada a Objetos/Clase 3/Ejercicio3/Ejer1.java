import java.util.Scanner;

public class Ejer1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese nombre");
        String nombre = in.next();
        in.nextLine();
        System.out.println("Dni: ");
        int dni = in.nextInt();
        System.out.println("Edad: ");
        int edad = in.nextInt();
        System.out.println("Ingrese campeonatos ganados");
        int campeonatos = in.nextInt();
        System.out.println("Ingrese sueldo basico");
        double sueldo = in.nextDouble();
        Entrenador entrenador = new Entrenador(nombre,dni,edad,campeonatos,sueldo);
        System.out.println(entrenador.toString());
        System.out.println(entrenador.getSueldoACobrar());
    }
}