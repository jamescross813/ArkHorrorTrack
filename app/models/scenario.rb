class Scenario < ApplicationRecord
  belongs_to :game
  has_many :notes

  validates :title, presence: true

  def self.incomplete
    where(completion_status: false)
   end

   def is_complete?
    if self.completion_status == true
      "Complete"
    else 
      "Incomplete"
    end
  end

end
