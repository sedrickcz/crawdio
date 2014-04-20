class AddSaltToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :salt, :string
  end
end
