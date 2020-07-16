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
        gender: "male",
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
      Classroom.new({division: 'A', medium: "marathi", standard_id: standard.id, teacher_id: teacher.id}).save
      expect(Classroom.count).to eq(1)
    end

    it 'should not create new classroom if medium is empty' do
      standard = Standard.create({name: "first"})
      teacher = Teacher.create({
        first_name: "rajesh",
        middle_name: "vikas",
        last_name: "kale",
        mother_name: "anita",
        gender: "male",
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
      Classroom.new({division: 'A', medium: '', standard_id: standard.id, teacher_id: teacher.id}).save
      expect(Classroom.count).to eq(0)
    end

    it 'should give error message if division is empty' do
      standard = Standard.create({name: "first"})
      teacher = Teacher.create({
        first_name: "rajesh",
        middle_name: "vikas",
        last_name: "kale",
        mother_name: "anita",
        gender: "male",
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
      classroom = Classroom.new({division: '', medium: 'marathi', standard_id: standard.id, teacher_id: teacher.id})
      classroom.save
      expect(classroom.errors.messages[:division].first).to eq("can't be blank")
    end

  end
end
