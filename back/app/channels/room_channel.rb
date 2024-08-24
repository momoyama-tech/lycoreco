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

  def game(data)
    room = Room.find(1)
=begin
    Room.find(1).room_message.destroy_all
    Room.find(1).room_message.create(role: 'system', message: '今からインサイダーゲームを始めます。 あなたがマスターです。好きなお題を思いついてください。そのお題を{}で囲って回答してください。お題が正解した場合は{正解}と言ってください。')
    messages = Room.find(1).room_message.map {|room_message| {
        role: room_message.role,
        content: room_message.message
      }
    }
    chat_gpt_service = ChatGptService.new
    result_message = chat_gpt_service.chat(messages)
    match = result_message.match(/\{(.*?)\}/)
    content = match[1] if match
    Room.find(1).update(answer_word: content)
    Room.find(1).room_message.create(role: 'system', message: result_message)
=end
    room.room_message.create(
      role: 'user',
      message: 'それは「' + data['content'] + '」ですか?'
    )
    messages = room.room_message.map {|room_message| {
        role: room_message.role,
        content: room_message.message
      }
    }
    chat_gpt_service = ChatGptService.new
    result_message = chat_gpt_service.chat(messages)
    room.room_message.create(
      role: 'system',
      message: result_message
    )
    ActionCable.server.broadcast('room_channel', {message: result_message})
  end
end
