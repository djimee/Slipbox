class TreesController < ApplicationController
    before_action :set_tree, only: [:show, :edit, :update, :destroy]

    # GET /trees
    def index
        @temp = getNoteData
        @trees = Tree.order("updated_at")
        @current_slipbox = Slipbox.new
    end

    # GET /trees/new
    def new
        @tree = Tree.new
    end

    # GET /trees/new
    def show
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

    def self.noteToJson note
      note.to_json
    end

    def self.jsonToNote jsonNote
      JSON.parse jsonNote
    end

    #retrieve note data (uniqueID and title) from DB
    def getNoteData
      results = ActiveRecord::Base.connection.execute("select * from notes")
      i = 0
      noteData = {}

      results.each do |row|
        i += 1

        # save the title and uniqueID in a hash to be used in the JS script
        uniqID = row['unique_identifier']
        title = row['title']
        noteData[i] = [uniqID, title]
      end

      # puts noteData
      return noteData
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
