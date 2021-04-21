class ChangeSlipboxNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :slipboxes, :title, false 
  end
end
