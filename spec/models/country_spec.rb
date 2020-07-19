require 'rails_helper'

RSpec.describe Country, type: :model do
  context "#create" do
    it "should create new country" do
      country = build(:country)
      country.save
      expect(country).to be_valid
    end
  end
end