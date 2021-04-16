class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    
    def index
        # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        @notes = Note.all
    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
    
        if @note.save
            redirect_to @note, notice: 'Note was created.'
        else
            @recent_note = Note.order("unique_identifier").last 
            @notes = Note.all
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @note.update(note_params)
            redirect_to :notes, notice: "Note was updated."
        else
            render :edit, notice: "There was a problem updating note."
        end
    end

    # def new
    #     render layout: false
    # end

    private 
    # Use callbacks to share common setup or constraints between actions.
        def set_note
            @note = Note.find(params[:id]) #unique_identifier
        end

        def note_params
            params.require(:note).permit(:title, :content, :unique_identifier, :tree_id)
        end

end
