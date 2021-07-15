class GamesController < ApplicationController

    def new
        @game = Game.new(user_id: params[:user_id])
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
        if game_check
            @game = Game.find(params[:id])
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
        if Game.exists?(params) && Game.is_mine?(params, session)
            @game = Game.find(params[:id])
            @user = session[:user_id]
            render :show
        else
            render :'application/failure'
        end
    end

    def destroy
        if game_check
            @game = Game.find(params[:id])
            @game.destroy
            redirect_to user_path(session[:user_id])
        else 
            render :'application/failure'
        end
    end


    private

    def game_params
        params.require(:game).permit(:title, :order, :user_id, :scenario_ids => [], :scenarios_attributes=> [:title,
                                                                                                            :order_number,
                                                                                                            :completion_status,
                                                                                                            :run_number])
    end

    def game_check
        Game.exists?(params) && Game.is_mine?(params, session)
    end
end
