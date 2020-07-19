require 'rails_helper'

RSpec.describe District, type: :model do
  context "#create" do
    it "should create new district" do
      district = build(:district)
      district.save
      expect(district).to be_valid
    end
  end
end