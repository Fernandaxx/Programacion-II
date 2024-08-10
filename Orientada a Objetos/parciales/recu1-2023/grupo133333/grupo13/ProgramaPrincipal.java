import java.util.Scanner;
public class ProgramaPrincipal{
    public static void main (String [] args){
        Scanner in = new Scanner (System.in);
        System.out.println(" ");
        MateriaAprobada [] materias = new MateriaAprobada[5];

        Alumno alumno1= new Alumno("02931/2","Fernanda","Avila");
        materias[0] = ingresoCursada("I102","Primero",alumno1,4);

        Alumno alumno2= new Alumno("02922/2","lu","Acuña");
        materias[1] = ingresoCursada("I102","Primero",alumno2,8);
        
        
        Fecha fecha1 = new Fecha (15,8,2022);
        materias[2] = new Final(true,10,fecha1,"I102","Segundo", alumno1);
        
        Fecha fecha2 = new Fecha (18,8,2022);
        materias[3] =new Final(true,9,fecha2,"I102","Primero", alumno2);
        
        materias[4] = new Final(false, 8, 17, 3, 2023, "I102", "Segundo",alumno1);
        
        double promedio =0;
        for(int i =0; i<materias.length ;i++){
            System.out.println(materias[i].toString());
            promedio += materias[i].promedioNotas();
        }
        System.out.println(" Promedio de notas "+ promedio/5);
        
    }

    public static Cursadas ingresoCursada(String codigo,String semestre, Alumno alumno, int cantNotas){
        Cursadas aux = new Cursadas(codigo,semestre,alumno);
        boolean flag= true;
        int i =0;
        while (flag && i<cantNotas) {
            flag = aux.cargarNotas(9);
            i++;
        }
        return aux;
    }
    

}