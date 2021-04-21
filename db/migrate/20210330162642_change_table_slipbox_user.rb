class ChangeTableSlipboxUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :slipbox_users, :admin, false
  end
end
