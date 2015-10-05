module.exports = (robot) ->
  robot.respond /deploy self/i, (msg) ->
    msg.reply "OK."

    @exec = require('child_process').exec
    command = "echo TEST"
    #command = "self-deploy-prod uction" // TODO test quand Arnaud est dans les parrages.

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
