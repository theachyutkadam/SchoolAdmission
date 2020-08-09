class AddDeletedAtToStandard < ActiveRecord::Migration[6.0]
  def change
    add_column :standards, :deleted_at, :datetime
  end
end
