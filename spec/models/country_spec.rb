require 'rails_helper'

RSpec.describe Country, type: :model do
  context '#create' do
    it 'should create new country' do
      country = build(:country)
      country.save
      expect(country).to be_valid
    end
  end

  context '#delete' do
    it 'should destroy country' do
      create(:country)
      Country.destroy_all
      expect(Country.count).to eq(0)
    end
  end

  context '#ActiveRecord associations' do
    it 'should has_many states' do
      expect(Country.reflect_on_association(:states).macro).to eq(:has_many)
    end
  end
end
