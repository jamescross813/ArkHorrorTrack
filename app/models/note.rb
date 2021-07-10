class Note < ApplicationRecord
  belongs_to :scenario

  validates :title, presence:true
  validates :content, length > 15 
  
end
