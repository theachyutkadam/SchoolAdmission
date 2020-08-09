require 'rails_helper'
RSpec.describe 'Welcomes', type: :request do
  describe '#login' do
    it 'returns http field' do
      post '/login', params: { login: { username: 'invalid username', password: 'invalid password' } }
      get '/welcomes/index'
      expect(response).to have_http_status(302)
    end
    it 'returns http success' do
      user = create(:user, username: 'ravi', password: '123456')
      post '/login', params: { login: { username: user.username, password: user.password } }
      get '/welcomes/index'
      expect(response).to have_http_status(:success)
    end
  end
end
