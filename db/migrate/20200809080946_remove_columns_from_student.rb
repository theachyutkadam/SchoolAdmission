class RemoveColumnsFromStudent < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :state_id, :integer
    remove_column :students, :district_id, :integer
    remove_column :students, :taluka_id, :integer
  end
end
