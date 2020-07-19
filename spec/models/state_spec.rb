require 'rails_helper'

RSpec.describe State, type: :model do
  context "#create" do
    it "should create new state" do
      state = build(:state)
      state.save
      expect(state).to be_valid
    end
  end
end