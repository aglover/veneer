client = require('restler')

token = process.env.TOKEN 
host = process.env.HOST || 'https://cirrus.app47.com'

createOptions = { headers: {'X-Token':token, 'Accept':'application/json', 'Content-Type': 'application/json' } }

createOptions['data'] = JSON.stringify({user:{ name: "API User", email: "user.one.+@mailinator.com"}})
client.post("#{host}/api/users", createOptions).on '2XX', (data, response) -> 
	json = JSON.parse JSON.stringify(data)
	console.log "id is #{json['_id']}"
	