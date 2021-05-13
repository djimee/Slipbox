class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # Page that displays all the notes.
  # TO DO: Remove if not necessary.
  def index
      @notes = Note.all
      # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
  end

  # GET /notes/1
  # Shows the note with the unique id.
  def show
  end

  # GET /notes/new
  # Initiliazes new note and get the tree title to use in other parts of the program.
  def new
      @note = Note.new
      # get title of tree the note belongs to
      @tree_title = params[:tree_title]
  end

  # GET /notes/1/edit
  # Renders the editing contents of a note page.
  def edit
  end

  # DELETE /notes/1
  # Deletes note with the unique id.
  def destroy
    @note.destroy
    # redirect to the tree that the note belonged to after deleting
    redirect_to tree_path(@note.tree_id)
  end

  # POST /notes/search
  # Searchs through all existing notes.
  def search
    @notes = Note.where(title: params[:search][:title])
    render :index
  end

  # POST /notes
  # Creates a note.
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
  # Updates the parameter of the note with the unique id.
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
