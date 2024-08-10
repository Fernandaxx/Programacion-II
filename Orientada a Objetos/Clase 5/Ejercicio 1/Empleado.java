public abstract class Empleado{
    private String nombre;
    private int dni;
    private int edad;
    private double sueldoBasico;
    
    public Empleado (String nombre, int dni, int edad, double sueldoBasico){
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.sueldoBasico = sueldoBasico;
    }
    
    public Empleado(){

    }
    
    public String getNombre (){
        return nombre;
    }
        
    public int getDni (){
        return dni;
    }
    
    public int getEdad (){
        return edad;
    }
    
    public double getSueldo (){
        return sueldoBasico;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void setDni(int dni){
        this.dni = dni;
    }
    
    public void setEdad(int edad){
        this.edad = edad;
    }
    
    public void setSueldo(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public String toString(){
        String aux = "nombre: " + nombre;
        return aux;
    }
    
    
    public abstract double calcularSueldo();
    
    }
    