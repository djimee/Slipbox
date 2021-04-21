class AddSlipboxIdToTree < ActiveRecord::Migration[6.0]
  def change
    add_column :trees, :slipbox_id, :bigint, null: false
  end
end
