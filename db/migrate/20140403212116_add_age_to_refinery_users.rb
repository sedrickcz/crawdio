class AddAgeToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :age, :integer, default: 0
  end
end
