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

    private 

    def scenario_params
        params.require(:scenario).permit(:name, :order_number, :completion_status, :game_id, :run_number)
    end
end
