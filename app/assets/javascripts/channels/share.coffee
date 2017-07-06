App.share = App.cable.subscriptions.create "ShareChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    num = $('#list-id').val()
    num_id = parseInt( num, 10 );

    if num_id == data.list_id
      $('#share-list').append('<li class="list-group-item"><p>' + data.item + '</p></li>')

# Called when there's incoming data on the websocket for this channel