class CreateJoinTableNotesReferences < ActiveRecord::Migration[6.0]
  def change
    create_join_table :notes, :references do |t|
      t.index [:note_id, :reference_id]
      t.index [:reference_id, :note_id]
    end
  end
end
