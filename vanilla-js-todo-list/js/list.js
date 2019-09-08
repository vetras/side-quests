import {escapeForHTML} from './helpers';

class ListEntry {
    constructor() {
        this.id = Date.now();
        this.text = 'foo bar';
        this.isChecked = false;
    }

    // move to view class
    GenerateNewDomEntry() {
        var wrapper = document.createElement('div');

        var tick = document.createElement('div');
        tick.className = "col-sm-1";

        var checkbox = document.createElement('input');
        checkbox.type = "checkbox";

        var item = document.createElement('div');
        tick.className = "col-sm-11";

        var textbox = document.createElement('input');
        textbox.type = this.text;
        textbox.placeholder = "start typing to add a new entry...";

        tick.appendChild(checkbox);
        item.appendChild(textbox);
        wrapper.appendChild(tick);
        wrapper.appendChild(item);

        return wrapper;
    }
}

export default class List {
    constructor() {
        this.items = [ new ListEntry() ];
    }

    count() {
        return this.items.length;
    }

    buildDom() {
        // var dom = [];
        // items.forEach(element => {
        //    dom.push(element.GenerateNewDomEntry()); 
        // });
        // return dom;

        return items.reduce((a, item) => a + `
        <li data-id="${item.id}"${item.isChecked ? ' class="completed"' : ''}>
            <input type="checkbox" ${item.isChecked ? 'checked' : ''}>
            <label>${escapeForHTML(item.text)}</label>
            <button class="destroy"></button>
        </li>`, '');

    }
}