require 'rails_helper'

RSpec.describe Teacher, type: :model do
  context '#create' do
    it 'should create new teacher' do
      teacher = create(:teacher)
      teacher.save
      expect(Teacher.count).to eq(1)
    end

    it 'should not create teacher if first_name is empty' do
      teacher = build(:teacher, first_name: '')
      teacher.save
      expect(Teacher.count).to eq(0)
    end
  end

  context '#validation' do
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

    it 'should give error message if gender is empty' do
      teacher = build(:teacher, gender: '')
      teacher.save
      expect(teacher.errors.messages[:gender].first).to eq("can't be blank")
    end

  end

  # context '#enum' do
  #   it 'should respond_to method on gender male?' do
  #     teacher = build(:teacher)
  #     teacher.save
  #     expect(teacher).to respond_to(:male?)
  #   end

  #   it 'should respond_to method on gender female?' do
  #     teacher = create(:teacher)
  #     teacher.save
  #     expect(teacher).to respond_to(:female?)
  #   end

  #   it 'should respond_to method on gender transgender?' do
  #     teacher = create(:teacher)
  #     teacher.save
  #     expect(teacher).to respond_to(:transgender?)
  #   end
  # end
end
