class Game < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :character_bases, through: :characters
  has_many :scenarios

  validates :title, presence:true

  accepts_nested_attributes_for :scenarios
  
  
    def scenarios_attributes=(scenarios_attributes)
      scenarios_attributes.values.each do |scenarios_attribute|
          scenario = Scenario.create(scenarios_attribute)          
            self.scenarios << scenario
      end
    end

    def self.order_number
      self.order(:order)
    end

end
