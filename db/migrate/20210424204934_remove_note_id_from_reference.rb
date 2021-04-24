class RemoveNoteIdFromReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :references, :note_id, :bigint
  end
end
