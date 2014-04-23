class CreateUserBadges < ActiveRecord::Migration
  def change
    create_table :user_badges do |t|
      t.string :email
      t.string :badge_title
      t.integer :tier_id
      t.boolean :added, default: false

      t.timestamps
    end
  end
end
