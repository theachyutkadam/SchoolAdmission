class AddStandardAndClassroomToStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :standard, references: :standard, index: true
    add_reference :students, :classroom, references: :classroom, index: true
  end
end
