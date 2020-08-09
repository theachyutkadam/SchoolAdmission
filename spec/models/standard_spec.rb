require 'rails_helper'

RSpec.describe Standard, type: :model do
  context '#create' do
    it 'should create new standard' do
      create(:standard)
      expect(Standard.count).to eq(1)
    end
  end

  context '#validation' do
    it 'is not valid if name is empty' do
      standard = build(:standard, name: '')
      standard.save
      expect(standard).to_not be_valid
    end

    it 'it should give error message if name is empty' do
      standard = build(:standard, name: '')
      standard.save
      expect(standard.errors.messages[:name].first).to eq("can't be blank")
    end
  end

  context 'ActiveRecord associations' do
    it 'should has_many standard' do
      expect(Standard.reflect_on_association(:classrooms).macro).to eq(:has_many)
    end
  end

  context '#soft_delete' do
    it 'should soft delete the record' do
      standard = create(:standard)
      expect(standard.deleted_at).to be_nil
      standard.soft_delete
      expect(standard.deleted_at).not_to be_nil
    end
  end
end
