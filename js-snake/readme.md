Chrome wont load JS from disk with `<script type="module" src="main.js"`.
So, we serve our files with CORS enabled, then it works:

    $ npm install -g http-server
    $ http-server --cors
    $ # manually open snake.html on chrome

