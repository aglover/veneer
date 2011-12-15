# http = require('https')
# 
# options = { host: 'cirrus.app47.com', path: '/api/apps', headers: {'X-Token':'abFLe93929452QkT9r903PsA', 'Accept' : "application/json" }}
# 
# http.get(options, (res) ->
# 	res.on('data', (chunk) -> console.log('BODY: ' + chunk))
# 	console.log("Got response: " + res.statusCode)
# 	console.log("headers: ", res.headers))
# .on('error', (e) -> console.log("Got error: " + e.message))

client = require('restler')
options = { headers: {'X-Token':'abFLe93929452QkT9r903PsA', 'Accept':"application/json" }}

client.get("https://cirrus.app47.com/api/apps", options).on('complete', (data) -> console.log data)