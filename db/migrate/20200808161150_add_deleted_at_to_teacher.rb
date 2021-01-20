class AddDeletedAtToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :deleted_at, :datetime
  end
end
