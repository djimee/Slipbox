class EditsController < ApplicationController
  before_action :set_edit, only: [:show, :edit, :update, :destroy]

  # GET /edits
  def index
    @edits = Edit.all
  end

  # GET /edits/1
  def show
  end

  # GET /edits/new
  def new
    @edit = Edit.new
  end

  # GET /edits/1/edit
  def edit
  end

  # POST /edits
  def create
    @edit = Edit.new(edit_params)

    if @edit.save
      redirect_to @edit, notice: 'Edit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /edits/1
  def update
    if @edit.update(edit_params)
      redirect_to @edit, notice: 'Edit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /edits/1
  def destroy
    @edit.destroy
    redirect_to edits_url, notice: 'Edit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit
      @edit = Edit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edit_params
      params.require(:edit).permit(:title)
    end
end
