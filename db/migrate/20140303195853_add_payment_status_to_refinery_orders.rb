class AddPaymentStatusToRefineryOrders < ActiveRecord::Migration
  def change
    add_column :refinery_orders, :payment_status, :string
    add_column :refinery_orders, :cart_id, :integer
    add_column :refinery_orders, :transaction_id, :integer
  end
end
