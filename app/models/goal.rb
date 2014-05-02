class Goal < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  validates :target_date, presence: true

  def complete
    update(status: "completed", completed_on: Date.today)
  end
end
