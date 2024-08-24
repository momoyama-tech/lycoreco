class ChatGptService
    require 'openai'
  
    def initialize
      @openai = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_ACCESS_TOKEN"))
    end
  
    def chat(messages)
        response = @openai.chat(
            parameters: {
                model: "gpt-4", # Required. # 使用するGPT-3のエンジンを指定
                messages: messages,
                temperature: 0.7, # 応答のランダム性を指定
                max_tokens: 200,  # 応答の長さを指定
            },
        )
        response['choices'].first['message']['content']
    end
end