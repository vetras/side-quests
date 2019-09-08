import React from 'react';
import ReactDOM from 'react-dom';
import registerServiceWorker from './registerServiceWorker';

import './index.css';

import App from './App';
import Hello from './components/Hello.jsx';
import FilteredList from './components/FilteredList.jsx';
import TodoList from './components/todo-list/TodoList.jsx';

ReactDOM.render(< App />, document.getElementById('root'));

ReactDOM.render(< TodoList />, document.getElementById('todo-app-placeholder'));
ReactDOM.render(< Hello name="Mr. Fields" />, document.getElementById('hello-placeholder'));
ReactDOM.render(< FilteredList />, document.getElementById('list-placeholder'));

registerServiceWorker();