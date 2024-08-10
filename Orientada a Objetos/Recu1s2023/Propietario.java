public class Propietario
{
    private String nombreApellido;
    private int cuit;
    
    public Propietario(){
    }
    
    public Propietario(String NombreApellido, int cuit){
        this.nombreApellido= nombreApellido;
        this.cuit=cuit;
    }
    
    public String toString(){
        String aux;
        aux=("  Nombre y apellido: "+this.nombreApellido +"  CUIT: " +this.cuit);
        return aux;
    }
}
