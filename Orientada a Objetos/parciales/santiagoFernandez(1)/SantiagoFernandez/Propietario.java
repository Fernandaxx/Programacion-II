public class Propietario {

    private String cuit;
    private String nombre;
    private String apellido;
    
    public Propietario(String cuit, String nombre, String apellido){
        this.cuit = cuit;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    public Propietario(){}
    
    public String toString(){
        return ("DATOS DEL PROPIETARIO"+"\n"+"Cuit: "+ this.cuit + "\n"+ "Nombre:" + this.nombre +"\n"+ "Apellido: " + this.apellido); 
    }
}