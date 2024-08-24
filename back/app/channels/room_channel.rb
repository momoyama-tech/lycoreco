class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)    
    # データを処理し、必要に応じてブロードキャストする
    ActionCable.server.broadcast("room_channel", data)
  end

  def game(data)
    ActionCable.server.broadcast('room_channel', {message: data['content']+ 'やで'})
  end
end
