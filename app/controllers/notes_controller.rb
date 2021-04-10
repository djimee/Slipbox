class NotesController < ApplicationController
    
    def index
        @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        # @note = Note.new
    end

    def create
        @note = Note.new(note_params)
    
        if @note.save
            redirect_to notes_path, notice: 'Note was created.'
        else
            @recent_note = Slipbox.order("unique_identifier").last 
            @notes = Note.all
            render :index
        end
    end

end
