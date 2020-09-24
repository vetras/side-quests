import extractclass.Person;

public class Main {
    public static void main(String[] args) {
        System.out.println();
        System.out.println();
        System.out.println("Hello World");

        var p = new Person("Mr Fields", "351", "914571622");

        System.out.printf("I'm %s and my number is %s%nCall me maybe!", p.getName(), p.getPhoneNumeber());
        System.out.println();
        System.out.println();
    }
}
