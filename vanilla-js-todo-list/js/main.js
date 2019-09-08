import {List} from './list';

var listId = 'list-placeholder';

document.onload = function () {
    var list = new List();

    var domList = document.getElementById(listId);

    domList.appendChild(list.buildDom());
};