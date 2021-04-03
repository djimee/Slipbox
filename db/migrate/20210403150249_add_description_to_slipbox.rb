class AddDescriptionToSlipbox < ActiveRecord::Migration[6.0]
  def change
    add_column :slipboxes, :description, :string
  end
end
