class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("room_channel", data)
  end

  def join(data)
    room = Room.find(data['content']['room_id'])
    ActionCable.server.broadcast('room_channel', {join_player: data['content']['name']})
  end
end
