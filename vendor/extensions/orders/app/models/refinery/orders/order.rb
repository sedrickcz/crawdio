module Refinery
  module Orders
    class Order < Refinery::Core::BaseModel
      self.table_name = 'refinery_orders'

      attr_accessible :user_id, :tier_id, :price, :paid, :paid_at, :pay_type, :payment_id, :email, :tier_name, :name, :street, :city, :country, :position, :upgrade

      attr_accessor :upgrade

      belongs_to :user
      belongs_to :tier, class_name: '::Refinery::Tiers::Tier'

      validates :email, presence: true
      validates :name, :street, :city, :country, presence: true, :if => :is_physical?

      def is_physical?
        tier.physical
      end


      def prepare user
        # set user_id
        self.user_id = user.id

        # If user want to upgrade, count difference or set full price
        if upgrade == "1"
          if old_tier = user.highest_tier
            self.price = tier.price - old_tier.price
          end
        else
          self.price = tier.price
        end
        self.tier_name = tier.title
      end

      def self.pledgers
        self.where(paid: true).size
      end

      def self.pledged
        self.where(paid: true).sum('price')
      end
    end
  end
end
