class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :steps, dependent: :destroy
  validates :description, presence: true
  validates :target_date, presence: true

  def complete
    update(status: "completed", completed_on: Date.today)
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
