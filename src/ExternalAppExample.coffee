client = require('restler')

token = process.env.TOKEN
host = process.env.HOST || 'https://cirrus.app47.com'

createOptions = { headers: {'X-Token':token, 'Accept':'application/json', 'Content-Type': 'application/json' } }

# WinPhone 8 app 'Cut the Rope' http://www.windowsphone.com/en-us/store/app/cut-the-rope/4c0cf9f4-31f0-444e-9321-0237d04f6a38
#  JSON: 
#    {
#	  wp8_external_id: '4c0cf9f4-31f0-444e-9321-0237d04f6a38', 
#     wp8_external_url: 'http://www.windowsphone.com/en-us/store/app/cut-the-rope/4c0cf9f4-31f0-444e-9321-0237d04f6a38',
#     name: 'Cut the Rope'
#    }
# Win8 app 'ESPN' http://apps.microsoft.com/windows/en-US/app/the-espn-app/3c3536bd-f432-468c-a6e4-fa1ecd49e5fc
#    {
#	  windows_external_id: '3c3536bd-f432-468c-a6e4-fa1ecd49e5fc', 
#     windows_external_url: 'http://apps.microsoft.com/windows/en-US/app/the-espn-app/3c3536bd-f432-468c-a6e4-fa1ecd49e5fc',
#     name: 'ESPN'
#    }
# 
# Google Play App 'Adobe Reader' com.adobe.reader -> JSON: {google_external_id: 'com.adobe.reader'}
# iTunes App 'Adobe Reader' 469337564 -> JSON: { apple_external_id: '469337564'}

app_json = { 
  windows_external_id: '3c3536bd-f432-468c-a6e4-fa1ecd49e5fc', 
  windows_external_url: 'http://apps.microsoft.com/windows/en-US/app/the-espn-app/3c3536bd-f432-468c-a6e4-fa1ecd49e5fc',
  name: 'ESPN'
}

createOptions['data'] = JSON.stringify {app: app_json}

client.post("#{host}/api/external_apps", createOptions).on '2XX', (data, response) -> 
	json = JSON.parse JSON.stringify(data)
	console.log 'app id is '  + json['_id']