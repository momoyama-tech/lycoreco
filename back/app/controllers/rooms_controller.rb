class RoomsController < ApplicationController
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
    render json: {
      result_message: result_message
    }
  end

  def index
    render json: Room.all
  end
end
