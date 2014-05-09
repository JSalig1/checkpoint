class ReviewRequest < ActiveRecord::Base
  belongs_to :athlete, class_name: "User"
  belongs_to :coach, class_name: "User"

  validates :coach_id, presence: true
  validates :athlete_id, presence: true
  validates :goal_id, presence: true
end
