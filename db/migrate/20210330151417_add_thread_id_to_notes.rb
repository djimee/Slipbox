class AddThreadIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :thread_id, :bigint, null: false
  end
end
