class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :steps, dependent: :destroy
  validates :description, presence: true
  validates :target_date, presence: true

  def completed?
    status == "completed"
  end

  def add_date_completed
    if status == "completed"
      update(completed_on: Date.today)
    end
  end

  def current_steps
    steps.where(status: "current")
  end

  def completed_steps
    steps.where(status: "completed")
  end

  def has_steps?
    steps != []
  end
end
