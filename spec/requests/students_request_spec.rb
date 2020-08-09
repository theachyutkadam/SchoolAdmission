require 'rails_helper'

RSpec.describe 'Students', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      user = create(:user)
      post '/login', params: { login: { username: user.username, password: user.password } }
      student = create(:student)
      get '/students/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      user = create(:user)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get '/students/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      user = create(:user)
      student = create(:student)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get "/students/#{student.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
