class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :update, :destroy]

	def index
		@reviews = Review.all
		json_response(@reviews)
	end

	def create
		@review = Review.create!(review_params)
		json_response(@review, :created)
	end

	def show
		json_response(@review)
	end

	def update
		@review.update(review_params)
		head :no_content
	end

	def destroy
		@review.destroy
		head :no_content
	end

	private
	def review_params
		params.permit(:title, :content, :tutorial_id)
	end

	def set_review
		@review = Review.find(params[:id])
	end

end
