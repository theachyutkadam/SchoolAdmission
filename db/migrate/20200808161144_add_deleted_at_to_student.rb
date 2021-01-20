class AddDeletedAtToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :deleted_at, :datetime
  end
end
