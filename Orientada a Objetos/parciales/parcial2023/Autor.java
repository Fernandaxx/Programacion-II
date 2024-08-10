public class Autor{
    private int dni;
    private String nombreApellido;
    private String nacionalidad;
    
    public Autor(int dni, String nombreApellido, String nacionalidad){
        this.dni= dni;
        this.nombreApellido =nombreApellido;
        this.nacionalidad = nacionalidad;
    }
    
    public Autor(){
        
    }
    public String getNacionalidad(){
        return nacionalidad;
    }
    public String toString(){
        String aux;
        aux="Nombre: "+this.nombreApellido + " DNI: "+this.dni+" Nacionalidad: "+this.nacionalidad;
        return aux;
    }
    
}