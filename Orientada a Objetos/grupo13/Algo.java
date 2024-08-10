public class Algo
{
    private int ;
    private double  ;
    private String  ;
    
    public Algo(){
        
    }
    
    public Algo(   ){
        super();
        this. ;
        
    }
    
    //    get:
    
    public String get (String ){
        return this. ;
    }
    public int get(int ){
        return this. ;
    }
    public double get(double ){
        return this. ;
    }
    public boolean get(boolean ){
        return this. ;
    }
    
    //  set:
    
    public void set(String ){
        this. ;
    }
    public void set(int ){
        this. ;
    }
    public void set(double ){
        this. ;
    }
    public void set(boolean ){
        this. ;
    }
    
    
    public String toString(){
        String aux;
        aux= " ";
        return aux;
    }
    
    public String toString(){ //en las subclases
        String aux;
        aux= (super.toString()+ " ");
        for (int i=0; i<VECTOR.length; i++){
            aux+=("  : "+ VECTOR[i].toString() ) ;
        }
        return aux;
    }
    

}
