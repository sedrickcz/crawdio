class AddAddressToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :name, :string
    add_column :refinery_users, :street, :string
    add_column :refinery_users, :city, :string
    add_column :refinery_users, :country, :string
  end
end
