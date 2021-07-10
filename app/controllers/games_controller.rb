class GamesController < ApplicationController

    def new
        @game = Game.new(user_id: params[:user_id])
        @game.scenarios.build
    end

    def create 
        @game = Game.new(game_params)
        if @game.save 
           redirect_to user_game_path(@game.user_id, @game)
        else 
            render :new
        end
    end

    def game_params
        params.require(:game).permit(:title, :order, :user_id, :scenario_ids => [], :scenarios_attributes=> [:title,
                                                                                                            :order_number,
                                                                                                            :completion_status,
                                                                                                            :run_number])
    end
end
