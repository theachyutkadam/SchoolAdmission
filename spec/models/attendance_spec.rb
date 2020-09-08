require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context "#ActiveRecord associations" do
    it "should belongs_to student" do
      expect(Attendance.reflect_on_association(:student).macro).to be(:belongs_to)
    end

    it "should belongs_to teacher" do
      expect(Attendance.reflect_on_association(:teacher).macro).to be(:belongs_to)
    end
  end
end