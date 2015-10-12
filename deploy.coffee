module.exports = (robot) ->
  robot.respond /deploy self/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user, "self-admin")
         msg.http("https://api.travis-ci.org/repos/1275015/branches/master")
          .get() (err, res, body) ->
            msg.send error
            msg.send stdout
            msg.send stderr

        @exec = require('child_process').exec
        command = "echo TEST"
        #command = "self-deploy-prod uction" // TODO test quand Arnaud est dans les parrages.
        msg.reply "OK"

        @exec command, (error, stdout, stderr) ->
          msg.send error
          msg.send stdout
          msg.send stderr
    else
       msg.send "J'ai pas envie, ta tête me convient pas"
    
