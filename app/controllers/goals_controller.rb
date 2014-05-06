class GoalsController < ApplicationController

  def index
    @current_goals = current_user.current_goals
    @completed_goals = current_user.completed_goals
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

  def show
    @goal = find_goal
    @current_steps = @goal.current_steps
    @completed_steps = @goal.completed_steps
  end

  def edit
    @goal = find_goal
  end

  def update
    @goal = find_goal
    @goal.update(goal_params)
    @goal.set_date_completed
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
