public class Final extends MateriaAprobada {
    private boolean promocion;
    private int nota;
    private Fecha fecha;

    public Final(boolean promocion, int nota,Fecha fecha,String codigo, String semestre, Alumno alumno ){
        super(codigo, semestre, alumno);
        this.promocion = promocion;
        this.nota = nota;
        this.fecha = fecha;
    }
    
    public Final(boolean promocion, int nota, int dia, int mes, int año, String codigo, String semestre, Alumno alumno) {
        super(codigo, semestre, alumno);
        this.promocion = promocion;
        this.nota = nota;
        this.fecha = new Fecha(dia, mes, año); // Crea un objeto Fecha directamente
    }

    public Final(){}

    private boolean verifica1(){
        boolean aux= false;
        if (super.getSemestre().equals("Primero")){
            if((this.fecha.getDia() == 15 && this.fecha.getMes() == 8 && this.fecha.getAño() == 2022) ||
            (this.fecha.getDia() == 17 && this.fecha.getMes() == 9 && this.fecha.getAño() == 2022)){
                aux= true;
            }
        }
        return aux;
    }

    

    private boolean verifica2(){
        boolean aux= false;
        if (super.getSemestre().equals("Segundo")){
            if((this.fecha.getDia() == 15 && this.fecha.getMes() == 2 && this.fecha.getAño() == 2023) || 
            (this.fecha.getDia() == 17 && this.fecha.getMes() == 3 && this.fecha.getAño() == 2023)) {
                aux= true;
            }
        }
        return aux;}

    public double promedioNotas() {
        double aux = this.nota;

        if (this.promocion) {
            aux += 2;
        } else if (verifica1() || verifica2()) {
            aux += 1;
        }

        return aux;
    }

    public String toString (){
        String aux;
        aux = super.toString() +"\n"+ "Final: "+"\n"+ "Obtuvo promocion : " + this.promocion + "\n"+ "Nota : " + this.nota + "\n"+ fecha.toString(); 
        return aux;
    }

}
