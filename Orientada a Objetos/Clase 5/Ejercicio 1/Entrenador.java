public class  Entrenador extends Empleado {
    
    private int campGanados;
    
    public Entrenador (String nombre, int dni, int edad, double sueldoBasico, int campGanados ){
        super(nombre,dni,edad,sueldoBasico);
        this.campGanados = campGanados;
    }
    
    public Entrenador(){

    }
    
    public int getCampGanados (){
        return campGanados;
    }
    
    public void setCampGanados( int campGanados){
        this.campGanados = campGanados;
    }
    
    public double calcularSueldo(){
        double sueldo= super.getSueldo();
        if (campGanados < 5 && campGanados > 0){
            sueldo=sueldo+5000;
        }
        if (campGanados > 4 && campGanados < 11){
            sueldo=sueldo+30000;
        }
        if (campGanados >10) {
            sueldo=sueldo+50000;
        }
        return sueldo;
    }
    
    public String toString(){
        String aux;
        aux= super.toString()+" sueldo total: "+ this.calcularSueldo();
        return aux;
    }
    
    }
