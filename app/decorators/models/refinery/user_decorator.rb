Refinery::User.class_eval do
  # Whitelist the :background_image_id parameter for form submission
  attr_accessible :name, :street, :city, :country

  has_many :user_pledges, dependent: :destroy
  has_many :tiers, through: :user_pledges
  has_many :orders

  validates :name, :street, :city, :country, presence: true

end