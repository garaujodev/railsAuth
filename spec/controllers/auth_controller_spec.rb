require 'rails_helper'

RSpec.describe AuthController, type: :controller do

  describe "GET #get" do
    it "returns http unauthorized" do
      get :get
      expect(response).to have_http_status(:unauthorized)
    end
  end

    describe "GET #show" do
    it "returns http unauthorized" do
      get :get
      expect(response).to have_http_status(:unauthorized)
    end
  end
    describe "GET #update" do
    it "returns http unauthorized" do
      get :get
      expect(response).to have_http_status(:unauthorized)
    end
  end
    describe "GET #delete" do
    it "returns http unauthorized" do
      get :get
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
