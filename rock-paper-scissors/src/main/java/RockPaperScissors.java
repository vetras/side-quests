public enum RockPaperScissors {
    None(0),
    Rock(1),
    Paper(2),
    Scissors(3);

    private final int value;

    RockPaperScissors(int value) {
        this.value = value;
    }

    private int[][] winnerMatrix = new int[][]{
            // R, P, S
            {0, 1, -1}, // Rock
            {-1, 0, 1}, // Paper
            {1, -1, 0}  // Scissors
    };

    public int DetermineWinner(RockPaperScissors other) {
        return winnerMatrix[this.value - 1][other.value - 1];
    }
}
