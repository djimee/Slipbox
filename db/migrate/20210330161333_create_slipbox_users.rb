class CreateSlipboxUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :slipbox_users, id: false do |t|
      t.boolean :admin

      t.timestamps
    end
  end
end
