class GamesController < ApplicationController

    def new
        @game = Game.new(user_id: params[:user_id])
        @game.scenarios.build
    end

    def create 
        @game = Game.new(game_params)
        if @game.valid?
            @game.save
           redirect_to user_game_path(@game.user_id, @game)
        else 
            render :new
        end
    end

    def edit
        @game = Game.find(params[:id])
        if @game.is_mine?(params)
            render :edit
        else
            render :'application/failure'
        end
    end

    def update
        @game = Game.find(params[:id])
        @game.update(game_params)
        redirect_to user_game_path(@game.user_id, @game)
    end

    def show
        @game = Game.find(params[:id])
        @user = User.find(params[:user_id])
        if @game.is_mine?(params) 
            render :show
        else
            render :'application/failure'
        end
    end

    def index
        @user = User.find(current_user)
        @games = @user.games
    end

    def game_params
        params.require(:game).permit(:title, :order, :user_id, :scenario_ids => [], :scenarios_attributes=> [:title,
                                                                                                            :order_number,
                                                                                                            :completion_status,
                                                                                                            :run_number])
    end
end
