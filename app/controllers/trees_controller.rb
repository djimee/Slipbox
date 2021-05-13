class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :edit, :update, :destroy]

  # GET /trees
  # Displays the tree with the unique id.
  def index
      @temp = getNoteData
      @trees = Tree.order("updated_at")
      @current_slipbox = Slipbox.new
  end

  # GET /trees/new
  # Creates a tree with the unique id.
  def new
      @tree = Tree.new
      # Get title of tree the note belongs to.
      @slipbox_title = params[:slipbox_title]
  end

  # GET /trees/new
  # Renders the page that shows the tree with the notes
  # that belong to that tree.
  def show
  end

  # GET /trees/1/edit
  def edit
    # TO DO: Delete if not necessary.
  end

  # PATCH/PUT /trees/1
  # Updates the parameters of the tree with the unique id.
  def update
      if @tree.update(tree_params)
          @trees = Tree.all
          redirect_to tree_path
      else
          redirect_to tree_path
      end
  end

  # POST /trees
  # Creates a tree with the unique id. 
  def create
      @tree = Tree.new(tree_params)

      if @tree.save
          redirect_to tree_path(@tree.id)
      else
          render :new
      end
  end 

  # TO DO: Add comments here.
  def self.noteToJson note
    note.to_json
  end

  # TO DO: Add comments here.
  def self.jsonToNote jsonNote
    JSON.parse jsonNote
  end

  # Retrieves note data (uniqueID and title) from the database.
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
