import { Component, Input, Output, EventEmitter } from "@angular/core";

@Component({
    selector: "numeric-button",
    templateUrl: "./numeric.html"
})
export class NumericButtonComponent {

    @Input()
    public digitValue: Number;

    @Input()
    public overrideCss: String;
    
    @Output()
    public onClick = new EventEmitter();

    constructor() {

    }

    public click() {
        this.onClick.emit(this.digitValue);
    }

    private get css(): String {
        return this.overrideCss ? this.overrideCss : "btn-style num num-bg";
    }
}



