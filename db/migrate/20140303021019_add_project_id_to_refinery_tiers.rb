class AddProjectIdToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :project_id, :integer
  end
end
