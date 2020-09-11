require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: {login: {username: user.username, password: user.password} }
      address = create(:address, user: user)
      get "/addresses"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: {login: {username: user.username, password: user.password} }
      address = create(:address, user: user)
      get "/addresses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      post '/login', params: {login: {username: user.username, password: user.password} }
      student = create(:student, aadhaar_card_number: "963963741741")
      create(:address, user: student.user)
      address = create(:address, user: user)
      get "/addresses/#{address.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
