require 'rails_helper'

RSpec.describe Taluka, type: :model do
  context "#create" do
    it "should create new taluka" do
      taluka = build(:taluka)
      taluka.save
      expect(taluka).to be_valid
    end
  end

  context "#delete" do
    it "should destroy taluka" do
      create(:taluka)
      Taluka.destroy_all
      expect(Taluka.count).to eq(0)
    end
  end

  context "#ActiveRecord associations" do
    it "should belongs_to district" do
      expect(Taluka.reflect_on_association(:district).macro).to eq(:belongs_to)
    end

    it 'should has_one student' do
      expect(District.reflect_on_association(:student).macro).to eq(:has_one)
    end
  end

end