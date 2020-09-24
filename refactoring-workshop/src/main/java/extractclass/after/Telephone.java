package extractclass.after;

public class Telephone {
    private final String officeAreaCode;
    private final String officeNumber;

    public Telephone(String officeAreaCode, String officeNumber) {
        this.officeAreaCode = officeAreaCode;
        this.officeNumber = officeNumber;
    }

    public String getOfficeAreaCode() {
        return officeAreaCode;
    }

    public String getOfficeNumber() {
        return officeNumber;
    }
}