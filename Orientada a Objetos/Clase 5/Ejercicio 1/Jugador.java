public class Jugador extends Empleado {
    private int goles;
    private int partidos;

    public Jugador(String nombre, int dni, int edad, double sueldoBasico, int goles, int partidos){
        super(nombre,dni,edad,sueldoBasico);
        this.goles = goles;
        this.partidos = partidos;

    }

    public Jugador(){
    }

    public void setGoles (int goles){
        this.goles = goles;
    }

    public void setPartidos (int partidos){
        this.partidos= partidos;
    }

    public int getGoles(){
        return goles;
    }

    public int getPartidos(){
        return partidos;
    }

    public double calcularSueldo(){
        double promedio = goles/partidos;
        double sueldo=super.getSueldo();
        if(promedio > 0.5){
            sueldo = sueldo + super.getSueldo();
        }
        return sueldo;
    }

    public String toString(){
        String aux= super.toString() + "Sueldo: " + this.calcularSueldo();
        return aux;
    }
}