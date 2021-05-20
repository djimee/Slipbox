class SlipboxesController < ApplicationController
  before_action :set_slipbox, :current_user ,:set_slipbox_owner, only: [:set_slipbox_owner, :show, :edit, :update, :destroy]

  def set_slipbox_owner
    @current_user_username = current_user.username
  end
  
  # GET /slipboxes  
  def index
    # sort slipboxes by date created to append newer to the left
    @slipboxes = Slipbox.all.sort_by { |s| [s.created_at] }
    @slipbox = Slipbox.new
      
    # gets most recently updated note
    @recent_note = Note.order("updated_at").last
  end

  # GET /slipboxes/1
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
      redirect_to slipboxes_path
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
    redirect_to slipboxes_url
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_slipbox
      @slipbox = Slipbox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def slipbox_params
      params.require(:slipbox).permit(:title, :description, user_ids: [])
    end

end
