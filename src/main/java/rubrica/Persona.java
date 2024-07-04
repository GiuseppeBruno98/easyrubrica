package rubrica;

public class Persona {
    private int id;
    private String nome;
    private String cognome;
    private String indirizzo;
    private String telefono;
    private int eta;
    
    public Persona(int id,String nome, String cognome, String indirizzo, String telefono, int eta) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.indirizzo = indirizzo;
        this.telefono = telefono;
        this.eta = eta;
    }
    
    public int getId() {
        return id;
    }
    
    public String getNome() {
        return nome;
    }
    
    public String getCognome() {
        return cognome;
    }
    
    public String getIndirizzo() {
        return indirizzo;
    }
    
    public String getTelefono() {
        return telefono;
    }
    
    public int getEta() {
        return eta;
    }
    
}
