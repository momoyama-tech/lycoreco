class Room < ApplicationRecord
    has_many :room_message, dependent: :destroy
end
