class CreateOrdersOrders < ActiveRecord::Migration

  def up
    create_table :refinery_orders do |t|
      t.integer :user_id
      t.integer :tier_id
      t.float :price
      t.boolean :paid
      t.datetime :paid_at
      t.string :pay_type
      t.integer :payment_id
      t.string :email
      t.string :tier_name
      t.string :name
      t.string :street
      t.string :city
      t.string :country
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-orders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/orders/orders"})
    end

    drop_table :refinery_orders

  end

end
