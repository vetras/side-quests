package mr.fields;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import mr.fields.quotes.math.MathQuotes;

public class MathQuotesTests extends TestCase {

    public MathQuotesTests(String testName) {
        super(testName);
    }

    public static Test suite() {
        return new TestSuite(MathQuotesTests.class);
    }

    public void testAllMathQuotesStartWithTheSamePrefix() {
        var sut = new MathQuotes();
        for (int i = 0; i < 100; i++) {
            assertTrue(sut.getQuote().startsWith("\"Math "));
        }
    }
}
