class AddAdditionsToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :platform_1, :boolean, default: false
    add_column :refinery_tiers, :platform_2, :boolean, default: false
    add_column :refinery_tiers, :tshirt, :boolean, default: false
    add_column :refinery_tiers, :ingame_name, :boolean, default: false
    add_column :refinery_tiers, :sword_legal, :boolean, default: false
  end
end
