class ChangeNotes < ActiveRecord::Migration[6.0]
  def change
    change_column_null :notes, :content, false
  end 
end
