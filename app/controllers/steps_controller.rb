class StepsController < ApplicationController

  def new
    @goal = current_user.goals.find(params[:goal_id])
    @step = @goal.steps.new
  end

  def create
    @goal = current_user.goals.find(params[:goal_id])
    @step = @goal.steps.new(step_params)
    if !@step.save
      render :new
    end
  end

  def update
    @step = Step.find(params[:id])
    @step.complete
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
  end

  private

  def step_params
    params.require(:step).permit(:description, :target_date, :status)
  end

end