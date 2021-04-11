class NotesController < ApplicationController
    
    def index
        @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        # @note = Note.new
    end

  
    # def new
    #     @note = Note.new(note_params)
    
    #     if @note.save
    #         redirect_to notes_path, notice: 'Note was created.'
    #     else
    #         @recent_note = Note.order("unique_identifier").last 
    #         @notes = Note.all
    #         render :index
    #     end
    # end
    def new
        render layout: false
    end

    def note_params
        params.permit(:title, :description, :unique_identifier)
    end

end
