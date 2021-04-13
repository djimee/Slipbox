class NotesController < ApplicationController
    
    def index
        # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        @notes = Note.all
    end

    def new
        @note = Note.new
    end

    def show
    end

    def edit
    end

    def update
        if @note.update(note_params)
            @notes = Note.all
            redirect_to note_path, notice: "Note was updated."
        else
            redirect_to note_path, notice: "There was a problem updating note."
        end
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
            params.require(:note).permit(:title, :content, :unique_identifier, :tree_id)
        end

end
