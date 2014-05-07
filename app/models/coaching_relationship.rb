class CoachingRelationship < ActiveRecord::Base
  belongs_to :coach, class_name: "User"
  belongs_to :athlete, class_name: "User"

  validates :coach_id,
    uniqueness: { scope: :athlete_id }
    
  validate :cannot_coach_yourself
  
  private
  
  def cannot_coach_yourself
    if coach_id == athlete_id
      errors.add(:base, "This is unnecessary.")
    end
  end
  
end
