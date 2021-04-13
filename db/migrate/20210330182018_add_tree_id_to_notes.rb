class AddTreeIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :tree_id, :bigint, null: false
  end
end
