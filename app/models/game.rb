class Game < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :character_bases, through: :characters
  has_many :scenarios

  validates :title, presence:true

  accepts_nested_attributes_for :scenarios
  
  scope :order_number, -> {order(order_number)}

    def scenarios_attributes=(scenarios_attributes)
      scenarios_attributes.values.each do |scenarios_attribute|
          scenario = Scenario.create(scenarios_attribute)          
            self.scenarios << scenario
      end
    end

    # def self.order_number
    #   self.order(:order)
    # end

    def is_mine?(params)
      # binding.pry
      @user = User.find(params[:user_id])
      @game = Game.find(params[:id])
      if @game.user_id == @user.id 
        @game
      end
    end

end
