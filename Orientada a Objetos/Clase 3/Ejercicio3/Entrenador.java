public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatos; 
    private int DNI;
    private int edad;

    public Entrenador(String unNombre,int unDNI, int unaEdad,int unosCampeonatos,double unSueldoBasico){
        nombre = unNombre;
        sueldoBasico = unSueldoBasico;
        campeonatos = unosCampeonatos; 
        edad =unaEdad;
        DNI=unDNI;
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

    public void setSueldoBasico(double unSueldoBasico) {
        sueldoBasico = unSueldoBasico;
    }

    public void setCampeonatos(int unosCampeonatos) {
        campeonatos = unosCampeonatos;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
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

