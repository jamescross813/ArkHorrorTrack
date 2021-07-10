class Note < ApplicationRecord
  belongs_to :scenario

  validates :title, presence:true
  validates :content, length: {minimum: 15} 
  
  def self.is_mine?(session, note)
    @user = User.find(session[:user_id])
    @note = Note.find(note)
    if @note.user_id == @user.id 
    end
  end

end
