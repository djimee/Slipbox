class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  # GET /references
  def index
    # sort references with most recently updated reference first
    @references = Reference.page(params[:page]).order(:updated_at).reverse_order

    # action to create a new reference on the index page
    @reference = Reference.new
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  # GET /references/1
  # Redirects to showing the reference with the unique id.
  def show
  end

  # GET /references/1/edit
  # Renders the page for editing the contents of the reference.
  def edit
    render layout: false
  end

  # DELETE /references/1
  # Deletes the reference with the unique id and 
  # redirects to the page showing all the references.
  def destroy
    @reference.destroy
    redirect_to references_url
  end

  # POST /references
  # Creates a references with the correct parameters
  # and redirects to the page showing all the references.
  def create
    @reference = Reference.new(reference_params)

    if @reference.save
      redirect_to references_path
    else
      @references = Reference.page(params[:page]).order(:updated_at).reverse_order
      render :index
    end
  end

  # PATCH/PUT /references/1
  # Updates the contents of the reference with theh unique id.
  def update
    if @reference.update(reference_params)
      @references = Reference.page(params[:page]).order(:updated_at).reverse_order
      render 'update_success'
    else
      render 'update_failure'
    end
  end
  
  # Destroys multiple references at once.
  def destroy_multiple
    if params[:reference_ids].nil?
      flash[:alert] = "No references selected"
    else 
      Reference.destroy(params[:reference_ids])
    end
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
