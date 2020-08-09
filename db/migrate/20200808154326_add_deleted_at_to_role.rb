class AddDeletedAtToRole < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :deleted_at, :datetime
  end
end
