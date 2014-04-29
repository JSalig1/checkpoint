class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if !@goal.save
      @target = @goal
      render :form_errors
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :target_date, :status)
  end

end
