require 'rails_helper'

RSpec.describe ClassroomsHelper, type: :helper do
  context "#teacher_full_name" do
    it 'should return teacher full name' do
      teacher = create(:teacher, first_name: "ram", last_name: "mule")
      teacher_full_name = helper.teacher_full_name teacher
      expect(teacher_full_name).to eq("ram mule")
    end
  end
end
