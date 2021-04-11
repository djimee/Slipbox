class TreesController < ApplicationController

    def index
        @trees = Tree.all
        @tree = Tree.new
    end

    def create 
        @tree = Tree.new(tree_params)

        if @tree.save
            redirect_to trees_path, notice: 'Tree was created.'
        else
            @trees = Tree.all
            render :index
        end

    end

    private

        def tree_params
            params.require(:tree).permit(:id, :title, :slipbox_id)
        end


end
