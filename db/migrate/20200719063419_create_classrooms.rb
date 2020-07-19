class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :division
      t.string :medium
      t.integer :intake
      t.references :teacher, null: false, foreign_key: true
      t.references :standard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
