class TutorialVotesController < ApplicationController
	before_action :set_tutorial, only: [:upvote, :downvote]

	def upvote
		@tutorial.upvote_by current_user
		@tutorial.save!
		head :no_content
	end

	def downvote
		@tutorial.downvote_by current_user
		@tutorial.save!
		head :no_content
	end
	# def index
	# 	@ratings = Rating.all
	# 	json_response(@ratings)
	# end

	# def create
	# 	@rating = Rating.create!(rating_params)
	# 	json_response(@rating, :created)
	# end

	# def destroy
	# 	@rating.destroy
	# 	head :no_content
	# end

	private

	def rating_params
		params.permit(:value, :tutorial_id)
	end

	def set_tutorial
		@tutorial = Tutorial.find(params[:id])
	end
end
