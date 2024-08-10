import java.util.Scanner; // Importar funcionalidad para entrada

public class Demo2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in); // Declarar el scanner e indicar que se leerá desde teclado
        System.out.print("Ingrese edad: ");
        int edad = in.nextInt();
        System.out.print("Ingrese peso: ");
        double peso = in.nextDouble();
        System.out.print("Ingrese true o false: ");
        boolean tieneDueño = in.nextBoolean();
        System.out.print("Ingrese nombre: ");
        String nombre = in.next();
        in.nextLine(); // Para que lea el Enter del ingreso anterior y luego usar lectura por oración
        System.out.print("Ingrese descripción: ");
        String descripcion = in.nextLine();
        in.close(); // Cerrar el scanner
    }
}
