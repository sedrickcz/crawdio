class CreateProjectsProjects < ActiveRecord::Migration

  def up
    create_table :refinery_projects do |t|
      t.string :title
      t.text :short_description
      t.text :long_description
      t.float :goal
      t.integer :main_image_id
      t.integer :image_1_id
      t.integer :image_2_id
      t.integer :image_3_id
      t.integer :image_4_id
      t.integer :image_5_id
      t.boolean :active
      t.string :video
      t.text :faq
      t.text :terms
      t.text :updates
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-projects"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/projects/projects"})
    end

    drop_table :refinery_projects

  end

end
