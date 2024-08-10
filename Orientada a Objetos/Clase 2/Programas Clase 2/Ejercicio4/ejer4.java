import java.util.Scanner;
public class ejer4{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        Partido partido; // crear el objeto y reserva espacio
        Partido [] vector = new Partido[3];
        for (int i =0 ; i < vector.length; i++){
            partido = new Partido();
            System.out.println("Equipo local: ");
            String local = in.next();
            in.nextLine();
            partido.setLocal(local);
            System.out.println("Equipo visitante: ");
            String visitante = in.next();
            in.nextLine();
            partido.setVisitante(visitante);
            System.out.println("Cantidad de goles del equipo Local: ");
            int golLocal = in.nextInt();
            partido.setGolesLocal(golLocal);
            System.out.println("Cantidad de goles del equipo visitante:" );
            int golVisitante = in.nextInt();
            partido.setGolesVisitante(golVisitante);
            vector[i] = partido;
        }
        System.out.println("Cantidad de partidos que gano River: " + getGanadosRiver(vector));
        System.out.println("Cantidad de goles que hizo Boca con Equipo Local: "+  getGolesBocaLocal(vector));
        System.out.println("Porcentaje de partidos empatados: " + getPorcentajeEmpate(vector));
    }

    public static int getGanadosRiver (Partido [] vector){
        int cant =0;
        for (int i =0 ; i < vector.length; i++){
            if (vector[i].getGanador().equals ("River")){
                cant++;
            }   
        }
        return cant;
    }

    public static int getGolesBocaLocal (Partido [] vector){
        int goles =0;
        for (int i =0 ; i < vector.length; i++){
            if (vector[i].getLocal().equals("Boca")){
                goles = goles + vector[i].getGolesLocal();
            }
        }
        return goles;
    }

    public static double getPorcentajeEmpate (Partido [] vector){
        double empates =0;
        for (int i =0 ; i < vector.length; i++){
            if (vector[i].hayEmpate()){
                empates++;
            }
        }
        return (empates * 100 / vector.length);    
    }
}