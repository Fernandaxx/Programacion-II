public class Responsable{
    private int dni;
    private String nombreApellido;
    
    public Responsable(int dni, String nombreApellido){
        this.dni = dni;
        this.nombreApellido = nombreApellido;
    }
    
    public Responsable(){
        
    }
    
    public String getNombreApellido(){
        return this.nombreApellido;
    }
    public int getDni(){
        return this.dni;
    }
    public void setNombreApellido(String nombreApellido){
        this.nombreApellido = nombreApellido;
    }
    public void setNombreApellido(int dni){
        this.dni = dni;
    }
    public String toString(){
        return nombreApellido + " Dni " + dni;
    }
}