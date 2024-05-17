require 'rails_helper'

RSpec.describe "DogBreeds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /fetch_breed" do
    it "returns http success" do
      get "/fetch_breed?breed=shihtzu"
      expect(response).to have_http_status(:success)
    end
  end
end
