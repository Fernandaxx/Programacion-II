public class Alumno extends Persona{
    private int nota;
    
    public Alumno (int nota,String nombre, char sexo, int edad){
        super(nombre,sexo,edad);
        this.nota =  nota;
    }
    
    public Alumno(){
        
    }
    
    public void setNota(int nota){
        this.nota = nota;
    }
    
    public int getNota(){
        return this.nota;
    }
    
     public String toString(){
        String aux = " nota " + nota + super.toString();
        return aux;
    }
    
    public boolean disponibilidad(){
        
    }
}
