require 'rails_helper'

RSpec.describe "Addresses", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/addresses/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/addresses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/addresses/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
