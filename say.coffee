module.exports = (robot) ->
  robot.router.post '/say', (req, res) ->
      data = if req.body.payload? then JSON.parse req.body.payload else req.body
      message = data.message
      room= data.room
      robot.messageRoom room, "#{message}"
      res.send 'OK'

  robot.hear /bonjour|salut/i, (msg) ->
    msg.reply "Bonjour à toi.:"

  robot.hear /biere|bière|appero|appéro/i, (msg) ->
    msg.reply "Bonne idée, j'ai soif."

  robot.hear /cloppe|cigarette/i, (msg) ->
    msg.reply "Tu devrait penser à arrêter, c'est pas bon pour la santé."

  robot.hear /café|cafe/i, (msg) ->
    msg.reply "Meh... juste un quart d'huile pour moi, noir sans sucre."