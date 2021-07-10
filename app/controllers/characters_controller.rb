class CharactersController < ApplicationController

    def new
        @gamecharacter = Character.new(game_id: params[:game_id])
    end

    def create 
        @character = Character.new(character_params)
        if @character.save 
           redirect_to game_character_path(@character.game_id, @character)
        else 
            render :new
        end
    end

    def edit
        @gamecharacter = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
        @character.update(character_params)
        redirect_to game_character_path(@character.game_id, @character)
    end

    def show
        @char = Character.find(params[:id])
        
        @character = CharacterBase.find(@char.character_base_id) 
    end

    private 

    def character_params
        params.require(:character).permit(:character_base_id, :game_id, :victory_points_gained, :victory_points_used, :health, :sanity)
    end
end
