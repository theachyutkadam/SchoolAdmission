require 'rails_helper'

RSpec.describe Standard, type: :model do
  context "#create" do
    it 'should give error message if name is empty' do
      standard = Standard.new
      standard.save
      expect(standard.errors.messages[:name].first).to eq("can't be blank")
    end
  end
end
