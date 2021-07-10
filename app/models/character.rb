class Character < ApplicationRecord
  belongs_to :game
  belongs_to :character_base

  validates :health, :sanity, :victory_points_gained, :victory_points_used, numericality: { only_integer: true, message: "Must be a number"}
end
