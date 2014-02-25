Refinery::User.class_eval do
  # Whitelist the :background_image_id parameter for form submission
  attr_accessible :name, :street, :city, :country

  has_many :user_pledges, dependent: :destroy
  has_many :tiers, through: :user_pledges
  has_many :orders
  has_many :user_histories

  validates :name, :street, :city, :country, presence: true

  def log_history user_old
    fields = ["username", "email", "name", "street", "city", "country", "encrypted_password"]
    # Comapre which fields changed
    fields.each do |f|
      if user_old.send(f) != self.send(f)
        # Store them to db     
        ::Refinery::UserHistories::UserHistory.create user_id: id, field: f, original_value: user_old.send(f), new_value: self.send(f)
      end
    end
  end

end