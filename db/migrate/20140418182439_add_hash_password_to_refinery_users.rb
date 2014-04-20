class AddHashPasswordToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :hash_password, :string
  end
end
