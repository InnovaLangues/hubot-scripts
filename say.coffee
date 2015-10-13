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

  robot.hear /biere|bière|apero|apéro|picole|alcool/i, (msg) ->
    messages = [
      "Bonne idée, j'ai soif",
      "C'est déja l'heure ?",
      "J'ai encore mal à la tête",
      "J'ai piscine"
    ]
    msg.reply msg.random messages

  robot.hear /clope|cigarette/i, (msg) ->
    msg.reply "Tu devrais penser à arrêter, c'est pas bon pour la santé!"

  robot.hear /café|cafe|cofee|kawa/i, (msg) ->
    messages = [
      "Meh... juste un quart d'huile pour moi, noir sans sucre.",
      "C'est gentil, mais je ne tient pas la caféine",
      "![](c2.staticflickr.com/4/3349/3636396625_23da09e647_n.jpg)"
    ]
    msg.reply msg.random messages

  robot.hear /maman|mère|pute|prostituée|péripapétitienne/i, (msg) ->
    images = [
      "![](http://m.memegen.com/11x8gi.jpg)",
      "![](http://m.memegen.com/hwbi00.jpg)",
      "![](http://m.memegen.com/l8zjd9.jpg)",
      "![](http://m.memegen.com/f67tk2.jpg)",
      "![](http://m.memegen.com/sutzal.jpg)"
    ]
    
    msg.reply msg.random images
    
  robot.hear /noot|pingu/i, (msg) ->
    msg.send "ROOOOT ROOOOOOOOOOOT!!!"
    msg.send "![](http://noot.space/noot.gif)"
