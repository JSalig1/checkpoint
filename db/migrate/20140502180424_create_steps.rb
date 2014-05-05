class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :goal, index: true
      t.text :description, null: false
      t.date :target_date, null: false
      t.string :status, limit: 128, null: false, default: "current"
      t.date :completed_date
      
      t.timestamps
    end
  end
end
