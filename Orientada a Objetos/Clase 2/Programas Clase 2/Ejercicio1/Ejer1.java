import java.util.Scanner;

public class Ejer1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Persona p = new Persona();
        System.out.println("Nombre: ");
        String nombre = in.nextLine();
        System.out.println("Dni: ");
        int dni = in.nextInt();
        System.out.println("Edad: ");
        int edad = in.nextInt();

        p.setNombre(nombre);
        p.setDNI(dni);
        p.setEdad(edad);

        System.out.println(p.toString());
    }
}