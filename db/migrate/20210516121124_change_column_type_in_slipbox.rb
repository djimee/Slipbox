class ChangeColumnTypeInSlipbox < ActiveRecord::Migration[6.0]
  def change
    change_column :slipboxes, :owner_username, :string
  end
end
