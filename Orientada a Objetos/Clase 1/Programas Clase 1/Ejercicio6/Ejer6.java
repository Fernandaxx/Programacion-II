import java.util.Scanner;

public class Ejer6 {
    public static void main(String[] args) {
        int FilaColumna = 10;
        int[][] Matriz = new int[FilaColumna][FilaColumna];
        Scanner in = new Scanner(System.in);
        int cont = 0;
        for (int f = 0; f < FilaColumna; f++) {
            for (int c = 0; c < FilaColumna; c++) {
                Matriz[f][c] = cont;
                cont = cont + 2;
            }
        }
        for (int i = 0; i < FilaColumna; i++) {
            for (int j = 0; j < FilaColumna; j++) {
                System.out.print(Matriz[i][j] + "  ");
            }
            System.out.println();
        }
        int suma = 0;
        for (int a = 2; a < 9; a++) {
            for (int b = 0; b < 3; b++) {
                suma = suma + Matriz[a][b];
            }
        }
        System.out.println("SUMA:" + suma);
        int[] Vector = new int[FilaColumna];
        for (int d = 0; d < FilaColumna; d++) {
            Vector[d] = 0;
            for (int g = 0; g < FilaColumna; g++) {
                Vector[d] = Vector[d] + Matriz[g][d];
            }
        }
        for (int k = 0; k < FilaColumna; k++) {
            System.out.print(Vector[k] + " | ");
        }
        System.out.println();
        System.out.println("Ingrese un numero a buscar: ");
        int num = in.nextInt();
        boolean Encontre = false;
        int Fila = -1;
        int Columna = -1;
        for (int q = 0; q < FilaColumna; q++) {
            for (int m = 0; m < FilaColumna; m++) {
                if (Matriz[q][m] == num) {
                    Fila = q;
                    Columna = m;
                    Encontre = true;
                }
            }
            }
        }if(Encontre)

    {
        System.out.println("El dato se encuentra en fila " + Fila + " Columna " + Columna);
    }else
    {
        System.out.println("No se encontro el dato");
    }
}}