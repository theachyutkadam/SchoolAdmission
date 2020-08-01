require 'rails_helper'

RSpec.describe "Standards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      standard = create(:standard, name: 'second')
      get "/standards"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      get "/standards/new"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      standard = create(:standard)
      post "/login", params: {login: {username: user.username, password: user.password}}
      get "/standards/#{standard.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end