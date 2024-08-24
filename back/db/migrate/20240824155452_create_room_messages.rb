class CreateRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :room_messages do |t|
      t.references :room, foreign_key: true
      t.string :role
      t.string :message

      t.timestamps
    end
  end
end
