class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mother_name
      t.string :gender
      t.date :date_of_birth
      t.date :date_of_join
      t.string :aadhaar_card_number
      t.string :education
      t.string :speciality
      t.string :contact
      t.string :alternate_contact
      t.text :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
