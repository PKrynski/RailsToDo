App.share = App.cable.subscriptions.create "ShareChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
# Called when there's incoming data on the websocket for this channel
    num = $('#list-id').val()
    num_id = parseInt(num, 10);

    if num_id == data.list_id

      if data.item
        $('#share-list').append('<li id="' + data.item_id + '" class="list-group-item"><p>' + data.item + '</p></li>')
      else
        $("#" + data.item_id).remove()