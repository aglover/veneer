(function() {
  var client, options;

  client = require('restler');

  options = {
    headers: {
      'X-Token': 'abFLe93929452QkT9r903PsA',
      'Accept': "application/json"
    }
  };

  client.get("https://cirrus.app47.com/api/apps", options).on('complete', function(data) {
    return console.log(data);
  });

}).call(this);
