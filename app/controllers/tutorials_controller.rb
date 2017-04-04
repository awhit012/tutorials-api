class TutorialsController < ApplicationController
	before_action :set_tutorial, only: [:show, :update, :destroy]

  def index

    if params[:user_id]
      @tutorials = User.find(params[:user_id]).tutorials
    else
      @tutorials = Tutorial.all
    end
    json_response(@tutorials)   
  end

  def create
    @tutorial = Tutorial.create!(tutorial_params)
    json_response(@tutorial, :created)
  end

  def show
    json_response(@tutorial)
  end

  def update
    @tutorial.update(tutorial_params)
    head :no_content
  end

  def destroy
    @tutorial.destroy
    head :no_content
  end

  private

  def tutorial_params
    params.permit(:title, :description, :url)
  end

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end
end
