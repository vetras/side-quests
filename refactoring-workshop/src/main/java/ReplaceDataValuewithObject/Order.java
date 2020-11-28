package ReplaceDataValuewithObject;

public class Order {
    private final String price;
    private final String customer;

    public Order(String customer, String price) {
        this.customer = customer;
        this.price = price;
    }

    public String print() {
        return String.format("%s placed an order of %s €", customer, price);
    }
}
