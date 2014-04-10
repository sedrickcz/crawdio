class AddGoalTextToRefineryProjects < ActiveRecord::Migration
  def change
    add_column :refinery_projects, :goal_text, :text
  end
end
