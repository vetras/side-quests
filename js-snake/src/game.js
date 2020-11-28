import constants from "./constants.js"
import Food from "./food.js"
import Snake from "./snake.js"

export default class Game {
    constructor(width, height, canvas) {
        this.tileSize = constants.TILE_SIZE;
        this.width = this.tileSize * Math.floor(width / this.tileSize);
        this.height = this.tileSize * Math.floor(height / this.tileSize);
        this.canvas = canvas;
        this.canvas.width = this.width;
        this.canvas.height = this.height;
        this.ctx = this.canvas.getContext("2d");
        this.currentGameLoop = null;
    }

    init() {
        console.log("Starting a new game");

        const spawnLocation = this.randomLocation();
        const food = new Food(spawnLocation, "red");
        const snake = new Snake(this.fixedLocation(), constants.SNAKE_COLOR);

        this.currentGameLoop = setInterval(()=> this.gameLoop(snake, food), 1000 / constants.FPS);
    }

    randomLocation() {
        const rows = this.width / this.tileSize;
        const cols = this.height / this.tileSize;
        const x = Math.floor(Math.random() * rows) * this.tileSize;
        const y = Math.floor(Math.random() * cols) * this.tileSize;
        return { x, y };
    }

    fixedLocation() {
        const x = this.tileSize * Math.floor(this.width / (2 * this.tileSize));
        const y = this.tileSize * Math.floor(this.height / (2 * this.tileSize));
        return { x, y };
    }

    gameLoop(snake, food) {

        if (snake.died()) {
            alert("GAME OVER!!!");
            //window.location.reload();
            clearInterval(this.currentGameLoop);
        }

        snake.checkBorderCollision(this.width, this.height);

        if (snake.eat()) {
            food = new Food(spawnLocation(), "red");
        }

        // re-draw everything
        this.ctx.clearRect(0, 0, this.width, this.height);
        food.draw(this.ctx);
        snake.draw(this.ctx);
        snake.move(this.ctx);
    }
}