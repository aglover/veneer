express = require 'express'
client = require 'restler'

app = express.createServer()
app.use express.bodyParser()

app.get '/api/:token/apps', (req, res) ->
	token = req.params.token
	options = { headers: { 'X-Token':token, 'Accept':"application/json" }}
	client.get("https://cirrus.app47.com/api/apps", options)
	.on('success', (data) -> 
		res.send JSON.stringify({result:'success', data:data}))
	.on('4XX', (err) -> 
		res.send(JSON.stringify({result:'error', data:err}), 403) )


port = process.env.PORT or 8080

app.listen port, () ->
	console.log "listening on port 8080"
