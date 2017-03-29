require 'rails_helper'

RSpec.describe 'Reviews API', type: :request do
  # initialize test data 
  let!(:user) {create(:user)}
  let(:user_id) { user.id }
  let!(:tutorial) { create(:tutorial) }
  let(:tutorial_id) { tutorial.id }
  let!(:reviews) { create_list(:review, 10, tutorial_id: tutorial_id)}
  let(:review_id) { reviews.first.id }

  # Test suite for GET /users/:id/tutorials/:id/reviews
  describe 'GET /users/:id/tutorials/:id/reviews' do

    # make HTTP get request before each example
    before { get "/users/#{user_id}/tutorials/1/reviews" }

    it 'returns reviews' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id/tutorials/:id/reviews/:id
  describe 'GET /users/:id/tutorials/:id/reviews/:id' do
    before { get "/users/#{user_id}/tutorials/#{tutorial_id}/reviews/#{review_id}" }

    context 'when the record exists' do
      it 'returns the rating' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(review_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:review_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Review/)
      end
    end
  end

  # Test suite for POST /users/:id/tutorials/:id/reviews
  describe 'POST /users/:id/tutorials/:id/reviews' do
    # valid payload
    let(:valid_attributes) { { title: "A pretty great tutorial", content: "I've gone through quite a few tutorials and this is the best" } }

    context 'when the request is valid' do
      before { post "/users/#{user_id}/tutorials/#{tutorial_id}/reviews/", params: valid_attributes }
      it 'creates a tutorial' do
        expect(json['title']).to eq("A pretty great tutorial")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/users/#{user_id}/tutorials/#{tutorial_id}/reviews/", params: { title: "A pretty great tutorial"} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Content can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:id/tutorials/:id/reviews/:id
  describe 'PUT /users/:id/tutorials/:id/reviews/:id' do
    let(:valid_attributes) { { title: "A pretty OK tutorial" } }

    context 'when the record exists' do
      before { put "/users/#{user_id}/tutorials/#{tutorial_id}/reviews/#{review_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /users/:id/tutorials/:id
  describe 'DELETE /users/:id/tutorials/:id/reviews/:id' do
    before { delete "/users/#{user_id}/tutorials/#{tutorial_id}/reviews/#{review_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end