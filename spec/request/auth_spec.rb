require 'rails_helper'

RSpec.describe 'User API Requests', type: :request do

let(:valid_attributes) { { first_name: Faker::HarryPotter.name, last_name: Faker::HarryPotter.name, email: Faker::Internet.email, password: 'passwordtest', password_confirmation: 'passwordtest' } }

  describe 'POST /auth' do
    
    context 'when the request is valid' do
      before { post '/auth/', params: valid_attributes }
      it 'creates an user' do
        expect(JSON.parse(response.body)['data']['first_name']).to eq(valid_attributes[:first_name])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/auth/', params: { first_name: 'Lorem Ipsum' } }

      it 'returns a validation failure message' do
        expect(response.body).to include('can\'t be blank')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
  
  describe "GET /user/get" do
    before { get '/user/get' }
    it "returns http unauthorized when requests to /user/get without token" do
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'signed out' do
    it 'when request protected route without token' do
      get '/auth/validate_token'
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
