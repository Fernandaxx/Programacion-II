public class Show{
    private int numShow; 
    private Fecha fecha;
    private boolean agotados;
    private Localidad [] localidades;
    private int diml;

    public Show(int numShow, Fecha fecha, boolean agotados){
        this.numShow = numShow; 
        this.fecha = fecha;
        this.agotados = agotados;
        this.localidades = new Localidad[10];
        this.diml =0;
    }

    public Show(){}

    //Getters
    
    public Fecha getFecha(){
        return this.fecha;
    }
    
    public int getDiml(){
        return this.diml;
    }  


    public boolean agregarLocalidad (Localidad l){
        if (this.diml < localidades.length){
            localidades[diml] = l;
            diml++;
            return true;
        }
        else return false;
    }

    public double  montoTotalLocalidades() {
        double total=0;
        boolean exito =false;
        if(fecha.getAño() == 2023 ){
                if(fecha.getMes() == 8){
                    if(fecha.getDia() == 3 || fecha.getDia() == 4) {
                        exito =true;
                    }
            }
        }
        for (int i = 0; i<this.localidades.length; i++){
            total += localidades[i].montoTotal();
            if(exito){
                total-= localidades[i].montoTotal() * 0.035;
            }
        }
        return total;
    }

    public String toString(){
        String aux =" numero show: "+ this.numShow +"\n" + "estan agotadas todas las localidades: " + this.agotados +"\n" + this.fecha.toString();
        for (int i = 0; i<this.diml; i++){
            aux += "\n"+ "Localidad " + i +  this.localidades[i].toString();
        }
        return aux;
    }
}