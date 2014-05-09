class ReviewRequest < ActiveRecord::Base
  belongs_to :athlete, class_name: "User"
  belongs_to :coach, class_name: "User"
end
