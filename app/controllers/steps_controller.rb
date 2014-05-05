class StepsController < ApplicationController

  def new
    @goal = current_user.goals.find(params[:goal_id])
    @step = Step.new
  end

  def create
    goal = current_user.goals.find(params[:goal_id])
    step = current_user.steps.new(step_params)
    if !step.save
      render :new
    end
  end

  private

  def step_params
    params.require(:step).permit(:description, :target_date, :status)
  end

end