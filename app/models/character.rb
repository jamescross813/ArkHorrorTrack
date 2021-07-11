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

  def is_mine?(params)
    @character = Character.find_by(params[:id])
    @game = Game.find(params[:game_id])
    if @character.game_id == @game.id 
      @character
    end
  end

  def self.exists?(params)
    if Character.find_by(id:params[:id]) 
      @char = Character.find(params[:id])
    end
  end
  
end
