class UsersController < ApplicationController

    def new    
        if !session.empty?
            @user = User.find(session[:user_id])
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            render :show
        else
            render :new
        end 
    end

    def show
        @user = User.find(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
