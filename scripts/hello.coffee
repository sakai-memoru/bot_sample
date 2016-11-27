module.exports = (robot) ->
  robot.hear /teach me weather (.*)/i, (msg) ->
   switch msg.match[1]
      when 'today'
        day = 0
      when 'tomorrow'
        day = 1
      when 'after tomorrow'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
      .get()
    request (err, res, body) ->
      json = JSON.parse body
      #console.log body
      #console.log json

      if day == 3 then forecast = "I don't know!" else forecast = json['title'] + ':' + json['forecasts'][day]['telop']
      msg.reply forecast
