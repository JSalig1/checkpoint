class User < ActiveRecord::Base
  include Clearance::User  
  has_many :goals, dependent: :destroy
  has_many :steps, through: :goals

  has_many :coach_to_athlete_relationships,
    foreign_key: :coach_id,
    class_name: "CoachingRelationship",
    dependent: :destroy
  has_many :athletes, through: :coach_to_athlete_relationships

  has_many :athlete_to_coach_relationships,
    foreign_key: :athlete_id,
    class_name: "CoachingRelationship",
    dependent: :destroy
  has_many :coaches, through: :athlete_to_coach_relationships

  has_many :review_requests, foreign_key: :athlete_id
  has_many :review_requests, foreign_key: :coach_id

  def current_goals
    goals.where(status: "current")
  end

  def completed_goals
    goals.where(status: "completed")
  end

  def owns_step?(step)
    steps.include? step
  end

  def owns_goal?(goal)
    goals.include? goal
  end

  def coach(athlete)
    coach_to_athlete_relationships.create(athlete_id: athlete.id)
  end

  def coaching?(athlete)
    athlete_ids.include? athlete.id
  end

  def uncoach(athlete)
    athletes.destroy athlete
  end

  def has_coaches?
    coaches != []
  end

  def coaches_athletes?
    athletes != []
  end

  def has_coach_reviews?
    review_requests != []
  end
end
