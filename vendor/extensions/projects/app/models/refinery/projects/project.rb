module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :title, :short_description, :long_description, :goal, :goal_text, :main_image_id, :image_1_id, :image_2_id, :image_3_id, :image_4_id, :image_5_id, :active, :video, :faq, :terms, :updates, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :main_image, :class_name => '::Refinery::Image'

      belongs_to :image_1, :class_name => '::Refinery::Image'

      belongs_to :image_2, :class_name => '::Refinery::Image'

      belongs_to :image_3, :class_name => '::Refinery::Image'

      belongs_to :image_4, :class_name => '::Refinery::Image'

      belongs_to :image_5, :class_name => '::Refinery::Image'

      has_many :tiers, class_name: '::Refinery::Tiers::Tier'
    end
  end
end
