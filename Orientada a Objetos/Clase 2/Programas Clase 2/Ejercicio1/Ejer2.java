import java.util.Scanner;

public class Ejer2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Persona p;
        Persona[] vector = new Persona[3];
        for (int i = 0; i < vector.length; i++) {
            p = new Persona();
            System.out.println("Nombre: ");
            String nombre = in.next();
            in.nextLine();
            System.out.println("Dni: ");
            int dni = in.nextInt();
            System.out.println("Edad: ");
            int edad = in.nextInt();
            p.setNombre(nombre);
            p.setDNI(dni);
            p.setEdad(edad);
            vector[i] = p;
        }
        for (int i = 0; i < vector.length; i++) {
            System.out.print(vector[i].toString());
        }
        System.out.println();
        System.out.println("Mayores a 65 " + getMayores65(vector));
        System.out.println("Persona con menor dni: " + getPersonaMenorDNI(vector).toString());
    }

    public static int getMayores65(Persona[] vec) {
        int cant = 0;
        for (int i = 0; i < vec.length; i++) {
            if (vec[i].getEdad() > 65) {
                cant++;
            }
        }
        return cant;
    }

    public static String getPersonaMenorDNI(Persona[] vec) {
        int menor = 999999999;
        for (int i = 0; i < vec.length; i++) {
            if (vec[i].getDNI() < menor) {
                menor = i;
            }
        }
        return vec[menor].toString();
    }
}