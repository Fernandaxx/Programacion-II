public class Micro{
    private String patente;
    private String destino;
    private String horaSalida;
    private int cantAsientosOcupados;
    private boolean [] asientosOcupados; // true - asiento ocupado

    public Micro(){

    }

    public Micro (String patente, String destino, String horaSalida){
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        asientosOcupados = new boolean[20];
        for(int i =0;i< asientosOcupados.length;i++){
            asientosOcupados[i]=false;
        }
        cantAsientosOcupados=0;
    }

    public String getPatente(){
        return patente;
    }

    public String getDestino(){
        return destino;
    }

    public String getHoraSalida(){
        return horaSalida;
    }

    public void setPatente(String patente){
        this.patente = patente;
    }

    public void setDestino(String destino){
        this.destino = destino;
    }

    public void setHoraSalida(String horaSalida){
        this.horaSalida = horaSalida;
    }

    public int getCantAsientosOcupados (){
        return cantAsientosOcupados;
    }

    public boolean microLleno (){
        boolean aux = false;
        if (cantAsientosOcupados == asientosOcupados.length){
            aux = true;
        }
        return aux;
    }

    public boolean validarAsiento(int numAsiento){
        boolean aux= false;
        if(numAsiento >=0 && numAsiento< asientosOcupados.length){
            aux=true;
        }
        return aux;
    }

    public boolean estadoAsiento (int numAsiento){ // true--> asiento libre
        boolean aux = false;
        if(validarAsiento(numAsiento)){
            if (!asientosOcupados[numAsiento]){
                aux = true;
            }
        }
        return aux;
    }

    public void ocuparAsiento (int numAsiento){
        if(validarAsiento(numAsiento)){
            asientosOcupados[numAsiento] = true;
            cantAsientosOcupados++;
        }
    }

    public void liberarAsiento (int numAsiento){
        if(validarAsiento(numAsiento)){
            asientosOcupados[numAsiento] = false;
            cantAsientosOcupados--;
        }
    }

    public int primerAsientoLibre (){
        int i=0;
        int pos=0;
        boolean encontre = false;
        while(i < asientosOcupados.length && !encontre){
            if(!asientosOcupados[i]){
                encontre=true;
                pos=i;
            }
            else{
                pos= -1;
            }
            i++;
        }
        return pos;
    }
}

