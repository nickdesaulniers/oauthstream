#OAUTH STREAM

I wanted to have a stream from oauth so I wrote this simple wrapper.

##Usage

`npm install oauthstream`

```
var oauthStream = require('oauthstream');

// Your credentials here
var credentials = {
  consumer_key: '',
  consumer_secret: '',
  access_token: '',
  access_secret: '',
};

oauthStream.setCredentials(credentials);

var url = 'https://website.to/hit';

oauthStream.get(url).pipe(process.stdout);
```
