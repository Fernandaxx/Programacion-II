public class Alumno {

    private String legajo;
    private String nombre;
    private String apellido;
    
    public Alumno(String legajo, String nombre, String apellido){
        this.legajo = legajo;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    public Alumno(){}
    
    public String toString(){
        return ("ALUMNO"+"\n"+"Legajo: "+ this.legajo + "\n"+ "nombre:" + this.nombre +"\n"+ "Apellido: " + this.apellido); 
    }
}