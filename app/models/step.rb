class Step < ActiveRecord::Base
  belongs_to :goal
  validates :description, presence: true
  validates :target_date, presence: true

  def complete
    update(status: "completed", completed_on: Date.today)
  end
end
