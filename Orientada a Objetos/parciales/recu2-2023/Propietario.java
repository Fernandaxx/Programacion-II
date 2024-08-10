public class Propietario{
    private int cuit;
    private String nombre;
    private String apellido;
    
    public Propietario(int cuit, String nombre, String apellido){
        this.cuit = cuit;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    public Propietario(){
        
    }
    
    public String toString(){
        String aux="DATOS DEL PROPIETARIO"+"\n"+"Cuit: "+ this.cuit + "\n"+ "Nombre:" + this.nombre +"\n"+ "Apellido: " + this.apellido;
        return aux;
    }
}