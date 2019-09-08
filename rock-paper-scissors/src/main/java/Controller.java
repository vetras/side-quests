import java.util.Arrays;
import java.util.Optional;

public class Controller {

    private Thread[] playerThreads = new Thread[0];
    private Player[] players = new Player[0];

    public void CreatePlayers(int numberOfPlayers) {
        playerThreads = new Thread[numberOfPlayers];
        players = new Player[numberOfPlayers];
        for (int i = 0; i < playerThreads.length; i++) {
            var p = new Player();
            players[i] = p;
            playerThreads[i] = new Thread(p);
            playerThreads[i].start();
        }
    }

    public void WaitForAllChoices() {
        for (int i = 0; i < playerThreads.length; i++) {
            try {
                playerThreads[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public Player WinnerIs() {
        Optional<Player> winner = Arrays.stream(players).reduce((playerA, playerB) -> {
            var x = playerA.getChoice();
            var y = playerA.getChoice();
            int z = x.DetermineWinner(y);
            if (z < 0) return playerA;
            return playerB;
        });

        return winner.get();
    }
}
