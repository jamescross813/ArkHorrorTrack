class ApplicationController < ActionController::Base

    def homepage
    end
  
    def current_user
      session[:user_id] || nil
    end
end
