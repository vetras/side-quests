namespace GameOfLife.Ui.Settings
{
    public class GameSettings
    {
        public GameBoard GameBoard;
    }

    public class GameBoard
    {
        public InitialState InitialState;
    }
    
    public class InitialState
    {
        public string FilePath;
    }
    
}