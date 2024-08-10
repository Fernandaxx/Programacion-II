import java.util.Scanner;
public class ProgramaPrincipal{
    public static void main (String [] args){
        Scanner in = new Scanner (System.in);
        System.out.println("INICIO");
        
        Fecha fecha = new Fecha (3,8,2023);
        Show show = new Show(13,fecha,true);
        
        Comprador comprador1 = new Comprador(98888,"fer","avila");
        VIP vip1 = new VIP(true,54862,15,3,3,"B","Credito",comprador1);
        show.agregarLocalidad(vip1);
        
        Comprador comprador2 = new Comprador(98888,"fer","avila");
        VIP vip2 = new VIP(true,54862,15,9,8,"B","Debito",comprador2);
        show.agregarLocalidad(vip2);
        
        Comprador comprador3 = new Comprador(98888,"fer","avila");
        Comunes comun1= new Comunes("Fisica",500,15,5,8,"B","Credito",comprador3);
        show.agregarLocalidad(comun1);
        
        Comprador comprador4 = new Comprador(98888,"fer","avila");
        Comunes comun2= new Comunes("Digital",500,15,5,8,"B","Debito",comprador4);
        show.agregarLocalidad(comun2);
        
        System.out.println(show.toString());
        System.out.println(show.montoTotalLocalidades());
        in.close();
        
        // para la carga manual falto hacer una condicion que verifique Si contrato la experiencia que el costo de la experiencia  sea 0
        
        
    }

 

}