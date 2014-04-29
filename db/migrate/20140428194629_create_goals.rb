class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user, index: true
      t.text :description, null: false
      t.date :target_date, null: false
      t.string :status, limit: 128, null: false, default: "current"

      t.timestamps
    end
  end
end
