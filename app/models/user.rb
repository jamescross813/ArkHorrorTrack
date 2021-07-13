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

    def self.is_me?(params, session)
        @user = User.find(params[:id])
        if @user.id == session[:user_id] 
          @user
        end
      end
  
      def self.exists?(params)
        if User.find_by(id:params[:id]) 
          @user = User.find(params[:id])
        end
      end


end
