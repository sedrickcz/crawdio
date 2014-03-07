class AddSideTextToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :side_text, :text
  end
end
