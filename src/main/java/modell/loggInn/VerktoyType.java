package modell.loggInn;

public class VerktoyType {
    private int ID;
    private String navn;
    private String bildePath;

    public VerktoyType(int ID, String navn, String bildePath){
        this.ID = ID;
        this.navn = navn;
        this.bildePath = bildePath;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public String getBildePath() {
        return bildePath;
    }

    public void setBildePath(String bildePath) {
        this.bildePath = bildePath;
    }
}

