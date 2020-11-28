import constants from "./constants.js"

export default class Food {
    constructor(pos, color) {
        this.x = pos.x;
        this.y = pos.y;
        this.color = color;
    }

    draw(ctx) {
        ctx.beginPath();
        ctx.rect(this.x, this.y, constants.TILE_SIZE, constants.TILE_SIZE);
        ctx.fillStyle = this.color;
        ctx.fill();
        ctx.strokeStyle = "black";
        ctx.lineWidth = 3;
        ctx.stroke();
        ctx.closePath();
    }
}