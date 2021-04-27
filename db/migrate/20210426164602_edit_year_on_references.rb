class EditYearOnReferences < ActiveRecord::Migration[6.0]
  def change
    rename_column :references, :year, :publication_year
  end
end
