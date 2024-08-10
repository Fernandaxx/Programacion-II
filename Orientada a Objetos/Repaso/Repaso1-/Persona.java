public abstract class Persona{
    private String nombre;
    private char sexo;
    private int edad;

    public Persona(String nombre, char sexo, int edad){
        this.nombre = nombre;
        this.sexo = sexo;
        this.edad = edad;
    }

    public Persona(){

    }

    public void setNombre (String nombre){
        this.nombre = nombre;
    }

    public void setSexo (char sexo){
        this.sexo = sexo;
    }

    public void setEdad (int edad){
        this.edad = edad;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public char getSexo(){
        return this.sexo;    
    }
    
    public int getEdad(){
        return this.edad;
    }
    
    public String toString(){
        String aux = " Mi nombre es " + this.nombre + " sexo " + this.sexo + " Edad " + this.edad;
        return aux;
    }
    
    public abstract boolean disponibilidad();
}