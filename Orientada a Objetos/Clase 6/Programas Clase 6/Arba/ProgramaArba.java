import java.util.Scanner;
public class ProgramaArba{
    public static void main(String [] args){
        Scanner in = new Scanner(System.in);
        Vehiculo [] vehiculo = new Vehiculo[2];
        for (int i = 0; i<vehiculo.length; i++){
            vehiculo[i]=leerVehiculo(in);
        }
        for(int i = 0; i<vehiculo.length;i++){
            System.out.println("Calculo del monto impuesto "+ vehiculo[i].CalcularCostoImpuestos());
            
        }
    }

    public static Vehiculo leerVehiculo (Scanner in){
        Vehiculo vehiculo= null;
        int opcion;
        int año;
        double importe;
        Propietario propietario;
        System.out.println("(1)_Automotor  (2)_Embarcacion");
        opcion = in.nextInt();
        while( opcion <1 || opcion > 2){
            System.out.println("(1)_Automotor  (2)_Embarcacion");
            opcion = in.nextInt();
        }
        propietario = leerPropietario(in);
        switch (opcion){
            case 1: 
                System.out.println("Ingrese datos del automotor: patente-descripcion-año-importe");
                String patente = in.next();
                in.nextLine();
                String descripcion = in.next();
                in.nextLine();
                año = in.nextInt();
                importe= in.nextDouble(); 
                vehiculo= new Automotor(patente,descripcion,año,importe,propietario);
                break;
            case 2:
                int REY;String nombre;String tipo;double eslora;double tonelaje;int valor;
                System.out.println("Ingrese datos de la Embarcacion: Registro de yates-nombre-tipo de embarcacion- eslora- tonelaje - valor (int)- año-importe");
                REY= in.nextInt();
                nombre= in.next();
                in.nextLine();
                tipo = in.next();
                in.nextLine();
                eslora = in.nextDouble();
                tonelaje= in.nextDouble();
                valor = in.nextInt();
                año= in.nextInt();
                importe= in.nextDouble(); 
                vehiculo = new Embarcaciones(REY,nombre,tipo,eslora,tonelaje,valor,año,importe,propietario);
                break;
        }
        return vehiculo;
    }

    public static Propietario leerPropietario(Scanner in){
        String nombre;
        String apellido;
        int cit;
        System.out.println("Ingrese datos del propiertario: nombre-apellido-CIT");
        nombre= in.next();
        in.nextLine();
        apellido= in.next();
        in.nextLine();
        cit= in.nextInt();
        Propietario propietario = new Propietario(nombre,apellido,cit);
        return propietario;
    }
    
    
}