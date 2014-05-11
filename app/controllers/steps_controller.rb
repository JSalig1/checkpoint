class StepsController < ApplicationController

  def new
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.new(step_params)
    if !@step.save
      render :new
    end
  end

  def edit
    @step = find_step
  end

  def update
    @step = find_step
    @step.update(step_params)
    @step.set_date_completed
  end

  def destroy
    @step = find_step
    @step.destroy
  end

  private

  def find_step
    Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:description, :target_date, :status)
  end

end