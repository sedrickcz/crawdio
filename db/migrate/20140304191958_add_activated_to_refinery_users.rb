class AddActivatedToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :activated, :boolean, default: false
    add_column :refinery_users, :activation_token, :string
  end
end
