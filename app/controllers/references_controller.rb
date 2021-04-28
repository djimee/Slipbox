class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  # GET /references
  def index
    # sort references by most recently edited to least recently updated
    @sorted_refs = Reference.all.sort_by { |r| [r.updated_at] }.reverse

    # paginate @sorted_refs with 7 seven references showing per 'page' on the table
    @references = Kaminari.paginate_array(@sorted_refs).page(params[:page]).per(7)

    # action to create a new reference on the index page
    @reference = Reference.new
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  # GET /references/1
  def show
  end

  # GET /references/1/edit
  def edit
    render layout: false
  end

  # DELETE /references/1
  def destroy
    @reference.destroy
    redirect_to references_url
  end

  # POST /references
  def create
    @reference = Reference.new(reference_params)

    if @reference.save
      redirect_to references_path
    else
      @references = Reference.all
      render :index
    end
  end

  # PATCH/PUT /references/1
  def update
    if @reference.update(reference_params)
      # re-initialise instance variables after updating a note
      @sorted_refs = Reference.all.sort_by { |r| [r.updated_at] }
      @references = Kaminari.paginate_array(@sorted_refs).page(params[:page]).per(7)
      render 'update_success'
    else
      render 'update_failure'
    end
  end
  
  # method to destroy multiple references at once
  def destroy_multiple
    Reference.destroy(params[:reference_ids])
    redirect_to references_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reference_params
      params.require(:reference).permit(:author, :publication_year, :content, slipbox_ids: [])
    end
  
end
