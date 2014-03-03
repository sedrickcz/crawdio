class ChangeTransactionIdToString < ActiveRecord::Migration
  def change
    change_column :refinery_orders, :transaction_id, :string
  end
end
