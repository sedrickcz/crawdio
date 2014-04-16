class AddZipToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :zip, :string
    add_column :refinery_orders, :zip, :string
  end
end
