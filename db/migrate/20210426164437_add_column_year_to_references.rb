class AddColumnYearToReferences < ActiveRecord::Migration[6.0]
  def change
    add_column :references, :year, :integer
  end
end
