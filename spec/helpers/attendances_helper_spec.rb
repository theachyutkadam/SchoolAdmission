require 'rails_helper'

RSpec.describe AttendancesHelper, type: :helper do
  context "#student_full_name" do
    it "should return student full name" do
      student = create(:student)
      student_full_name = helper.student_full_name student
      expect(student_full_name).to eq("first_name last_name")
    end
  end
end