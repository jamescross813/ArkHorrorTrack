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

    def create_twitter
        user = User.find_or_create_by(username: auth[:name]) {|u| u.password = 'password'}
        session[:user_id] = user.id
        redirect_to user_path(@user)
    end

    def destroy
      session.delete :username
        redirect_to '/'
    end

    private 

    def auth
      request.env['omniauth.auth']["info"]
    end

end
