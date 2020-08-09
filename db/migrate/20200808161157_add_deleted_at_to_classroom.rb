class AddDeletedAtToClassroom < ActiveRecord::Migration[6.0]
  def change
    add_column :classrooms, :deleted_at, :datetime
  end
end
