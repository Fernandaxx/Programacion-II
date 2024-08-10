public class Jugador {
    private String nombre;
    private int DNI;
    private int edad; 
    private int partidos;
    private int goles;
    
    public Jugador(String unNombre, int unDNI, int unaEdad, int cantPartidos, int cantGoles){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
        partidos= cantPartidos;
        goles= cantGoles;
    }
    
    public Jugador(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }
    
    public int getPartidos() {
        return partidos;
    }
    
    public int getGoles() {
        return goles;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public void setPartidos(int cantPartidos) {
        partidos=cantPartidos;
    }
    
    public void setGoles(int cantGoles) {
        goles = cantGoles;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años, hice " + goles + " goles en "+ partidos + " Partidos." ;
        return aux;
    }
}
