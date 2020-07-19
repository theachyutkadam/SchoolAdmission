require 'rails_helper'

RSpec.describe District, type: :model do
  context "#create" do
    it "should create new district" do
      district = build(:district)
      district.save
      expect(district).to be_valid
    end
  end

  context "#delete" do
    it "should destroy district" do
      create(:district)
      District.destroy_all
      expect(District.count).to eq(0)
    end
  end

  context 'ActiveRecord associations' do
    it 'should belongs_to state' do
      expect(District.reflect_on_association(:state).macro).to eq(:belongs_to)
    end

    it 'should has_many talukas' do
      expect(District.reflect_on_association(:talukas).macro).to eq(:has_many)
    end
  end

end