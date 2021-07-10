class Scenario < ApplicationRecord
  belongs_to :game
  has_many :notes
end
