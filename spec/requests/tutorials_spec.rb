require 'rails_helper'

RSpec.describe 'Tutorials API', type: :request do
  # initialize test data 
  let!(:user) {create(:user)}
  let(:user_id) { user.id }
  let!(:tutorials) { create_list(:tutorial, 10) }
  let(:tutorial_id) { tutorials.first.id }

  # Test suite for GET /tutorials
  describe 'GET /tutorials' do
    # make HTTP get request before each example
    before { get "/tutorials" }

    it 'returns tutorials' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

   # Test suite for GET /users/:id/tutorials
  let!(:tutorials) { create_list(:tutorial, 10, user_id: user_id) }

  describe 'GET /users/:id/tutorials' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}/tutorials" }

    it 'returns tutorials' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id/tutorials/:id
  describe 'GET /users/:id/tutorials/:id' do
    before { get "/users/#{user_id}/tutorials/#{tutorial_id}" }

    context 'when the record exists' do
      it 'returns the tutorial' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tutorial_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tutorial_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tutorial/)
      end
    end
  end

  # Test suite for POST /users/:id/tutorials
  describe 'POST /users/:id/tutorials' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', description: 'Takes you from 0 to hero', url: 'www.itdo.com' } }

    context 'when the request is valid' do
      before { post "/users/#{:user_id}/tutorials", params: valid_attributes }

      it 'creates a tutorial' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/users/#{:user_id}/tutorials", params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Description can't be blank, Url can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:id/tutorials/:id
  describe 'PUT /users/:id/tutorials/:id' do
    let(:valid_attributes) { { title: 'Learn AngularJS' } }

    context 'when the record exists' do
      before { put "/users/#{user_id}/tutorials/#{tutorial_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /users/:id/tutorials/:id
  describe 'DELETE /users/:id/tutorials/:id' do
    before { delete "/users/#{user_id}/tutorials/#{tutorial_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end