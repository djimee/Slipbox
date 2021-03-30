class CreateSlipboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :slipboxes do |t|
      t.string :title

      t.timestamps
    end
  end
end
