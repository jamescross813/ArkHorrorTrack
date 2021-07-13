class Note < ApplicationRecord
  belongs_to :scenario

  validates :title, presence:true
  validates :content, length: {minimum: 15} 
  
  def self.is_mine?(params, session)
    @note = self.find(params[:id])
    if @note.scenario.game.user_id == session[:user_id]
      @note
    end
  end

  def self.exists?(params)
    if self.find_by(id:params[:id]) 
      @note= self.find(params[:id])
    end
  end

end
