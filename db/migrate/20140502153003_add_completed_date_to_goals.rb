class AddCompletedDateToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completed_date, :date
  end
end
