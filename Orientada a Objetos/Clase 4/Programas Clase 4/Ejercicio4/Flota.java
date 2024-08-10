public class Flota{
    private Micro [] micros;
    private int cantMicros;

    public Flota(){
        this.cantMicros =0;
        this.micros = new Micro[15];

    }

    public int getCantMicros (){
        return cantMicros;
    }

    public boolean estaCompleta(){
        boolean aux=false;
        if (cantMicros == micros.length){
            aux = true;
        }
        return aux;
    }

    public void agregarMicro(Micro micro){
        if(!estaCompleta()){
            micros[cantMicros] = micro;
            cantMicros++;
        }
    }

    public void eliminarMicro(String patente){
        boolean encontre = false;
        int i=0, pos=-1;

        while(i < micros.length && !encontre){
            if(micros[i].getPatente().equals(patente)){
                encontre = true;
                pos =i;
            }
            i++;
        }
        if (encontre){
            micros[pos] = null;
            cantMicros--;
        }

    }

    public Micro buscarMicroPorPatente (String patente){
        Micro aux= null;
        boolean encontre =false;
        int i = 0, pos =-1;
        while (i < micros.length && !encontre){
            if(this.micros[i].getPatente().equals(patente)){
                encontre=true;
                aux=micros[i];
            }
            i++;
        }
        return aux;
    }

    public Micro buscarMicroPorDestino (String destino){
        Micro aux= null;
        boolean encontre =false;
        int i = 0, pos =-1;
        while (i < micros.length && !encontre){
            if(micros[i].getDestino().equals(destino) ){
                encontre=true;
                aux=micros[i];
            }
            i++;
        }
        return aux;
    }
}