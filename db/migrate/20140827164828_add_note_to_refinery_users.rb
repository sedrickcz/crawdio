class AddNoteToRefineryUsers < ActiveRecord::Migration
  def change
    add_column :refinery_users, :note, :text
  end
end
