public class Comprador {
    private int dni;
    private String nombre;
    private String apellido;
   
    
    public Comprador(int dni, String nombre, String apellido){
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    public Comprador(){}
    
    public String toString(){
        return ("Comprador"+"\n"+"dni: "+ this.dni + "\n"+ "nombre:" + this.nombre +"\n"+ "apellido: " + this.apellido); 
    }
}
