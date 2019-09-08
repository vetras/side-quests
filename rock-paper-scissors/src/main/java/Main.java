public class Main {
    public static void main(String args[]) {

        System.out.println("How many players?");
        // TODO

        int numberOfPlayers = 3;

        var controller = new Controller();

        controller.CreatePlayers(numberOfPlayers);

        controller.WaitForAllChoices();

        var winner = controller.WinnerIs();

        System.out.println(String.format("Winner is player {%s}", winner.getName()));

    }


}