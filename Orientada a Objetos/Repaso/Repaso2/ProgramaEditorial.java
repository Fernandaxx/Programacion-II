import java.util.Scanner;
public class ProgramaEditorial{
    private static final int dimF = 1000;
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);

        Ejemplar [] ejemplares = new Ejemplar[dimF];
        int dimL = 0;

        System.out.println("Desea ingresar un ejemplar? (SI/NO: ");
        String fin = in.next();
        while (fin.equals("SI") && dimL < dimF){
            ejemplares[dimL] = leerEjemplar(in);
            dimL++;

            System.out.println();
            System.out.println("Desea ingresar un ejemplar? (SI/NO: ");
            fin = in.next();
        }

        System.out.println("Finalizo la carga de ejemplares\n");

    }

    public static Ejemplar leerEjemplar (Scanner in){
        Ejemplar ejemplar = null;
        String tipoEjemplar;
        String resumen;
        int anio, cant;
        String nombreRev, nombreLibro;
        int cantArt, cantCap;
        String rta;
        boolean bolsillo;
        System.out.println("Ingrese codigo identificatorio: ");

        Responsable resp = leerResponsable(in);

        if(tipoEjemplar.equals("Revista")){
            System.out.println("nombre de la revista");
            nombreRev = in.next();
            System.out.println("cantidad articulos");
            cantArt = in.nextInt();

            System.out.println("La revista fue publicada? (SI/NO)");
            rta = in.next();
            anio =0;
            if(rta.equals("SI")){
                System.out.println("año de publicacion");
                anio = in.nextInt();
            }
            ejemplar = new Revista(nombreRev,cantArt,cod,cant,resumen,anio,resp);
        }
        else
        if(tipoEjemplar.equals("Libro")){
            System.out.println("titulo libro");
            nombreLibro = in.next();
            System.out.println("cantidad capitulos");
            cantCap = in.nextInt();
            System.out.println("edicion de bolsillo? (SI/NO)");
            rta= in.next();
            bolsillo = rta.equals("SI");
            System.out.println("El libro fue publicado? (SI/NO)");
            rta = in.next();
            anio =0;
            if(rta.equals("SI")){
                System.out.println("año de publicacion");
                anio = in.nextInt();
            }
            ejemplar = new Libro(nombreLibro,cantCap,bolsillo,cod,cant,resumen,anio,resp);
        }
        return ejemplar;
    }

    public static Responsable leerResponsable (Scanner in){
        System.out.println("info del responsable");
        system.out.println(" ingrese dni, nombre y Apellido (junto)");
        int dni = in.nextInt();
        String NomApellido = in.next();

        return new Responsable(dni, nomApellido);
    }

}
