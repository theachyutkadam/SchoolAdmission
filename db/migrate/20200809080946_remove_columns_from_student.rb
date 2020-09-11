class RemoveColumnsFromStudent < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :state_id
    remove_column :students, :district_id
    remove_column :students, :taluka_id
  end
end
