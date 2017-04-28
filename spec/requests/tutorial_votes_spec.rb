# require 'rails_helper'

# RSpec.describe 'TutorialVotes API', type: :request do
#   # initialize test data 
#   let!(:user) {create(:user)}
#   let(:user_id) { user.id }
#   let!(:tutorial) { create(:tutorial, user_id: user_id) }
#   let(:tutorial_id) { tutorial.id }
#   let!(:votes) { create_list(:vote, 10, user_id: user_id, tutorial_id: tutorial_id)}
#   let(:vote_id) { votes.first.id }

#   # Test suite for POST /tutorials/:id/upvote
#   describe 'POST /tutorials/:id/upvote' do
#     # valid payload
#     let(:valid_attributes) { { id: tutorial_id} }

#     context 'when the request is valid' do
#       before { post "/tutorials/#{tutorial_id}/votes/", params: valid_attributes }
#       it 'creates a tutorial' do
#         expect(json['value']).to eq(5)
#       end

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end

#     context 'when the request is invalid' do
#       before { post "/tutorials/#{tutorial_id}/votes/", params: { } }

#       it 'returns status code 422' do
#         expect(response).to have_http_status(422)
#       end

#       it 'returns a validation failure message' do
#         expect(response.body)
#           .to match(/Validation failed: Value can't be blank/)
#       end
#     end
#   end
# end