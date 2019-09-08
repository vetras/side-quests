import java.util.Random;

public class Player implements Runnable {
    private String name;

    public RockPaperScissors getChoice() {
        return choice;
    }

    private RockPaperScissors choice = RockPaperScissors.None;

    private final Random random = new Random();

    public void run() {

        // TODO use the random name genertor
        this.name = String.format("%d", Thread.currentThread().getId());

        ThinkingOnChoice();

        MakeAChoice();
    }

    private void MakeAChoice() {
        // random number between [0 - 2]
        int randomNum = random.nextInt(3);

        switch (randomNum) {
            case 0:
                choice = RockPaperScissors.Paper;
                break;
            case 1:
                choice = RockPaperScissors.Rock;
                break;
            case 2:
                choice = RockPaperScissors.Scissors;
                break;
        }
    }

    private void ThinkingOnChoice() {
        try {
            Thread.sleep(random.nextInt(11));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public String getName() {
        return name;
    }
}
