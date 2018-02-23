class RenamePeriodToGoalValue < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals, :period, :goal_value
  end
end
