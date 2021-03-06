# Description:
#   SELF Commands
#
# Dependencies:
#   None
#
# Commands:
#   hubot self deploy - Deploy SELF master branch to production
#
# Author:
#   Donovan Tengbad
module.exports = (robot) ->
  robot.respond /self deploy/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user, "self-admin")
      msg.http("https://api.travis-ci.org/repos/1275015/branches/master")
        .get() (err, res, body) ->
          if err
            msg.send "Une erreur c'est produite"
          else
            travis = JSON.parse(body)
            if travis.branch.state == "created"
              msg.send "Il va falloir patienter mon petit, Travis n'a pas fini le build, merci de réssayer dans un moment"
            if travis.branch.state == "passed"
              msg.send "Travis me signale que ta branche est bonne, je la met en prod"
              @exec = require('child_process').exec
              command = "ansible-playbook -i /home/hubot/ansible/self-deploy/production /home/hubot/ansible/self-deploy/self.yml"
              @exec command, (error, stdout, stderr) ->
                if error != null
                  console.log('exec error: ' + error)
                if stderr
                  msg.send "Une erreur c'est produite :"
                  msg.send "```` \n #{stderr} \n ````"   
                if stdout
                  msg.send "```` \n #{stdout} \n ````"
                  msg.reply "J'ai fini"
            else
              msg.send "Travis me signale que ta branche est daubé, je vais quand même pas tout péter..."
    else
       msg.send "J'ai pas envie, ta tête me convient pas"
