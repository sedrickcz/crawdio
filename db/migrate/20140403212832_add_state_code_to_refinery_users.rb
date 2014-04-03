class AddStateCodeToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :state_code, :string
  end
end
