OAuth = require('oauth').OAuth
Readable = require('stream').Readable

class OAuthStream
  constructor: ({
    @consumer_key,
    @consumer_secret,
    @access_token,
    @access_secret,
  }) ->
    @oa = new OAuth null, null, @consumer_key, @consumer_secret, '1.0', null, 'HMAC-SHA1'
    @stream = new Readable()
    @stream.pause()
  get: (url) ->
    request = @oa.get url, @access_token, @access_secret
    request.on 'response', (response) =>
      @stream.wrap response
      @stream.resume()
    request.end()
    @stream

oauthStream = null

setCredentials = (args) ->
  oauthStream = new OAuthStream args

module.exports =
  setCredentials: setCredentials
  get: (url) -> oauthStream.get url

