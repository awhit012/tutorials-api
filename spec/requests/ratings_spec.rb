require 'rails_helper'

RSpec.describe 'Ratings API', type: :request do
  # initialize test data 
  let!(:user) {create(:user)}
  let(:user_id) { user.id }
  let!(:tutorial) { create(:tutorial, user_id: user_id) }
  let(:tutorial_id) { tutorial.id }
  let!(:ratings) { create_list(:rating, 10, user_id: user_id, tutorial_id: tutorial_id)}
  let(:rating_id) { ratings.first.id }

  # Test suite for GET /tutorials/:id/ratings
  describe 'GET /tutorials/:id/ratings' do

    # make HTTP get request before each example
    before { get "/tutorials/#{tutorial_id}/ratings" }

    it 'returns ratings' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tutorials/:id/ratings/:id
  describe 'GET /tutorials/:id/ratings/:id' do
    before { get "//tutorials/#{tutorial_id}/ratings/#{rating_id}" }

    context 'when the record exists' do
      it 'returns the rating' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(rating_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:rating_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rating/)
      end
    end
  end

  # Test suite for POST /tutorials/:id/ratings
  describe 'POST /tutorials/:id/ratings' do
    # valid payload
    let(:valid_attributes) { { value: 5 } }

    context 'when the request is valid' do
      before { post "/tutorials/#{tutorial_id}/ratings/", params: valid_attributes }
      it 'creates a tutorial' do
        expect(json['value']).to eq(5)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/tutorials/#{tutorial_id}/ratings/", params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Value can't be blank/)
      end
    end
  end

  # Test suite for PUT /tutorials/:id/ratings/:id
  describe 'PUT /tutorials/:id/ratings/:id' do
    let(:valid_attributes) { { value: 4 } }

    context 'when the record exists' do
      before { put "/tutorials/#{tutorial_id}/ratings/#{rating_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tutorials/:id
  describe 'DELETE /tutorials/:id/ratings/:id' do
    before { delete "/tutorials/#{tutorial_id}/ratings/#{rating_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end