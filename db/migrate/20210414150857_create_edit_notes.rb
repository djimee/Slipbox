class CreateEditNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :edit_notes do |t|
      t.string :title

      t.timestamps
    end
  end
end
