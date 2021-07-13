class CharacterBasesController < ApplicationController

    def show
        @character = CharacterBase.find(params[:id])
    end

    def index
        @characters = CharacterBase.all
    end
    
end
