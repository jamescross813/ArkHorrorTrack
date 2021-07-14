class ScenariosController < ApplicationController

    def new
        @scenario = Scenario.new(game_id: params[:game_id])
    end

    def create 
        @scenario = Scenario.new(scenario_params)
        if @scenario.save
            redirect_to game_scenario_path(@scenario.game_id, @scenario)
        else
            render :new
        end
    end

    def edit
        if Scenario.exists?(params) && Scenario.is_mine?(params, session)
            @scenario = Scenario.find(params[:id])
            render :edit
        else
            render :'application/failure'
        end
    end

    def update
        @scenario = Scenario.find(params[:id])
        @scenario.update(scenario_params)
        redirect_to game_scenario_path(@scenario.game_id, @scenario)
    end

    def show
        if Scenario.exists?(params) && Scenario.is_mine?(params, session)
            @scenario = Scenario.find(params[:id])
            @game = Game.find(params[:game_id])
            render :show
        else
            render :'application/failure'
        end
    end

    def index
        @user = User.find(session[:user_id])
        @user.games.each do |game|
            @scenarios = game.scenarios
        end
    end

    def destroy
        if Scenario.exists?(params) && Scenario.is_mine?(params, session)
            @scenario = Scenario.find(params[:id])
            @scenario.destroy
            redirect_to game_path(@scenario.game_id)
        else 
            render :'application/failure'
        end
    end

    private 

    def scenario_params
        params.require(:scenario).permit(:title, :order_number, :completion_status, :game_id, :run_number)
    end
end
