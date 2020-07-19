require 'rails_helper'

RSpec.describe Taluka, type: :model do
  context "#create" do
    it "should create new taluka" do
      taluka = build(:taluka)
      taluka.save
      expect(taluka).to be_valid
    end
  end
end