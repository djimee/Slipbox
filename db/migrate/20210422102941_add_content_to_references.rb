class AddContentToReferences < ActiveRecord::Migration[6.0]
  def change
    add_column :references, :content, :string
  end
end
