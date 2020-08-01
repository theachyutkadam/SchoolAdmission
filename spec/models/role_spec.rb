require 'rails_helper'

RSpec.describe Role, type: :model do
  context '#create' do
    it 'should create new role' do
      before_count = Role.count
      create(:role)
      expect(Role.count).to eq(before_count + 1)
    end
  end

  context '#validation' do
    it 'it should not create role if name is empty' do
      role = build(:role, name: '')
      role.save
      expect(role).to_not be_valid
    end

    it 'it should give error message if name is empty' do
      role = build(:role, name: '')
      role.save
      expect(role.errors.messages[:name].first).to eq("can't be blank")
    end
  end

  context "#student?" do
    it "should return true if role is student" do
      role = create(:role)
      is_student = role.student?
      expect(is_student).to be_truthy
    end

    it "should return false if role is not student" do
      role = build(:role, name: 'teacher')
      is_student = role.student?
      expect(is_student).to be_falsey
    end
  end
end