class DeleteTableSlipboxUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :slipbox_users
  end
end
