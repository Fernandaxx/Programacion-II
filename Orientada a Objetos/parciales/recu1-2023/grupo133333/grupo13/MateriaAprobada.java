public abstract class MateriaAprobada{
    private String codigo;
    private String semestre;
    private Alumno alumno; 

    public MateriaAprobada(String codigo,String semestre, Alumno alumno){
        this.codigo = codigo; 
        this.semestre = semestre;
        this.alumno = alumno; 
    }

    public MateriaAprobada(){}

    //Getters
    public String getSemestre(){
        return this.semestre;
    }   

    //Setters
    public void setSemestre(String semestre){
        this.semestre = semestre;
    }

    
    abstract double promedioNotas();

    public String toString(){
        String aux ="\n"+ NóminaDeMateriasIC.obtenerNombre(this.codigo) +"("+ this.codigo +")"+"\n" + "Semestre: " + this.semestre +"\n" + this.alumno.toString();
        return aux;
    }
}