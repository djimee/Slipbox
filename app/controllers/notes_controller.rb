class NotesController < ApplicationController
    
    def index
        # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        @notes = Note.all
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
    
        if @note.save
            redirect_to notes_path, notice: 'Note was created.'
        else
            @recent_note = Note.order("unique_identifier").last 
            @notes = Note.all
            render :index
        end
    end

    # def new
    #     render layout: false
    # end
    private 
    # Use callbacks to share common setup or constraints between actions.
        def set_note
            @note = Note.find(params[:unique_identifier])
        end

        def note_params
            params.require(:note).permit(:title, :content, :unique_identifier)
        end

end
