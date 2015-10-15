module.exports = (robot) ->
  robot.router.get '/', (req, res) ->
      res.send '<img alt="I have found things" src="https://octodex.github.com/images/hubot.jpg" />'

  robot.router.post '/say', (req, res) ->
      data = if req.body.payload? then JSON.parse req.body.payload else req.body
      message = data.message
      room = data.room
      robot.messageRoom room, "#{message}"
      res.send 'OK'

  robot.respond /say (.*)/i, (msg) ->
    robot.messageRoom msg.match[1]

  robot.respond /say (.*?) (.*)/i, (msg) ->
    robot.messageRoom msg.match[1], msg.match[2]

  robot.hear /bonjour|salut/i, (msg) ->
    messages = [
      "Bonjour!",
      "Salut"
    ]
    msg.reply msg.random messages

  robot.hear /(.*)\s+(contre|vs|versus)\s+(.*)/i, (msg) ->
    messages = [
      msg.match[1],
      msg.match[3]
    ]
    msg.reply msg.random messages + " va gagner."

  robot.hear /biere|bière|apero|apéro|picole|alcool/i, (msg) ->
    messages = [
      "Bonne idée, j'ai soif",
      "C'est déja l'heure ?",
      "J'ai encore mal à la tête",
      "J'ai piscine",
      "![](https://s-media-cache-ak0.pinimg.com/736x/32/34/52/323452dbf87c9e2c162277fbe0734a0c.jpg)",
      "![](https://s-media-cache-ak0.pinimg.com/236x/c0/8b/8c/c08b8c6f0b639e37f59e9d1a111706b2.jpg)"
    ]
    msg.reply msg.random messages

  robot.hear /clope|cigarette/i, (msg) ->
    messages = [
      "Tu devrais penser à arrêter, c'est pas bon pour la santé!",
      "La dérnière fois que j'ai essayé... j'ai pris feu",
      "![](https://s-media-cache-ak0.pinimg.com/736x/13/48/70/134870c638fe79797093575962aee759.jpg)",
      "![](https://s-media-cache-ak0.pinimg.com/736x/9c/f2/44/9cf244d9570ba2a684af39d5b7e8a86c.jpg)"
    ]
    msg.reply msg.random messages

  robot.hear /café|cafe|cofee|kawa/i, (msg) ->
    messages = [
      "Meh... juste un quart d'huile pour moi, noir sans sucre.",
      "C'est gentil, mais je ne tient pas la caféine",
      "![](https://s-media-cache-ak0.pinimg.com/236x/78/c9/ef/78c9ef5cc04f68524fc2d8df19c0e112.jpg)",
      "![](http://orig06.deviantart.net/d5f3/f/2011/121/a/9/sir_sanka_steampunk_robot_by_jonesroboworks-d3fdv6s.jpg)",
      "![](c2.staticflickr.com/4/3349/3636396625_23da09e647_n.jpg)"
    ]
    msg.reply msg.random messages

  robot.hear /maman|mère|pute|prostituée|péripapétitienne|moche/i, (msg) ->
    images = [
      "![](http://m.memegen.com/11x8gi.jpg)",
      "![](http://m.memegen.com/hwbi00.jpg)",
      "![](http://m.memegen.com/l8zjd9.jpg)",
      "![](http://m.memegen.com/f67tk2.jpg)",
      "![](http://m.memegen.com/sutzal.jpg)"
    ]
    
    msg.reply msg.random images
    
  robot.hear /gastro/i, (msg) ->
    images = [
      "![](https://www.constantlyvariedgear.com/image/data/cvgblog/mud-run/mud-run-live-pictures.jpeg)",
      "![](http://static.independent.co.uk/s3fs-public/thumbnails/image/2013/07/10/11/mud-day1-EPA.jpg)",
      "![](http://www.vosizneias.com/assets/uploads/news_photos/thumbnails/800_ky0tkdgvlqlmtbgzq6vsfuatx1xoz8hq.jpg)"
    ]
    
    msg.reply msg.random images
    
  robot.hear /root|noot|pingu/i, (msg) ->
    msg.send "ROOOOT ROOOOOOOOOOOT!!!"
    msg.send "![](http://noot.space/noot.gif)"
