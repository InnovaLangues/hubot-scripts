module.exports = (robot) ->
  robot.router.post '/say', (req, res) ->
      data = if req.body.payload? then JSON.parse req.body.payload else req.body
      message = data.message
      room= data.room
      robot.messageRoom room, "#{message}"
      res.send 'OK'

