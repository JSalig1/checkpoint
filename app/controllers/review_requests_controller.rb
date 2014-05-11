class ReviewRequestsController < ApplicationController
  
  def index
    @review_requests = current_user.review_requests
  end

  def new
    @reviewable_goal = Goal.find(params[:goal_id])
    @review_request = @reviewable_goal.review_requests.new
  end

  def create
    ReviewRequest.create(review_request_params)
  end
  
  def show
    @review_request = ReviewRequest.find(params[:id])
    @goal = @review_request.goal
  end

  private

  def review_request_params
    params.require(:review_request).permit(
      :body,
      :goal_id,
      :coach_id,
      :athlete_id
      )
  end

end
