require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'login' do
    it 'should successfully login' do
      user = create(:user)
      post '/login', params: { login: { username: user.username, password: user.password } }
      expect(response).to have_http_status(302)
    end

    it 'is not login if credentials are invalid' do
      post '/login', params: { login: { username: 'invalid', password: 'invalid' } }
      expect(response).to have_http_status(401)
    end

    it 'should give success message if login success' do
      user = create(:user)
      post '/login', params: { login: { username: user.username, password: user.password } }
      expect(request.flash[:success]).to eq('Successfully Login.')
    end

    it 'should give error message if login faild' do
      post '/login', params: { login: { username: 'invalid', password: 'invalid' } }
      expect(request.flash[:error]).to eq('Login Field')
    end
  end
end
