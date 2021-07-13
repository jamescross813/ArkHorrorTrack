class User < ApplicationRecord
    has_many :games

    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence:true
    
    def current_user
        session[:user_id] || nil
    end

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.password = SecureRandom.hex(15)
        end
    end


end
