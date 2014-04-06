Refinery::User.class_eval do
  # Whitelist the :background_image_id parameter for form submission
  attr_accessible :name, :street, :city, :country,  :activated, :activation_token, :age, :state_code

  has_many :user_pledges, dependent: :destroy
  has_many :tiers, through: :user_pledges, class_name: '::Refinery::Tiers::Tier'
  has_many :orders, class_name: '::Refinery::Orders::Order'
  has_many :user_histories

  validates :name, :street, :city, :country, presence: true
  validates :age, :numericality => {:greater_than_or_equal_to => 18}

  def log_history user_old
    fields = ["username", "email", "name", "street", "city", "country","state_code", "age", "encrypted_password"]
    # Comapre which fields changed
    fields.each do |f|
      if user_old.send(f) != self.send(f)
        # Store them to db
        ::Refinery::UserHistories::UserHistory.create user_id: id, field: f, original_value: user_old.send(f), new_value: self.send(f)
      end
    end
  end

  def highest_tier
    tiers.order(:position).last || nil
  end

  def send_activation
    generate_activation_token!
    begin
      Mailer.activation_email(self).deliver
    rescue => e
      Rails.logger.error '==========START ERROR============'
      Rails.logger.error "Activation e-mail to #{email}(#{id}) not sent => #{e.inspect}"
      Rails.logger.error '===========END ERROR============='
    end
  end

  private
  def generate_activation_token!
    self.activation_token = SecureRandom.urlsafe_base64
    save!
  end
end
