class AddSlipboxIdToSlipboxUser < ActiveRecord::Migration[6.0]
  def change
    add_column :slipbox_users, :slipbox_id, :bigint, null: false
  end
end
