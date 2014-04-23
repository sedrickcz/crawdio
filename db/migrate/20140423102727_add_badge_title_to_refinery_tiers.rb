class AddBadgeTitleToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :badge_title, :string
  end
end
