require 'rails_helper'

RSpec.describe "Teachers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      teacher = create(:teacher)
      get "/teachers/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      teacher = create(:teacher)
      get "/teachers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      teacher = create(:teacher)
      get "/teachers/'#{teacher.id}'/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
