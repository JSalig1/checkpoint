class ReviewRequestsController < ApplicationController

  def new
    @reviewable_goal = Goal.find(params[:goal_id])
    @review_request = @reviewable_goal.review_requests.new
  end

  def create
    current_user.review_requests.create(review_request_params)
  end

  private

  def review_request_params
    params.require(:review_request).permit(:body, :goal_id, :coach_id)
  end

end