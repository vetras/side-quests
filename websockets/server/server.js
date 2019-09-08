var WebSocketServer = require('websocket').server;
var http = require('http');

var handler = require('./handlers');


var server = http.createServer(function (request, response) {
    // process HTTP request. Since we're writing just WebSockets
    // server we don't have to implement anything.
});
server.listen(1337, function () {
    console.log((new Date()) + " Server is listening on port " + webSocketsServerPort);
});

// create the server. since websockets run on top of HTTP it need a server
wsServer = new WebSocketServer({
    httpServer: server
});

// WebSocket server
// Register handlers for each one of the 3 types of messages the websocket protocol defines
// http://tools.ietf.org/html/rfc6455#page-6
wsServer.on('request', function (request) {
    console.log((new Date()) + ' Connection from origin ' + request.origin + '.');

    // accept connection - you should check 'request.origin' to
    // make sure that client is connecting from your website
    // (http://en.wikipedia.org/wiki/Same_origin_policy)
    var connection = request.accept(null, request.origin);
    console.log((new Date()) + ' Connection accepted.');

    // This is the most important callback for us, we'll handle all messages from users here.
    connection.on('message', function (message) {
        if (message.type === 'utf8') {
            // process WebSocket message
            handler.handle(message);
        }
    });

    connection.on('close', function (connection) {
        // close user connection
    });
});