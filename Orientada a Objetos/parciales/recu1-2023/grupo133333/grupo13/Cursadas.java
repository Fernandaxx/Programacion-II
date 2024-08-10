public class Cursadas extends MateriaAprobada {
    private int [] notas;
    private int diml;

    public Cursadas(String codigo, String semestre, Alumno alumno) {
        super(codigo, semestre, alumno);
        this.notas = new int[8];
        this.diml = 0;
    }

    public Cursadas(){}

    public int getDiml() {
        return this.diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public boolean cargarNotas(int nota){ //este modulo retornara falso cuando la dimL sea igual a la long del array y por ende ya no se puedan cargar notas
        if (this.diml < this.notas.length){
            this.notas[diml] = nota;
            diml++;
            return true;
        }else return false;
    }

    public double promedio(){
        double cont=0;
        for(int i =0 ; i<this.diml;i++){
            cont += this.notas[i];
        }
        return cont/this.diml;
    }

    public double promedioNotas() {
        double aux = 0;
        if (this.diml > 0) {
            if (this.diml >= 5 && this.diml <= 8) {
                aux = promedio();
            } else if (this.diml <= 4) {
                aux = 4;
            }
        }
        return aux;
    }

    public String toString (){
        String aux;
        aux = "DATOS CURSADA "+ super.toString(); 
        for (int i = 0; i<this.diml; i++){
            aux += "\n"+ "nota "  +  this.notas[i];
        }
        return aux;
    }
}
