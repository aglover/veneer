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

token = process.env.TOKEN
host = process.env.HOST || 'https://cirrus.app47.com'

options = { headers: {'X-Token':token, 'Accept':"application/json" }}

client.get("#{host}/api/external_apps", options).on 'complete', (data) -> console.log data