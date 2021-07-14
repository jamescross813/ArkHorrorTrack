class Game < ApplicationRecord
  belongs_to :user
  has_many :characters, :dependent => :destroy
  has_many :character_bases, through: :characters
  has_many :scenarios, :dependent => :destroy

  validates :title, presence:true

  accepts_nested_attributes_for :scenarios
  
# scope :alphabetical, -> {order(title)}

    def scenarios_attributes=(scenarios_attributes)
      scenarios_attributes.values.each do |scenarios_attribute|
          scenario = Scenario.create(scenarios_attribute)          
            self.scenarios << scenario
      end
    end

    def self.order_number
      self.order(:order)
    end

    def self.is_mine?(params, session)
      @game = self.find(params[:id])
      if @game.user_id == session[:user_id] 
        @game
      end
    end

    def self.exists?(params)
      if self.find_by(id:params[:id]) 
        @game = self.find(params[:id])
      end
    end

end
