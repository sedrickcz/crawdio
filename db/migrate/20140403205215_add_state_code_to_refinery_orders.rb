class AddStateCodeToRefineryOrders < ActiveRecord::Migration
  def change
    add_column :refinery_orders, :state_code, :string
  end
end
