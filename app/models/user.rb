class User < ActiveRecord::Base
  include Clearance::User  
  has_many :goals, dependent: :destroy
  has_many :steps, through: :goals

  has_many :coaching_relationships,
    foreign_key: :coach_id,
    dependent: :destroy

  has_many :athletes, through: :coaching_relationships

  has_many :coaching_relationships,
    foreign_key: :athlete_id,
    dependent: :destroy

  has_many :coaches, through: :coaching_relationships
  
  has_many :review_requests, foreign_key: :athlete_id

  def current_goals
    goals.where(status: "current")
  end

  def completed_goals
    goals.where(status: "completed")
  end

  def coach(athlete)
    coaching_relationships.create(athlete: athlete)
  end
  
  def coaching?(athlete)
    athlete_ids.include? athlete.id
  end
  
  def uncoach(athlete)
    athletes.destroy athlete
  end
end
