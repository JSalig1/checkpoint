class Step < ActiveRecord::Base
  belongs_to :goal
  validates :description, presence: true
  validates :target_date, presence: true

  def completed?
    status == "completed"
  end

  def set_date_completed
    if completed?
      update(completed_on: Date.today)
    end
  end
end
