class AddUserIdToSlipboxUser < ActiveRecord::Migration[6.0]
  def change
    add_column :slipbox_users, :user_id, :bigint, null: false
  end
end
