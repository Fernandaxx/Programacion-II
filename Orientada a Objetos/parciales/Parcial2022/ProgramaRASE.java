import java.util.Scanner;
public class ProgramaRASE{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Solicitud [] solicitudes = new Solicitud[3];
        for(int i = 0; i < solicitudes.length;i++){
            solicitudes[i] = cargarSolicitud(in);
        }
        for (int i = 0; i < solicitudes.length;i++){
           System.out.println ("listado");
           System.out.println(solicitudes[i].toString() + solicitudes[i].ValorTarifaSubsidiada() );
            
        }
    }

    public static Solicitud cargarSolicitud(Scanner in){
        Solicitud solicitud = null;
        String numGestion;String fecha;double ingresosMensuales;int cantIntegrantesFam;String region;Persona persona; // variables solicitud
        String nombreApellido; int CUIT; // variables persona
        System.out.println ("persona: nombre y apellido (junto) - CUIT");
        nombreApellido= in.next();
        in.nextLine();
        CUIT = in.nextInt();
        persona = new Persona(nombreApellido,CUIT);
        System.out.println ("Ingrese numero gestion , fecha, ingresos mensuales , integrantes familia, region");
        numGestion = in.next();
        in.nextLine();
        fecha=in.next();
        in.nextLine();
        ingresosMensuales = in.nextDouble();
        cantIntegrantesFam =in.nextInt();
        region = in.next();
        in.nextLine();
        int opcion ;
        System.out.println ("(1) Solicitud gas natural , (2) Solicutud Energia electrica");
        opcion = in.nextInt();
        switch (opcion){
            case 1 :
                int numMedidor;double tamañoHogar;int cantCalefactores;
                System.out.println ("ingrese numero medidor, tamaño vivienda, cantidad de calefactores");
                numMedidor = in.nextInt();
                tamañoHogar= in.nextDouble();
                cantCalefactores = in.nextInt();
                solicitud= new GasNatural(numMedidor,tamañoHogar,cantCalefactores,numGestion,fecha, ingresosMensuales,cantIntegrantesFam,region, persona);
                break;
            case 2: 
                int NIS; int cantElectrodomesticos;
                System.out.println ("ingrese NIS y cantidad electrodomesticos");
                NIS = in.nextInt();
                cantElectrodomesticos=in.nextInt();
                solicitud = new EnergiaElectrica(NIS,cantElectrodomesticos,numGestion,fecha, ingresosMensuales,cantIntegrantesFam,region, persona);
                break;
        }
        return solicitud;
    }
}