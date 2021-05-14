class CreateJoinTableSlipboxUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :slipboxes, :users do |t|
      t.index [:slipbox_id, :user_id]
      t.index [:user_id, :slipbox_id]
    end
  end
end
