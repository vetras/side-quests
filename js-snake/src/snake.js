import constants from "./constants.js"

export default class Snake {
    constructor(pos, color) {
        this.x = pos.x;
        this.y = pos.y;
        this.tail = [{ x: pos.x - constants.TILE_SIZE, y: pos.y }, { x: pos.x - constants.TILE_SIZE * 2, y: pos.y }];
        this.velX = 1;
        this.velY = 0;
        this.color = color;
    }

    draw(ctx) {
        this.drawHead(ctx);
        this.drawBody(ctx);
    }

    drawHead(ctx) {
        ctx.beginPath();
        ctx.rect(this.x, this.y, constants.TILE_SIZE, constants.TILE_SIZE);
        ctx.fillStyle = this.color;
        ctx.fill();
        ctx.strokeStyle = "black";
        ctx.lineWidth = 3;
        ctx.stroke();
        ctx.closePath();
    }

    drawBody(ctx) {
        for (var i = 0; i < this.tail.length; i++) {
            ctx.beginPath();
            ctx.rect(this.tail[i].x, this.tail[i].y, constants.TILE_SIZE, constants.TILE_SIZE);
            ctx.fillStyle = this.color;
            ctx.fill();
            ctx.strokeStyle = "black";
            ctx.lineWidth = 3;
            ctx.stroke();
            ctx.closePath();
        }
    }

    move() {
        for (var i = this.tail.length - 1; i > 0; i--) {
            this.tail[i] = this.tail[i - 1];
        }

        if (this.tail.length != 0) {
            this.tail[0] = { x: this.x, y: this.y };
        }

        this.x += this.velX * constants.TILE_SIZE;
        this.y += this.velY * constants.TILE_SIZE;
    }

    died() {
        for (var i = 0; i < this.tail.length; i++) {
            const xx = Math.abs(this.x - this.tail[i].x);
            const yy = Math.abs(this.y - this.tail[i].y);
            if (xx < constants.TILE_SIZE && yy < constants.TILE_SIZE) {
                return true;
            }
        }
        return false;
    }

    checkBorderCollision(width, height) {
        if (this.x + constants.TILE_SIZE > width && this.velX != -1 || this.x < 0 && this.velX != 1) {
            this.x = width - this.x;
        }
        else if (this.y + constants.TILE_SIZE > height && this.velY != -1 || this.velY != 1 && this.y < 0) {
            this.y = height - this.y;
        }
    }

    eat() {
        return false;
    }

    moveUp(width, height) {
        if (this.shouldTurn(this.velY, 1, width, height)) {
            this.velX = 0;
            this.velY = -1;
        }
    }

    moveDown(width, height) {
        if (this.shouldTurn(this.velY, -1, width, height)) {
            this.velX = 0;
            this.velY = 1;
        }
    }

    moveLeft(width, height) {
        if (this.shouldTurn(this.velX, 1, width, height)) {
            this.velX = -1;
            this.velY = 0;
        }
    }

    moveRight(width, height) {
        if (this.shouldTurn(this.velX, -1, width, height)) {
            this.velX = 1;
            this.velY = 0;
        }
    }

    shouldTurn(velocity, expected, width, height) {
        return (velocity != expected && this.x >= 0 && this.x <= width && this.y >= 0 && this.y <= height);
    }
}