class TreesController < ApplicationController
    before_action :set_tree, only: [:show, :edit, :update, :destroy]

    results = ActiveRecord::Base.connection.execute("select * from notes")
    puts "\n\n\nhere results\n\n"
    results.each do |row|
      uniqID = row['unique_identifier']
      title = row['title']

      puts uniqID
      puts title
    end
    puts "\nthere results\n\n\n"


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

    def self.noteToJson note
      note.to_json
    end

    def self.jsonToNote jsonNote
      JSON.parse jsonNote
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
