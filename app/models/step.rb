class Step < ActiveRecord::Base
  belongs_to :goal
  validates :description, presence: true
  validates :target_date, presence: true
end
