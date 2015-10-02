# Description:
#   Shows all Gitter chatrooms hubot knows about
#
# Dependencies:
#   None
#
# Commands:
#   hubot rooms - Shows all Gitter chatrooms hubot knows about
#
# Author:
#   Donovan Tengbad
module.exports = (robot) ->
  robot.respond /rooms/i, (msg)->
    msg.http("https://api.gitter.im/v1/rooms/")
      .headers("Authorization": "Bearer " + process.env.HUBOT_GITTER2_TOKEN, "Accept": "application/json", "Content-Type": "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "Error : " + err
        else
          rooms = JSON.parse(body)
          if rooms.length != 0
            plural = if rooms.length > 1 then true else false
            message = "I know about #{if plural then "these" else "this"} room#{if plural then "s" else ""}:"
            for i of rooms
              message += "\n #{rooms[i].name} : #{rooms[i].id}"
            msg.send message
          else
            msg.send "I know about no chat rooms :("
