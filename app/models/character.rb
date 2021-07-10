class Character < ApplicationRecord
  belongs_to :game
  belongs_to :chracter_base
end
