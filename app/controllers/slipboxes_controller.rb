class SlipboxesController < ApplicationController
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

  def update
  end

  def edit
  end

  private 
    # Only allow a trusted parameter "white list" through.
    def slipbox_params
      params.require(:slipbox).permit(:title, :description)
    end

end