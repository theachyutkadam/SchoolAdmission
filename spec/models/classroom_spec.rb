require 'rails_helper'

RSpec.describe Classroom, type: :model do
  context '#create' do
    it 'should create new classroom' do
      standard = Standard.create({name: "first"})
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
      classroom = Classroom.new({medium: "marathi", standard_id: standard.id, teacher_id: teacher.id})
      classroom.save
      expect(Classroom.count).to eq(1)
    end
    # it 'it should not create new classroom' do
    # end
  end
end
