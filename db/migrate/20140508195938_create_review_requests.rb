class CreateReviewRequests < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.belongs_to :athlete, index: true, null: false
      t.belongs_to :coach, index: true, null: false
      t.belongs_to :goal, index: true, null: false
      t.text :body

      t.timestamps
    end
  end
end
