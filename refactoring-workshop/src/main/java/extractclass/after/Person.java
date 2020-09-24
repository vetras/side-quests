package extractclass.after;

public class Person {
    private final Telephone telephone;
    private final String name;

    public Person(String name, String officeAreaCode, String officeNumber) {
        this.name = name;
        this.telephone = new Telephone(officeAreaCode, officeNumber);
    }

    public String getPhoneNumeber() {
        return String.format("%s %s", telephone.getOfficeAreaCode(), telephone.getOfficeNumber());
    }

    public String getName() {
        return name;
    }
}
