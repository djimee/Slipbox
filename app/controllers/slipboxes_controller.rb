class SlipboxesController < ApplicationController
  before_action :set_slipbox, only: [:show, :edit, :update, :destroy]

  # GET /slipboxes  
  def index
    # sort slipboxes by date created to append newer to the left
    @slipboxes = Slipbox.all.sort_by { |s| [s.created_at] }
    @slipbox = Slipbox.new
      
    # gets most recently updated note
    @recent_note = Note.order("updated_at").last # change this for note when implemented
  end

  def show
  end


  # GET /slipboxes/1/edit
  def edit
    render layout: false
  end
  
  # POST /slipboxes
  def create
    @slipbox = Slipbox.new(slipbox_params)

    if @slipbox.save
      redirect_to slipboxes_path, notice: 'Slipbox was created.'
    else
      @recent_note = Note.order("updated_at").last # delete this when the most recent note thingy is implemented
      @slipboxes = Slipbox.all
      render :index
    end
  end
    
  # PATCH/PUT /slipboxes/1
  def update
    if @slipbox.update(slipbox_params)
      @slipboxes = Slipbox.all
      render 'update_success'
    else
      render 'update_failure'
    end
  end

  # DELETE /slipboxes/1
  def destroy
    @slipbox.destroy
    redirect_to slipboxes_url, notice: 'Slipbox was successfully destroyed.'
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_slipbox
      @slipbox = Slipbox.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def slipbox_params
      params.require(:slipbox).permit(:title, :description)
    end

end
