oauthStream = require '../src/oauth_stream'
credentials = require "#{process.env.HOME}/.tradeking.json"

oauthStream.setCredentials credentials

url = 'https://stream.tradeking.com/v1/market/quotes.json?symbols=TSLA,NVDA,ARMH,MCRI,CDNS'

oauthStream.get(url).pipe process.stdout

