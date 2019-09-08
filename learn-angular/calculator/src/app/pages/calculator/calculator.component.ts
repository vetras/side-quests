import { Component } from "@angular/core";

@Component({
    selector: "calculator-page",
    templateUrl: "./calculator.html"
})
export class CalculatorPageComponent {
    constructor() { }

    public buttonValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    public display = "";

    private a: number = null;
    private b: number = null;
    private currentOp = "";
    private shouldClearDisplayOnNextDigit: Boolean = false;

    public onNumericButtonClick(value) {
        console.log("clicked: " + value);
        if (this.shouldClearDisplayOnNextDigit) {
            this.display = "";
            this.shouldClearDisplayOnNextDigit = false;
        }
        this.display += value;
    }

    public clearDigit() {
        this.display = this.display.slice(0, -1);
    }

    public clearScreen() {
        this.display = "";
        this.a = null;
        this.b = null;
        this.currentOp = "";
        this.shouldClearDisplayOnNextDigit = false;
    }

    public equal() {
        console.log("clicked: =");

        // check we have two arguments to compute, or do nothing
        if (this.a != null && this.display.length > 0) {
            this.b = Number.parseFloat(this.display);
            this.compute();
        }
    }

    public operation(op) {
        console.log("clicked: " + op);

        if (this.inTheMiddleOfOperation()) {
            this.b = Number.parseFloat(this.display);
            this.compute();
            this.a = Number.parseFloat(this.display);
        } else {
            this.a = Number.parseFloat(this.display);
        }
        this.currentOp = op;
        this.shouldClearDisplayOnNextDigit = true;
    }

    private inTheMiddleOfOperation(): Boolean {
        return !(this.currentOp === "");
    }

    private compute() {
        // a call to compute assumes a and b are valid
        var result: any = "";
        switch (this.currentOp) {
            case "+": {
                result = this.a + this.b;
                break;
            }
            case "-": {
                result = this.a - this.b;
                break;
            }
            case "*": {
                result = this.a * this.b;
                break;
            }
            case "/": {
                result = this.a / this.b;
                break;
            }
            case "%": {
                result = this.a * this.b / 100 ;
                break;
            }
        }
        this.clearScreen();
        // we are not truncating the result to fit the display size, bah!
        this.display = result.toString();
    }
}
