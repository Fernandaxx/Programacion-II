import java.util.Scanner;
public class Ejer7 {
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        int cierre = 1;
        int [] contador = new int [5];
        for (int i =0; i< contador.length; i++){
            contador[i] = 0;
        }
        while(cierre != 999) { 
            System.out.println("Bienvenido que operacion desea realizar:");
            System.out.println("0 : Cobro de cheque");
            System.out.println("1: Deposito");
            System.out.println("2: Pago de impuestos o Servicios");
            System.out.println("3: Cobro de jubilacion");
            System.out.println("4: Cobro de planes");
            int n = in.nextInt();
            switch(n){
                case 0: contador[0]++;break;
                case 1: contador[1]++;break;
                case 2: contador[2]++;break;
                case 3: contador[3]++;break;
                case 4: contador[4]++;break;
            }
            System.out.println("Si desea cerrar la caja ingrese 999");
            cierre = in.nextInt();
        }
        int max = 0;
        int operacion = -1;
        for (int i =0; i< contador.length; i++){
            System.out.println("Cantida de personas atendidas de la operacion "+ i +" "+ contador[i]);
            if (contador[i] > max){
                max = contador[i];
                operacion = i;
            }
        }
        System.out.println("La operacion " + operacion + " fue la mas solicitada");
    }
}