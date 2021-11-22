package modell.loggInn;

public class Booking {

        int BookingID;
        int VerktoyID;
        int AnsattID;
        String BookingStart;
        String BookingSlutt;
        String Status;

    public Booking(int bookingID, int verktoyID, int ansattID, String bookingStart,
                   String bookingSlutt, String status) {
        BookingID = bookingID;
        VerktoyID = verktoyID;
        AnsattID = ansattID;
        BookingStart = bookingStart;
        BookingSlutt = bookingSlutt;
        Status = status;
    }

    public Booking() {

    }

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int bookingID) {
        BookingID = bookingID;
    }

    public int getVerktoyID() {
        return VerktoyID;
    }

    public void setVerktoyID(int verktoyID) {
        VerktoyID = verktoyID;
    }

    public int getAnsattID() {
        return AnsattID;
    }

    public void setAnsattID(int ansattID) {
        AnsattID = ansattID;
    }

    public String getBookingStart() {
        return BookingStart;
    }

    public void setBookingStart(String bookingStart) {
        BookingStart = bookingStart;
    }

    public String getBookingSlutt() {
        return BookingSlutt;
    }

    public void setBookingSlutt(String bookingSlutt) {
        BookingSlutt = bookingSlutt;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }
}
