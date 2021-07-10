class Game < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :character_bases, through: :characters
  has_many :scenarios
end
