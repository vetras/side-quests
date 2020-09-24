package extractclass;

public class Person {
    private final String name;
    private final String officeAreaCode;
    private final String officeNumber;

    public Person(String name, String officeAreaCode, String officeNumber) {
        this.name = name;
        this.officeAreaCode = officeAreaCode;
        this.officeNumber = officeNumber;
    }

    public String getPhoneNumeber() {
        return String.format("%s %s", officeAreaCode, officeNumber);
    }

    public String getName() {
        return name;
    }
}
