class RemoveStandardFromStudent < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :standard, :bigint
  end
end
