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

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        @note.update(note_params)
        redirect_to note_path
    end

    def show
        @note = Note.find(params[:id])
        @scenario = @note.scenario_id
    end

    def index
        @scenario = Scenario.find(current_scenario)
        @notes = @scenario.notes
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :scenario_id)
    end
end
