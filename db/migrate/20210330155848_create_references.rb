class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :author
      t.string :rest_of_reference

      t.timestamps
    end
  end
end
