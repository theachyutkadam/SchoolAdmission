require 'rails_helper'

RSpec.describe State, type: :model do
  context "#create" do
    it "should create new state" do
      state = build(:state)
      state.save
      expect(state).to be_valid
    end
  end

  context "#delete" do
    it "should destroy state" do
      create(:state)
      State.destroy_all
      expect(State.count).to eq(0)
    end
  end

  context 'ActiveRecord associations' do
    it 'should belongs_to state' do
      expect(State.reflect_on_association(:country).macro).to eq(:belongs_to)
    end

    it 'should has_many districts' do
      expect(State.reflect_on_association(:districts).macro).to eq(:has_many)
    end
  end

end