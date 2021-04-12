class TreesController < ApplicationController
    before_action :set_tree, only: [:show, :edit, :update, :destroy]

    # GET /trees
    def index
        @trees = Tree.all
    end

    # GET /trees/new
    def new
        @tree = Tree.new
    end

    # GET /trees/new
    # redirects to the general tree page currently
    def show
        # redirect_to trees_path
    end

    # GET /trees/1/edit
    def edit
    end

    def update
        if @tree.update(tree_params)
            @trees = Tree.all
            redirect_to tree_path, notice: "Tree was updated."
        else
            redirect_to tree_path, notice: "There was a problem updating tree."
        end
    end

    # POST /trees
    def create 
        @tree = Tree.new(tree_params)

        if @tree.save
            redirect_to @tree, notice: 'Tree was successfully created.'
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
