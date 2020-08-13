package mr.fields.quotes.math;

import java.util.Random;

public class MathQuotes {
    private final String[] quotes = new String[]{
            "\"Math To iterate is human, to recurse divine.\"\n" +
                    "- L. Peter Deutsch",
            "\"Math Don't worry if it doesn't work right. If everything did, you'd be out of a job.\"\n" +
                    "- Mosher's Law of Software Engineering",
            "\"Math Good design adds value faster than it adds cost.\"\n" +
                    "- Thomas C. Gale",
            "\"Math Talk is cheap. Show me the code.\"\n" +
                    "- Linus Torvalds",
            "\"Math I don't care if it works on your machine! We are not shipping your machine!\"\n" +
                    "- Vidiu Platon",
    };
    private final Random rand = new Random();

    private int getRandomIndex() {
        return rand.nextInt(quotes.length);
    }

    public String getQuote() {
        return quotes[getRandomIndex()];
    }
}