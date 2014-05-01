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
      render :new
    end
  end

  def destroy
    @goal = find_goal
    @goal.destroy
  end

  private

  def find_goal
    Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:description, :target_date, :status)
  end

end
