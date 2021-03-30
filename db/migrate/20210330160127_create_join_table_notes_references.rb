class CreateJoinTableNotesReferences < ActiveRecord::Migration[6.0]
  def change
    create_join_table :notes, :references do |t|
      t.index [:note_unique_identifier, :reference_id]
      t.index [:reference_id, :note_unique_identifier]
    end
  end
end
