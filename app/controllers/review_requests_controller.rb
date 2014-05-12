class ReviewRequestsController < ApplicationController
  
  def index
    @review_requests = current_user.review_requests
  end

  def new
    @reviewable_goal = Goal.find(params[:goal_id])
    @review_request = @reviewable_goal.review_requests.new
  end

  def create
    @reviewable_goal = Goal.find(params[:goal_id])
    @reviewable_goal.review_requests.create(review_request_params)
  end
  
  def show
    @review_request = ReviewRequest.find(params[:id])
    @goal = @review_request.goal
  end

  private

  def review_request_params
    params.require(:review_request).permit(
      :body,
      :coach_id
    ).merge(
      athlete_id: current_user.id
    )
  end

end
