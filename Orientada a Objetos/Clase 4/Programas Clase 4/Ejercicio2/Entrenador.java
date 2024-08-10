public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatos; 
    private int DNI;
    private int edad;

    public Entrenador(String nombre,double sueldoBasico, int campeonatos){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.campeonatos = campeonatos; 

    }

    public Entrenador(){

    }

    public double SueldoBasico() {
        return sueldoBasico;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getSueldoACobrar(){
        double sueldo= sueldoBasico;
        if (campeonatos < 5 && campeonatos > 0){
            sueldo=sueldo+5000;
        }
        if (campeonatos > 4 && campeonatos < 11){
            sueldo=sueldo+30000;
        }
        if (campeonatos >10) {
            sueldo=sueldo+50000;
        }
        return sueldo;
    }

    public String toString(){
    String aux; 
    aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años, gane "+campeonatos+" campeonatos";
    return aux;
    }
}

