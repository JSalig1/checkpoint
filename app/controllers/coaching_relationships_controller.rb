class CoachingRelationshipsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.coach @user
  end
  
  def destroy
    @user = User.find(params[:id])
    current_user.uncoach @user
  end
end