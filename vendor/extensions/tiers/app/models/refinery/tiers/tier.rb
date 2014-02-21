module Refinery
  module Tiers
    class Tier < Refinery::Core::BaseModel
      self.table_name = 'refinery_tiers'

      attr_accessible :title, :price, :limit, :physical, :short_description, :long_description, :active, :image_1_id, :image_2_id, :image_3_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image_1, :class_name => '::Refinery::Image'

      belongs_to :image_2, :class_name => '::Refinery::Image'

      belongs_to :image_3, :class_name => '::Refinery::Image'

      has_many :user_pledges, dependent: :destroy
      has_many :users, through: :user_pledges
      has_many :orders
    end
  end
end
