class AddShippingPriceToRefineryProjects < ActiveRecord::Migration
  def change
    add_column :refinery_projects, :shipping_price, :float, default: 0
  end
end
