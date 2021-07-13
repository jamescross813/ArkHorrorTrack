class Note < ApplicationRecord
  belongs_to :scenario

  validates :title, presence:true
  validates :content, length: {minimum: 15} 
  
  def is_mine?(params)
    @note = Note.find(params[:id])
    @scenario = Scenario.find(params[:scenario_id])
    if @note.scenario_id == @scenario.id
      @note
    end
  end

end
