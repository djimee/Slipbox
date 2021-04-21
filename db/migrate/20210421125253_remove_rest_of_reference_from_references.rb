class RemoveRestOfReferenceFromReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :references, :rest_of_reference, :string
  end
end
