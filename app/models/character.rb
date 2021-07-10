class Character < ApplicationRecord
  belongs_to :game
  belongs_to :character_base
end
