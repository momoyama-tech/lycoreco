class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :answer_word

      t.timestamps
    end
  end
end
