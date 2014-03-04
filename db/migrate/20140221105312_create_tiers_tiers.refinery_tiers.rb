# This migration comes from refinery_tiers (originally 1)
class CreateTiersTiers < ActiveRecord::Migration

  def up
    create_table :refinery_tiers do |t|
      t.string :title
      t.float :price
      t.integer :limit
      t.boolean :physical
      t.text :short_description
      t.text :long_description
      t.boolean :active
      t.integer :image_1_id
      t.integer :image_2_id
      t.integer :image_3_id
      t.integer :project_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tiers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tiers/tiers"})
    end

    drop_table :refinery_tiers

  end

end
