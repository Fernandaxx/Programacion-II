import java.util.Scanner;
public class ProgramaEditorial{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Ejemplar [] ejemplares = new Ejemplar[4];

        System.out.println("Ingrese un numero o -1 para terminar");
        int n = in.nextInt();
        int cod, pag , anio;
        String resumen;
        Responsable responsable;
        int dni;
        String nombre;
        String apellido;
        int i=0;
        while (n != -1){
            int lor;
            System.out.println("Ingrese codigo identificatorio: ");
            cod = in.nextInt();
            System.out.println("Ingrese cantidad de paginas");
            pag= in.nextInt();
            System.out.println("Ingrese año de publicacion, si aun no se publico ingrese 0");
            anio= in.nextInt();
            System.out.println("Ingrese resumen del ejemplar");
            resumen = in.next();
            in.nextLine();
            System.out.println("Ingrese nombre del editor:");
            nombre= in.next();
            in.nextLine();
            System.out.println("Ingrese apellido del editor:");
            apellido= in.next();
            in.nextLine();
            System.out.println("Ingrese dni");
            dni=in.nextInt();
            responsable = new Responsable (dni,nombre,apellido);
            System.out.println("Si quiere cargar un libro ingrese 1, si quiere cargar una revista ingrese 2");
            lor= in.nextInt();
            if (lor == 1) {
                Libro libro;
                ejemplares[i]=leerLibro(cod,pag,anio,resumen,responsable);
            }
            else {
                if (lor == 2) {
                    ejemplares[i]=leerRevista(cod,pag,anio,resumen,responsable);
                }
                else break;
            }
            i++;
            System.out.println("Ingrese un numero o -1 para terminar");
            n = in.nextInt();
        }
    }

    public static Revista leerRevista(int cod,int pag,int anio,String resumen,Responsable responsable){
        Revista revista;
        Scanner in = new Scanner(System.in);
        String nombreRevista;
        int volumen;
        int articulos;
        System.out.println("Ingrese nombre,volumen y articulo");
        nombreRevista=in.next();
        in.nextLine();
        volumen =in.nextInt();
        articulos=in.nextInt();
        revista=new Revista(cod,pag,resumen,anio,responsable,nombreRevista,articulos,volumen);
        return revista;
    }

    public static Libro leerLibro(int cod,int pag,int anio,String resumen,Responsable responsable){
        Libro libro;
        Scanner in = new Scanner(System.in);
        String titulo;
        int cap;
        boolean bolsillo;
        System.out.println("Ingrese titulo, cantidad de capitulos y si es edicion de bolsillo (true o false)");
        titulo=in.next();
        in.nextLine();
        cap =in.nextInt();
        bolsillo=in.nextBoolean();
        libro=new Libro(cod,pag,resumen,anio,responsable,titulo,cap,bolsillo);
        return libro;
    }
    
    
    // si no se publico pregunta si es de bolsillo???
}