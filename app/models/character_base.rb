class CharacterBase < ApplicationRecord
    has_many :characters
    has_many :games, through: :characters
end
