class RatingsController < ApplicationController
	before_action :set_rating, only: [:show, :update, :destroy]

	def index
		@ratings = Rating.all
		json_response(@ratings)
	end

	def create
		@rating = Rating.create!(rating_params)
		json_response(@rating, :created)
	end

	def show
		json_response(@rating)
	end

	def update
		@rating.update(rating_params)
		head :no_content
	end

	def destroy
		@rating.destroy
		head :no_content
	end

	private

	def rating_params
		params.permit(:value, :tutorial_id)
	end

	def set_rating
		@rating = Rating.find(params[:id])
	end
end
