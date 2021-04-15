class EditNotesController < ApplicationController
  before_action :set_edit_note, only: [:show, :edit, :update, :destroy]
  @edit_notes = EditNote.all
  @edit_note = EditNote.new

  # GET /edit_notes
  def index
    @edit_notes = EditNote.all
    @edit_note = EditNote.new
  end

  # GET /edit_notes/1
  def show
  end

  # GET /edit_notes/new
  def new
  end

  # GET /edit_notes/1/edit
  def edit
  end

  # POST /edit_notes
  def create
    @edit_note = EditNote.new(edit_note_params)

    if @edit_note.save
      redirect_to @edit_note, notice: 'Edit note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /edit_notes/1
  def update
    if @edit_note.update(edit_note_params)
      redirect_to @edit_note, notice: 'Edit note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /edit_notes/1
  def destroy
    @edit_note.destroy
    redirect_to edit_notes_url, notice: 'Edit note was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit_note
      @edit_note = EditNote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edit_note_params
      params.require(:edit_note).permit(:title, :body)
    end
end
