require 'rails_helper'

RSpec.describe Student, type: :model do
  context '#create' do
    it 'should create new student' do
      student = build(:student)
      student.save
      expect(student).to be_valid
    end
  end

  context '#delete' do
    it 'should destroy student' do
      create(:student)
      Student.destroy_all
      expect(Student.count).to eq(0)
    end
  end

  context '#validations' do
    it 'is not valid if first_name is empty' do
      student = build(:student, first_name: '')
      student.save
      expect(student).to_not be_valid
    end

    it 'is not valid if middle_name is empty' do
      student = build(:student, middle_name: '')
      student.save
      expect(student).to_not be_valid
    end

    it 'is not valid if last_name is empty' do
      student = build(:student, last_name: '')
      student.save
      expect(student).to_not be_valid
    end

    it 'is not valid if mother_name is empty' do
      student = build(:student, mother_name: '')
      student.save
      expect(student).to_not be_valid
    end

    it 'is not valid if date_of_birth is empty' do
      student = build(:student, date_of_birth: '')
      student.save
      expect(student).to_not be_valid
    end

    it 'should give error message if first_name is empty' do
      student = build(:student, first_name: '')
      student.save
      expect(student.errors.messages[:first_name].first).to eq("can't be blank")
    end

    it 'should give error message if middle_name is empty' do
      student = build(:student, middle_name: '')
      student.save
      expect(student.errors.messages[:middle_name].first).to eq("can't be blank")
    end

    it 'should give error message if last_name is empty' do
      student = build(:student, last_name: '')
      student.save
      expect(student.errors.messages[:last_name].first).to eq("can't be blank")
    end

    it 'should give error message if mother_name is empty' do
      student = build(:student, mother_name: '')
      student.save
      expect(student.errors.messages[:mother_name].first).to eq("can't be blank")
    end

    it 'should give error message if date_of_birth is empty' do
      student = build(:student, date_of_birth: '')
      student.save
      expect(student.errors.messages[:date_of_birth].first).to eq("can't be blank")
    end

    it 'is not valid if aadhaar_card_number is empty' do
      student = build(:student, aadhaar_card_number: '')
      student.save
      expect(student).to_not be_valid
    end
    context '#validation presence' do
      it 'should give error message if aadhaar_card_number is empty' do
        student = build(:student, aadhaar_card_number: '')
        student.save
        expect(student.errors.messages[:aadhaar_card_number].first).to eq("can't be blank")
      end
    end
    context '#validation numericality' do
      it 'should give error message if aadhaar_card_number is not number' do
        student = build(:student, aadhaar_card_number: 'invalid')
        student.save
        expect(student.errors.messages[:aadhaar_card_number].first).to eq('is not a number')
      end
    end
    context '#validation uniquness' do
      it 'should give error message if aadhaar_card_number already exits' do
        create(:student)
        student = build(:student, aadhaar_card_number: '121212121212')
        student.save
        expect(student.errors.messages[:aadhaar_card_number].first).to eq('has already been taken')
      end
    end
    context '#validation length' do
      it 'should give error message if aadhaar_card_number length is not 12 numbers' do
        student = build(:student, aadhaar_card_number: '123')
        student.save
        expect(student.errors.messages[:aadhaar_card_number].first).to eq('is the wrong length (should be 12 characters)')
      end
    end
  end

  context '#soft_delete' do
    it 'should soft delete the record' do
      student = create(:student)
      expect(student.deleted_at).to be_nil
      student.soft_delete
      expect(student.deleted_at).not_to be_nil
    end
  end

  context '#create_user' do
    it 'should create user after student successfully created' do
      create(:student)
      user = User.last.login_type
      expect(user).to eq('Student')
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to standard' do
      expect(Student.reflect_on_association(:standard).macro).to eq(:belongs_to)
    end

    it 'should belongs_to classroom' do
      expect(Student.reflect_on_association(:classroom).macro).to eq(:belongs_to)
    end

    it 'should has_many addresses' do
      expect(Student.reflect_on_association(:addresses).macro).to eq(:has_many)
    end
  end
end
