# Description:
#  Get Ron Swanson Quotes with Hubot"
#
# Commands:
#  hubot ron - send a Ron Swanson quote
#
# Author:
#  myersr
# Api Owner:
#  jamesseanwright on Github

url = 'http://ron-swanson-quotes.herokuapp.com/v2/quotes'

sendQuote = (res, body) ->
  data = JSON.parse body
  res.send data

module.exports = (robot) ->
  robot.respond /ron/i, (res) ->
    robot.http("#{url}").get() (err, response, body) ->
      throw err if err
      try
        quote = JSON.parse(body)[0]
        res.reply "> \"#{quote}\" \n> Ron Swanson"
      catch error
        res.send "Ran into error parsing JSON"
        return

