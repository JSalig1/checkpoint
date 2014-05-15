class DashboardsController < ApplicationController

  def show
    @users = User.all
  end

end
