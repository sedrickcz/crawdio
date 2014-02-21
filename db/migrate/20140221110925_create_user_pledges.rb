class CreateUserPledges < ActiveRecord::Migration
  def change
    create_table :user_pledges do |t|
      t.integer :user_id
      t.integer :tier_id

      t.timestamps
    end
  end
end
