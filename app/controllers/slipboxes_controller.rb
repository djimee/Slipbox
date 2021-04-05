class SlipboxesController < ApplicationController
    def index
      @slipboxes = Slipbox.all
      @slipbox = Slipbox.new
      @slipbox_id = Slipbox.first.id
    end
      
    def new
      @slipbox = Slipbox.new
    end
        
    def create
     
      @slipbox = Slipbox.new(slipbox_params)

      if @slipbox.save
        redirect_to slipboxes_path, notice: 'Slipbox was created.'
      else
        render :index
      end
    end

    def show 
      # @slipboxes = Slipbox.where(slipbox_id:)
    end

    def update
    end

    def edit
    end

    def search
    end

    def slipbox_params
      params.require(:slipbox).permit(:title, :description)
    end

end