require 'rails_helper'

RSpec.describe Teacher, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context '#create' do
    it 'should create new teacher' do
      teacher = Teacher.create({
        first_name: "rajesh",
        middle_name: "vikas",
        last_name: "kale",
        mother_name: "anita",
        date_of_birth: Date.current - 35.year,
        date_of_join: Date.current - 10.year,
        aadhaar_card_number: "111111111111",
        education: "M.C.A",
        speciality: "Programming",
        contact: "9879879870",
        alternate_contact: "9879879870",
        address: "",
        is_active: true 
      })
      teacher.save
      expect(Teacher.count).to eq(1)
    end

    it 'should not create teacher if first_name is empty' do
      
    end
  end
end
