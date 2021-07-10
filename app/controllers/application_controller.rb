class ApplicationController < ActionController::Base
 
 
    def logged_in?
      if !session[:current_user]
        redirect_to login_path
      end
    end

    def homepage
    end
  
    def current_user
      session[:user_id] || nil
    end
end
