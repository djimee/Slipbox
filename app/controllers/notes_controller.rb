class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    # GET /notes
    def index
        # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        @notes = Note.all
    end

    # GET /notes/1
    def show
    end

    # GET /notes/new
    def new
        @note = Note.new
    end

    # GET /notes/1/edit
    def edit
    end

    # DELETE /notes/1
    def destroy
      @note.destroy
      # redirect to the tree that the note belonged to after deleting
      redirect_to tree_path(@note.tree_id)
    end

    # POST /notes
    def create
      @note = Note.new(note_params)
      if @note.save
        # redirect to the tree that the note belonged to after creating
          redirect_to tree_path(@note.tree_id)
      else
          @recent_note = Note.order("unique_identifier").last 
          @notes = Note.all
          render :new
      end
    end

    # def noteToJson note
    #   note.to_json
    # end
    #
    # def jsonToNote json
    #   JSON.parse json
    # end

    # PATCH/PUT /notes/1
    def update
      if @note.update(note_params)
          redirect_to :notes
      else
          render :edit
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_note
          @note = Note.find(params[:id]) #unique_identifier
      end

      def note_params
          params.require(:note).permit(:title, :content, :unique_identifier, :tree_id, :reference_id)
      end
    end
