class CreateUserHistoriesUserHistories < ActiveRecord::Migration

  def up
    create_table :refinery_user_histories do |t|
      t.integer :user_id
      t.string :field
      t.string :original_value
      t.string :new_value
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-user_histories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/user_histories/user_histories"})
    end

    drop_table :refinery_user_histories

  end

end
