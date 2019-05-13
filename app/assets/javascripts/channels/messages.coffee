App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log('websocket connected')

  disconnected: ->
    console.log('websocket disconnected')

  received: (data) ->
    $('#messages').append(data['message'])

  speak: (message) ->
    @perform 'speak', message: message


$(document).on 'keypress', '[data-behavior~=speaker]', (event) ->
  if event.keyCode is 13 # return = send
    text = event.target.value
    App.messages.speak text
    event.target.value = ''
    event.preventDefault()
