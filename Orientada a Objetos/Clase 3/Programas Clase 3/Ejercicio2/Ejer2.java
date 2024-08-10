import java.util.Scanner;

public class Ejer2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Inicio de compra: ");
        System.out.println("Ingrese Peso: ");
        double peso = in.nextDouble();
        Balanza balanza = new Balanza();

        while(peso != 0){
            System.out.println("Ingrese Precio: ");
            double precio = in.nextDouble();
            balanza.registrarProducto(peso,precio);
            System.out.println("Ingrese Peso: ");
            peso = in.nextDouble();
        }
        System.out.println(balanza.toString());
    }
}