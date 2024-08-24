class RoomsController < ApplicationController
  protect_from_forgery
  def create
    room = Room.create
    room.room_message.create(
      role: 'system',
      message: '今からインサイダーゲームを始めます。 あなたがマスターです。好きなお題を思いついてください。そのお題を{}で囲って回答してください。お題が正解した場合は{正解}と言ってください。'
    )
    messages = room.room_message.map {|room_message| {
        role: room_message.role,
        content: room_message.message
      }
    }
    chat_gpt_service = ChatGptService.new
    result_message = chat_gpt_service.chat(messages)
    match = result_message.match(/\{(.*?)\}/)
    content = match[1] if match
    room.update(answer_word: content)
    render json: {
      room_id: room.id
    }
  end

  def index
    render json: Room.all
  end
end
