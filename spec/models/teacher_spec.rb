require 'rails_helper'

RSpec.describe Teacher, type: :model do
  context '#create' do
    it 'should create new teacher' do
      create(:teacher)
      expect(Teacher.count).to eq(1)
    end
  end

  context '#destroy' do
    it 'should create new teacher' do
      create(:teacher)
      Teacher.destroy_all
      expect(Teacher.count).to eq(0)
    end
  end

  context '#validation' do
    it 'should not create teacher if first_name is empty' do
      teacher = build(:teacher, first_name: '')
      teacher.save
      expect(Teacher.count).to eq(0)
    end

    it 'should give error message if first_name is empty' do
      teacher = build(:teacher, first_name: '')
      teacher.save
      expect(teacher.errors.messages[:first_name].first).to eq("can't be blank")
    end

    it 'should give error message if middle_name is empty' do
      teacher = build(:teacher, middle_name: '')
      teacher.save
      expect(teacher.errors.messages[:middle_name].first).to eq("can't be blank")
    end

    it 'should give error message if last_name is empty' do
      teacher = build(:teacher, last_name: '')
      teacher.save
      expect(teacher.errors.messages[:last_name].first).to eq("can't be blank")
    end

    it 'should give error message if mother_name is empty' do
      teacher = build(:teacher, mother_name: '')
      teacher.save
      expect(teacher.errors.messages[:mother_name].first).to eq("can't be blank")
    end

    it 'should give error message if date_of_birth is empty' do
      teacher = build(:teacher, date_of_birth: '')
      teacher.save
      expect(teacher.errors.messages[:date_of_birth].first).to eq("can't be blank")
    end

    it 'should give error message if date_of_join is empty' do
      teacher = build(:teacher, date_of_join: '')
      teacher.save
      expect(teacher.errors.messages[:date_of_join].first).to eq("can't be blank")
    end

    it 'should give error message if gender is empty' do
      teacher = build(:teacher, gender: '')
      teacher.save
      expect(teacher.errors.messages[:gender].first).to eq("is not included in the list")
    end

    it 'should give error message if contact is empty' do
      teacher = build(:teacher, contact: '')
      teacher.save
      expect(teacher.errors.messages[:contact].first).to eq("can't be blank")
    end

    it 'should give error message if contact is string' do
      teacher = build(:teacher, contact: 'invalid_contact')
      teacher.save
      expect(teacher.errors.messages[:contact].first).to eq("is not a number")
    end

    it 'should give error message if contact length greater than 15' do
      teacher = build(:teacher, contact: '1234567891234567')
      teacher.save
      expect(teacher.errors.messages[:contact].first).to eq("is too long (maximum is 15 characters)")
    end

    it 'should give error message if contact length less than 10' do
      teacher = build(:teacher, contact: '987456321')
      teacher.save
      expect(teacher.errors.messages[:contact].first).to eq("is too short (minimum is 10 characters)")
    end
  end
end