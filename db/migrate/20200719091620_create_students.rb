class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mother_name
      t.string :gender
      t.date :date_of_birth
      t.string :aadhaar_card_number
      t.string :standard
      t.references :state, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.references :taluka, null: false, foreign_key: true
      t.string :town
      t.boolean :is_handicap
      t.text :handicap_details
      t.boolean :is_active

      t.timestamps
    end
  end
end
