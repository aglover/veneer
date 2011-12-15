(function() {
  var app, client, express, port;

  express = require('express');

  client = require('restler');

  app = express.createServer();

  app.use(express.bodyParser());

  app.get('/api/:token/apps', function(req, res) {
    var options, token;
    token = req.params.token;
    options = {
      headers: {
        'X-Token': token,
        'Accept': "application/json"
      }
    };
    return client.get("https://cirrus.app47.com/api/apps", options).on('success', function(data) {
      return res.send(JSON.stringify({
        result: 'success',
        data: data
      }));
    }).on('4XX', function(err) {
      return res.send(JSON.stringify({
        result: 'error',
        data: err
      }), 403);
    });
  });

  port = process.env.PORT || 8080;

  app.listen(port, function() {
    return console.log("listening on port 8080");
  });

}).call(this);
