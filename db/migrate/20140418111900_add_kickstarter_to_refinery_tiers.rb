class AddKickstarterToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :kickstarter, :boolean, default: false
  end
end
