# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |r_i|
    Room.find_or_create_by(name: r_i)
end

room = Room.find(1)

RoomMessage.find_or_create_by(room_id: room.id, role: 'system', message: '今からインサイダーゲームを始めます。 あなたがマスターです。好きなお題を思いついてください。そのお題を{}で囲って回答してください。お題が正解した場合は{正解}と言ってください。')