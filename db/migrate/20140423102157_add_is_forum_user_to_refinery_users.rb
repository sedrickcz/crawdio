class AddIsForumUserToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :is_forum_user, :boolean, default: false
  end
end
