class CreateJoinTableSlipboxesReferences < ActiveRecord::Migration[6.0]
  def change
    create_join_table :slipboxes, :references do |t|
      t.index [:slipbox_id, :reference_id]
      t.index [:reference_id, :slipbox_id]
    end
  end
end
