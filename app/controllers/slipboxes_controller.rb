class SlipboxesController < ApplicationController
  before_action :set_slipbox, only: [:show, :edit, :update, :destroy]
  # GET /slipboxes  
  def index
      @slipboxes = Slipbox.all
      @slipbox = Slipbox.new
      # gets most recently update note 
      @recent_note = Slipbox.order("updated_at").last # change this for note when implemented
  end
        
  def create
    @slipbox = Slipbox.new(slipbox_params)

    if @slipbox.save
      redirect_to slipboxes_path, notice: 'Slipbox was created.'
    else
      render :index
    end
  end

  # GET /slipboxes/1
  def show 
    # NEED A SEPERATE VIEW ()
  end

  # PATCH/PUT /slipboxes/1
  def update
    if @slipbox.update(slipbox_params)
      redirect_to slipboxs_path, notice: 'Slipbox was successfully updated.'
    else
      render :index
    end
  end

  def edit
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