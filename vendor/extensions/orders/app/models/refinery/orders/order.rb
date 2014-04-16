module Refinery
  module Orders
    class Order < Refinery::Core::BaseModel
      self.table_name = 'refinery_orders'
      include ActionView::Helpers::NumberHelper

      attr_accessible :user_id, :state_code, :tier_id, :price, :paid, :paid_at, :pay_type, :payment_id, :email, :tier_name, :name, :street, :city, :zip, :country, :position, :upgrade, :payment_status, :cart_id, :transaction_id, :platform_1, :platform_2, :tshirt, :ingame_name, :sword_legal, :agree

      attr_accessor :upgrade

      belongs_to :user
      belongs_to :tier, class_name: '::Refinery::Tiers::Tier'

      validates :email, :agree, presence: true
      validates :name, :street, :city, :country, :zip, presence: true, :if => :is_physical?


      def is_physical?
        tier.physical
      end

      def price_in_cent
        (number_to_currency(price, {:unit => "", :separator => ".", :delimiter => "", :format => "%n", :precision => 2}).to_f * 100).round
      end

      def paypal_url(return_url, notify_url)
        values = {
          :business => 'martin.klima@warhorsestudios.cz',
          # :business => 'paypal-facilitator@sedrick.cz',
          :cmd => '_cart',
          :upload => 1,
          :notify_url => notify_url,
          :return => return_url,
          :invoice => id
        }

        values.merge!({
                        "amount_1" => price,
                        "item_name_1" => tier_name,
                        "item_number_1" => tier_id,
                        "quantity_1" => '1'
        })

        "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
        # "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
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

      def self.default_pledgers
        35384
      end

      def self.default_pledged
        1839452
      end

      def self.pledgers
        default_pledgers + self.where(paid: true).size
      end

      def self.pledged
        default_pledged + self.where(paid: true).sum('price')
      end

      def self.progress
        project = Refinery::Projects::Project.find(1)
        pledged/(project.goal/100).to_i
      end
    end
  end
end
