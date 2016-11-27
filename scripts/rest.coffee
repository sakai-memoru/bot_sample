module.exports = (robot) ->
  robot.hear /Hello/i, (msg) ->
      msg.reply 'Hi, Thanks!'

  robot.respond /Hi/i, (msg) ->
      msg.send 'Hi, Hi'
