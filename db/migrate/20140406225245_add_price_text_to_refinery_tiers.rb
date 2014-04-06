class AddPriceTextToRefineryTiers < ActiveRecord::Migration
  def change
    add_column :refinery_tiers, :price_text, :text
  end
end
