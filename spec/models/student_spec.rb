require 'rails_helper'

RSpec.describe Student, type: :model do
  context "#create" do
    it "should create new student" do
      student = build(:student)
      student.save
      expect(student).to be_valid
    end
  end

  context "#delete" do
    it "should destroy student" do
      create(:student)
      Student.destroy_all
      expect(Student.count).to eq(0)
    end
  end

  context "#ActiveRecord association" do
    it "should belongs_to state" do
      expect(Student.reflect_on_association(:state).macro).to eq(:belongs_to)
    end

    it "should belongs_to district" do
      expect(Student.reflect_on_association(:district).macro).to eq(:belongs_to)
    end

    it "should belongs_to taluka" do
      expect(Student.reflect_on_association(:taluka).macro).to eq(:belongs_to)
    end
  end

end