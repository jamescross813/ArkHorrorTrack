class SessionsController < ApplicationController

    def new
      @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :failure
        end
    end

    def omniauth
        @user = User.from_omniauth(request.env['omniauth.auth'])
          if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/login'
          end
    end

    def destroy
      session[:user_id] = nil
        redirect_to '/'
    end

    private 

    def auth
      request.env['omniauth.auth']["info"]
    end

end
