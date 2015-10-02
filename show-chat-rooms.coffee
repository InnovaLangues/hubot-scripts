module.exports = (robot) ->
  robot.respond /show\s+rooms/i, (msg)->
    msg.send process.env
    if process.env.HUBOT_XMPP_ROOMS
      rooms = process.env.HUBOT_XMPP_ROOMS.split(",")
      plural = if rooms.length > 1 then true else false
      message = "I know about #{if plural then "these" else "this"} room#{if plural then "s" else ""}:"
      for i of rooms
        message += "\n* #{rooms[i]}"
      msg.send message
    else
      msg.send "I know about no chat rooms :("