require 'rails_helper'

RSpec.describe User, type: :model do
  context '#create' do
    it 'should create new user' do
      user = build(:user)
      user.save
      expect(user).to be_valid
    end

    it 'should give error message if username is empty' do
      user = build(:user, username: '')
      user.save
      expect(user.errors.messages[:username].first).to eq("can't be blank")
    end

    it 'should give error message if password is empty' do
      user = build(:user, password: '')
      user.save
      expect(user.errors.messages[:password].first).to eq("can't be blank")
    end

    it 'should give error message if password length less than 6 charactors' do
      user = build(:user, password: '123')
      user.save
      expect(user.errors.messages[:password].first).to eq('is too short (minimum is 6 characters)')
    end
  end

  context 'authenticate' do
    it 'should not authenticate if credentials are invalid' do
      is_valid = User.authenticate('invalid_username', 'invalid_password')
      expect(is_valid).to be_falsey
    end

    it 'should authenticate if credentials are valid' do
      user = build(:user, username: 'username', password: '123456')
      user.save
      is_valid = User.authenticate('username', '123456')
      expect(is_valid).to be_truthy
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to login' do
      expect(User.reflect_on_association(:login).macro).to eq(:belongs_to)
    end
  end
end
