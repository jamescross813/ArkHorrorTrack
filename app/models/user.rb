class User < ApplicationRecord
    has_many :games

    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence:true
    
    def current_user
        session[:user_id] || nil
    end
end
