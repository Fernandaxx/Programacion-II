import java.util.Scanner;

public class Ejer2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese la patente");
        int Patente = in.nextInt();
        int Cant = 0;
        int total = 0;
        while (Patente != 0) {
            if (Patente % 2 == 0) {
                System.out.println("El auto tiene acceso permitido");
                Cant++;
            }
            total++;
            System.out.println("Ingrese la patente");
            Patente = in.nextInt();
        }
        double Porcentaje = Cant * 100.0 / total;
        System.out.println("Porcentaje de autos que ingresaron " + Porcentaje);
        in.close();
    }

}