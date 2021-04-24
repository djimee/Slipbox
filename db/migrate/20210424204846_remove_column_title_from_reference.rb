class RemoveColumnTitleFromReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :references, :title, :string
  end
end
