class AddOwnerIdToSlipbox < ActiveRecord::Migration[6.0]
  def change
    add_column :slipboxes, :owner_id, :bigint
  end
end
