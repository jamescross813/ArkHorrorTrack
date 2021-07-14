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
        if Character.is_mine?(params, session) && Character.exists?(params)
            @gamecharacter = Character.find(params[:id])
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
        if Character.exists?(params) && Character.is_mine?(params, session)
            @char = Character.find(params[:id])
            @character = CharacterBase.find(@char.character_base_id)
            render :show
        else
            render :'application/failure'
        end
    end

    def destroy
        if Character.exists?(params) && Character.is_mine?(params, session)
            @character = Character.find(params[:id])
            @character.destroy
            redirect_to game_path(@character.game_id)
        else 
            render :'application/failure'
        end
    end

    private 

    def character_params
        params.require(:character).permit(:character_base_id, :game_id, :victory_points_gained, :victory_points_used, :health, :sanity)
    end
end
