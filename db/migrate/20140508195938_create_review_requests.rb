class CreateReviewRequests < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.belongs_to :athlete, index: true
      t.belongs_to :coach, index: true
      t.belongs_to :goal, index: true
      t.text :body

      t.timestamps
    end
  end
end
