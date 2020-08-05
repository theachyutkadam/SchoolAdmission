require 'rails_helper'

RSpec.describe "Classrooms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      classroom = create(:classroom)
      get "/classrooms"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      get "/classrooms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      post "/login", params: {login: {username: user.username, password: user.password}}
      classroom = create(:classroom)
      get "/classrooms/'#{classroom.id}'/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
