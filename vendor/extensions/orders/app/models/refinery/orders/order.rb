module Refinery
  module Orders
    class Order < Refinery::Core::BaseModel
      self.table_name = 'refinery_orders'
      include ActionView::Helpers::NumberHelper

      attr_accessible :user_id, :tier_id, :price, :paid, :paid_at, :pay_type, :payment_id, :email, :tier_name, :name, :street, :city, :country, :position, :upgrade, :payment_status, :cart_id, :transaction_id

      attr_accessor :upgrade

      belongs_to :user
      belongs_to :tier, class_name: '::Refinery::Tiers::Tier'

      validates :email, presence: true
      validates :name, :street, :city, :country, presence: true, :if => :is_physical?

      def is_physical?
        tier.physical
      end

      def price_in_cent
        (number_to_currency(price, {:unit => "", :separator => ".", :delimiter => "", :format => "%n", :precision => 2}).to_f * 100).round
      end

      def paypal_url(return_url, notify_url) 
        values = { 
        :business => 'paypal-facilitator@sedrick.cz',
        :cmd => '_cart',
        :upload => 1,
        :notify_url => notify_url,
        :return => return_url,
        :invoice => 1 + rand(100000)
        }

        values.merge!({ 
        "amount_1" => price,
        "item_name_1" => tier_name,
        "item_number_1" => tier_id,
        "quantity_1" => '1'
        })

        "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
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
