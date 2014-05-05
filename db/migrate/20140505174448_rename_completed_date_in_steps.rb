class RenameCompletedDateInSteps < ActiveRecord::Migration
  def change
    rename_column :steps, :completed_date, :completed_on
  end
end
