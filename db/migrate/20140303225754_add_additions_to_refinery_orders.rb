class AddAdditionsToRefineryOrders < ActiveRecord::Migration
  def change
    add_column :refinery_orders, :platform_1, :string
    add_column :refinery_orders, :platform_2, :string
    add_column :refinery_orders, :tshirt, :string
    add_column :refinery_orders, :ingame_name, :string
    add_column :refinery_orders, :sword_legal, :boolean, default: false
    add_column :refinery_orders, :agree, :boolean, default: false
  end
end
