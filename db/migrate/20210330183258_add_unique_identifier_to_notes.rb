class AddUniqueIdentifierToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :unique_identifier, :string, null: false
  end
end
