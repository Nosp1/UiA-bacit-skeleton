package modell;
//Her har vi laget en modell klasse for Ansatt

public class Ansatt {
    int id;
    string navn;
    string email;
    string telefon;
    string passord;
    boolean sertifisert;
    boolean union;

    public Ansatt(){

    }

    public Ansatt (int id, String navn, String, email, String telefon, String passord,
                   boolean sertifisert, boolean union){
        this.id = id;
        this.navn = navn;
        this.email = email;
        this.telefon = telefon;
        this.passord = passord;
        this.sertifisert = sertifisert;
        this.union = union;
    }

    //gettere og settere

    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }

    public string getNavn(){
        return navn;
    }
    public void setNavn(string navn){
        this.navn = navn;
    }

    public string getEmail(){
        return email;
    }
    public void setEmail(string email){
        this.email = email;
    }

    public string getTelefon(){
        return telefon;
    }
    public void setTelefon(string telefon){
        this.telefon = telefon;
    }

    public string getPassord(){
        return passord;
    }
    public void setPassord(string passord){
        this.passord = passord;
    }

    public boolean getSertifisert(){
        return sertifisert;
    }
    public void setSertifisert(boolean sertifisert){
        this.sertifisert = sertifisert;
    }

    public boolean getUnion(){
        return union;
    }
    public void setUniont id){
        this.union = union;
    }



}