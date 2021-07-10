class NotesController < ApplicationController

    def new
        @note = Note.new(scenario_id: params[:scenario_id])
    end

    def create 
        @note = Note.new(note_params)
        if @note.save
           redirect_to scenario_note_path(@note.scenario_id, @note)
        else 
            render :new
        end
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :scenario_id)
    end
end
