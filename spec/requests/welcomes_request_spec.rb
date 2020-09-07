require 'rails_helper'
RSpec.describe 'Welcomes', type: :request do
  describe '#login' do
    it 'returns http field' do
      post '/login', params: { login: { username: 'invalid username', password: 'invalid password' } }
      get '/welcomes/index'
      expect(response).to have_http_status(302)
    end
    it 'returns http success' do
      user = create(:user)
      post '/login', params: { login: { username: user.username, password: user.password } }
      get '/welcomes/index'
      expect(response).to have_http_status(:success)
    end

    it 'should student login' do
      student = create(:student)
      post '/login', params: { login: { username: student.user.username, password: student.user.password } }
      get '/welcomes/index'
      expect(response).to have_http_status(:success)
    end

    it 'should teacher login' do
      standard = create(:standard)
      teacher = create(:teacher)
      classroom = create(:classroom, teacher: teacher)
      create(:student, standard: standard, classroom: classroom)
      post '/login', params: { login: { username: teacher.user.username, password: teacher.user.password } }
      get '/welcomes/index'
      expect(response).to have_http_status(:success)
    end

    # it 'should headmaster login' do
    #   student = create(:student)
    #   post '/login', params: { login: { username: user.username, password: user.password } }
    #   get '/welcomes/index'
    #   expect(response).to have_http_status(:success)
    # end
  end
end
