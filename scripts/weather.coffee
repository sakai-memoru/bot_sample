module.exports = (robot) ->
  robot.hear /What it will be (.*)/i, (msg) ->
   switch msg.match[1]
      when 'today'
        day = 0
      when 'tomorrow'
        day = 1
      when 'after tomoroww'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = 'I dont know!' else forecast = json['title'] + ':' +json['forecasts'][day]['telop']
      msg.reply forecast
