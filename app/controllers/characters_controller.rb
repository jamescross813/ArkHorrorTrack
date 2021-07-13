class CharactersController < ApplicationController

    def new
        @gamecharacter = Character.new(game_id: params[:game_id])
    end

    def create 
        @gamecharacter = Character.new(character_params)
        @gamecharacter.new_character_stats
        @gamecharacter.save
        redirect_to game_character_path(@gamecharacter.game_id, @gamecharacter)
    end

    def edit
        @gamecharacter = Character.find(params[:id])
        if @gamecharacter.is_mine?(params) && @gamecharacter.exists?(params)
            render :edit
        else
            render :'application/failure'
        end
    end

    def update
        @gamecharacter = Character.find(params[:id])
        @gamecharacter.update(character_params)
        redirect_to game_character_path(@gamecharacter.game_id, @gamecharacter)
    end

    def show
        @char = Character.exists?(params)
       
        if !@char.nil? && @char.is_mine?(params, session)
            @character = CharacterBase.find(@char.character_base_id)
            render :show
        else
            render :'application/failure'
        end
    end

    private 

    def character_params
        params.require(:character).permit(:character_base_id, :game_id, :victory_points_gained, :victory_points_used, :health, :sanity)
    end
end
