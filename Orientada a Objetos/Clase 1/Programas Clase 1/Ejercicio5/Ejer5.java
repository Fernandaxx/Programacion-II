
import java.util.Scanner;

public class Ejer5 {
    public static void main(String[] args) {
        double[] VectorAlturas = new double[5];
        double suma = 0;
        double altura;
        Scanner in = new Scanner(System.in);
        for (int i = 0; i < VectorAlturas.length; i++) {
            System.out.println("Ingrese la altura del jugador: ");
            altura = in.nextDouble();
            suma = suma + altura;
            VectorAlturas[i] = altura;
        }
        double promedio = suma / VectorAlturas.length;
        System.out.println("Altura promedio: " + promedio);
        int cant = 0;
        for (int j = 0; j < VectorAlturas.length; j++) {
            if (VectorAlturas[j] > promedio) {
                cant++;
            }
        }
        System.out.println("Cantidad de jugadores con altura mayor al promedio: " + cant);
        in.close();
    }
}
