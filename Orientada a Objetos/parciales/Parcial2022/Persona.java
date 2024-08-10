public class Persona{
    private String nombreApellido;
    private int CUIT;
    
    public Persona(String nombreApellido, int CUIT){
        this.nombreApellido=nombreApellido;
        this.CUIT= CUIT;
    }
    
    public Persona(){
        
    }
    //getter y setters
    
    public String toString(){
        return "nombre y apellido: " + nombreApellido + " CUIT: " + CUIT;
    }
}