class ChangeColumnNameInSlipbox < ActiveRecord::Migration[6.0]
  def change
    rename_column :slipboxes, :owner_id, :owner_username
  end
end
