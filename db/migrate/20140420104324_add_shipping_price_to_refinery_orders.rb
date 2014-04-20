class AddShippingPriceToRefineryOrders < ActiveRecord::Migration
  def change
    add_column :refinery_orders, :shipping_price, :float, default: 0
  end
end
