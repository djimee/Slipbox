class RemoveIdFromNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :id, :bigint
  end
end
