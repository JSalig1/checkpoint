class User < ActiveRecord::Base
  include Clearance::User  
  has_many :goals, dependent: :destroy
  has_many :steps, through: :goals

  def current_goals
    goals.where(status: "current")
  end

  def completed_goals
    goals.where(status: "completed")
  end
end
