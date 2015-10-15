room = process.env.HUBOT_NAGIOS_EVENT_NOTIFIER_ROOM
#nagiosUrl = process.env.HUBOT_NAGIOS_URL

module.exports = (robot) ->
  robot.brain.data.nagios_event_room = room

  robot.router.post '/nagios/host', (request, response) ->
    host = request.body.host
    hostOutput = request.body.hostoutput
    notificationType = request.body.notificationtype
    announceNagiosHostMessage host, hostOutput, notificationType, (msg) ->
      robot.messageRoom event_room(robot), msg

    response.end ""

  robot.router.post '/nagios/service', (request, response) ->
    host = request.body.host
    serviceOutput = request.body.serviceoutput
    notificationType = request.body.notificationtype
    serviceDescription = request.body.servicedescription
    serviceState = request.body.servicestate

    announceNagiosServiceMessage host, notificationType, serviceDescription, serviceState, serviceOutput, (msg) ->
      robot.messageRoom event_room(robot), msg

    response.end ""

event_room = (robot) ->
  return robot.brain.data.nagios_event_room

announceNagiosHostMessage = (host, hostOutput, notificationType, cb) ->
  cb "**Nagios #{notificationType} :** \n>#{host} is #{hostOutput}"

announceNagiosServiceMessage = (host, notificationType, serviceDescription, serviceState, serviceOutput, cb) ->
  cb "**Nagios #{notificationType} :** \n>Host : #{host}\n>Service : #{serviceDescription}\nState : #{serviceState}\nOutput : #{serviceOutput}"
