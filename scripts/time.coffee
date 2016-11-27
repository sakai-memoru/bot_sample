gulp = require('gulp')
gutil =  require('gulp-util')
path = '/hubot/time'

gutil.log('start!')

module.exports = (robot) ->
  robot.router.get path, (req,res) ->
    #res.end "Server time is #{new Date()}"
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      forecast = json['title'] + ':' +json['forecasts'][day]['telop']
      res.end forecast
