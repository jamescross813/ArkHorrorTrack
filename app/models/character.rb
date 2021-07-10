class Character < ApplicationRecord
  belongs_to :game
  belongs_to :character_base

  validates :health, :sanity, :victory_points_gained, :victory_points_used, numericality: { only_integer: true, message: "Must be a number"}

  def new_character_stats
       self.health =self.character_base.health
       self.sanity =self.character_base.sanity
       self.victory_points_gained = 0
       self.victory_points_used = 0
  end

  def self.is_mine?(session, character)
    @user = User.find(session)
    @character = Character.find(game)
    if @character.user_id == @user.id 
    end
  end

  
end
