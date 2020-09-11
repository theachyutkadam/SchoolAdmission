require 'rails_helper'

RSpec.describe "Attendances", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: { login: {username: user.username, password: user.password} }
      student = create(:student, aadhaar_card_number: "987987879789")
      create(:attendance, student:student)
      get "/attendances"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: { login: {username: user.username, password: user.password} }
      get "/attendances/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: { login: {username: user.username, password: user.password} }
      student = create(:student, aadhaar_card_number: "987987879789")
      attendance = create(:attendance, student: student)
      get "/attendances/#{attendance.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
