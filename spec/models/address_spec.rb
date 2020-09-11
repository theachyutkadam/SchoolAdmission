require 'rails_helper'

RSpec.describe Address, type: :model do

  context '#create' do
    it 'should create new address' do
      address = build(:address)
      address.save
      expect(address).to be_valid
    end

    it 'should create new address with teacher polymorphic association' do
      teacher = create(:teacher)
      address_teacher = create(:address, addressable: teacher)
    end

    it 'should destroy address' do
      address = create(:address)
      address.destroy
      expect(address).to be_valid
    end
  end

  context '#validations' do
    it 'is not valid if pincode is empty' do
      address = build(:address, pincode: " ")
      address.save
      expect(address.errors.messages[:pincode].first).to eq("can't be blank")
    end

    it 'is not valid if pincode is not a number' do
      address = build(:address, pincode: "achyut")
      address.save
      expect(address.errors.messages[:pincode].first).to eq("is not a number")
    end

    it 'is not valid if pincode is less than 6 digit' do
      address = build(:address, pincode: "111")
      address.save
      expect(address.errors.messages[:pincode].first).to eq("is the wrong length (should be 6 characters)")
    end

    it 'is not valid if pincode is greater than 6 digit' do
      address = build(:address, pincode: "1111111")
      address.save
      expect(address.errors.messages[:pincode].first).to eq("is the wrong length (should be 6 characters)")
    end

    it 'is not valid if pincode is not unique' do
      student = create(:student, aadhaar_card_number: "999999999999")
      create(:address, addressable: student)
      address = build(:address, pincode: "111111")
      address.save
      expect(address.errors.messages[:pincode].first).to eq("has already been taken")
    end
  end

  context "#ActiveRecord associations" do
    it 'should belongs_to country' do
      expect(Address.reflect_on_association(:country).macro).to eq(:belongs_to)
    end

    it 'should belongs_to state' do
      expect(Address.reflect_on_association(:state).macro).to eq(:belongs_to)
    end

    it 'should belongs_to district' do
      expect(Address.reflect_on_association(:district).macro).to eq(:belongs_to)
    end

    it 'should belongs_to taluka' do
      expect(Address.reflect_on_association(:taluka).macro).to eq(:belongs_to)
    end

    it 'should belongs_to addressable' do
      expect(Address.reflect_on_association(:addressable).macro).to eq(:belongs_to)
    end
  end
end
