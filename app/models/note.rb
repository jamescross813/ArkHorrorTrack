class Note < ApplicationRecord
  belongs_to :scenario

  validates :title, presence:true
  validates :content, length: {minimum: 15} 
  
  def is_mine?(params)
    @user = User.find(params[:user_id])
    @note = Note.find(params[:id])
    if @note.user_id == @user.id 
      @note
    end
  end

end
