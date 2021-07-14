class Scenario < ApplicationRecord
  belongs_to :game
  has_many :notes, :dependent => :destroy

  validates :title, presence: true

  scope :incomplete, ->{where(completion_status: false)}

   def is_complete?
    if self.completion_status == true
      "Complete"
    else 
      "Incomplete"
    end
  end

  def self.is_mine?(params, session)
    @scenario = self.find(params[:id])
    if @scenario.game.user_id == session[:user_id] 
      @scenario
    end
  end

  def self.exists?(params)
    if self.find_by(id:params[:id]) 
      true
    end
  end

end
