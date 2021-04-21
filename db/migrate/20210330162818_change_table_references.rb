class ChangeTableReferences < ActiveRecord::Migration[6.0]
  def change
    change_column_null :references, :author, false
  end
end
