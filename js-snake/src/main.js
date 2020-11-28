import Game from "./game.js"

window.addEventListener("load", function () {

    const canvas = document.getElementById("game-area");

    const game = new Game(window.innerWidth, window.innerHeight, canvas);
    game.init();

});