package ReplaceDataValuewithObject;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class OrderTest {

    @Test
    void print() {
        var order = new Order("Barbosa", "100");

        Assertions.assertEquals(order.print(), "Barbosa placed an order of 100 €");
    }
}