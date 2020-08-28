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
      get "/welcomes/index?user=#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'should student login' do
      role = create(:role, name: 'Student')
      user = create(:user, username: 'student', password: '123456', role_id: role.id)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get "/welcomes/index?user=#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'should teacher login' do
      role = create(:role, name: 'Teacher')
      user = create(:user, username: 'teacher', password: '123456', role_id: role.id)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get "/welcomes/index?user=#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'should headmaster login' do
      role = create(:role, name: 'Headmaster')
      user = create(:user, username: 'headmaster', password: '123456', role_id: role.id)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get "/welcomes/index?user=#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
