class Scenario < ApplicationRecord
  belongs_to :game
  has_many :notes

  def self.incomplete
    where(completion_status: false)
   end

end
