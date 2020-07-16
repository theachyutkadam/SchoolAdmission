require 'rails_helper'

RSpec.describe Standard, type: :model do
  context "#create" do
    it 'should create new standard' do
      create(:standard)
      expect(Standard.count).to eq(1)
    end

    it 'it should not create standard if name is empty' do
      standard = build(:standard, name: '')
      standard.save
      expect(Standard.count).to eq(0)
    end

    it 'it should give error message if name is empty' do
      standard = build(:standard, name: '')
      standard.save
      expect(standard.errors.messages[:name].first).to eq("can't be blank")
    end
  end
end