class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :edit, :update, :destroy]

  # GET /trees
  def index
    @trees = Tree.order("updated_at")
    @current_slipbox = Slipbox.new
  end

  # GET /trees/new
  def new
    @tree = Tree.new
  end

  # GET /trees/new
  def show
    if @tree.notes.empty?
      flash[:notice] = "There are currently no notes in the tree - '#{@tree.title}', create one below."
      redirect_to new_note_path
    else 
      # @notes_of_tree = @tree.notes
    end
  end

  # GET /trees/1/edit
  def edit
  end

  def update
    if @tree.update(tree_params)
        @trees = Tree.all
        redirect_to tree_path
    else
        redirect_to tree_path
    end
  end

  # POST /trees
  def create 
    @tree = Tree.new(tree_params)

    if @tree.save
        redirect_to @tree
    else
        render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree
      @tree = Tree.find(params[:id])
    end

    def tree_params
      params.require(:tree).permit(:title, :slipbox_id)
    end

end
