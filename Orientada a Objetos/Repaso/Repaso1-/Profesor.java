public class Profesor extends Persona{
    private String materia;

    public Profesor (String materia,String nombre, char sexo, int edad){
        super(nombre,sexo,edad);
        this.materia =  materia;
    }

    public Profesor (){

    }
    
    public void setMateria(String materia){
        this.materia = materia;
    }
    
    public String getMateria(){
        return this.materia;
    }
    
    public String toString(){
        String aux = " Materia " + materia + super.toString();
        return aux;
    }
    
    
}