module Refinery
  module Orders
    class Order < Refinery::Core::BaseModel
      self.table_name = 'refinery_orders'

      attr_accessible :user_id, :tier_id, :price, :paid, :paid_at, :pay_type, :payment_id, :email, :tier_name, :name, :street, :city, :country, :position

      belongs_to :user
      belongs_to :tier
    end
  end
end
