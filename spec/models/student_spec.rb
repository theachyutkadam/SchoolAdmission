require 'rails_helper'

RSpec.describe Student, type: :model do
  context "#create" do
    it "should create new student" do
      student = build(:student)
      student.save
      expect(student).to be_valid
    end
  end
end