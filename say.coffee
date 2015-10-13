module.exports = (robot) ->
  robot.router.post '/say', (req, res) ->
      data = if req.body.payload? then JSON.parse req.body.payload else req.body
      message = data.message
      room= data.room
      robot.messageRoom room, "#{message}"
      res.send 'OK'

  robot.respond /say (.*)/i, (msg) ->
    robot.messageRoom msg.match[1]

  robot.respond /say (.*?) (.*)/i, (msg) ->
    robot.messageRoom msg.match[1], msg.match[2]

  robot.hear /bonjour|salut/i, (msg) ->
    msg.reply "Bonjour."

  robot.hear /biere|bière|apero|apéro|picole/i, (msg) ->
    msg.reply "Bonne idée, j'ai soif."

  robot.hear /clope|cigarette/i, (msg) ->
    msg.reply "Tu devrais penser à arrêter, c'est pas bon pour la santé."

  robot.hear /café|cafe/i, (msg) ->
    msg.reply "Meh... juste un quart d'huile pour moi, noir sans sucre."

  robot.hear /maman|mère/i, (msg) ->
    msg.reply "On avait dit pas les mamans..."
