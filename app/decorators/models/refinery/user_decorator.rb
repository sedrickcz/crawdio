Refinery::User.class_eval do
  # Whitelist the :background_image_id parameter for form submission
  attr_accessible :name, :street, :city, :country, :note, :activated, :activation_token, :age, :state_code, :zip, :salt, :hash_password, :is_forum_user

  has_many :user_pledges, dependent: :destroy
  has_many :tiers, through: :user_pledges, class_name: '::Refinery::Tiers::Tier'
  has_many :orders, class_name: '::Refinery::Orders::Order'
  has_many :user_histories

  validates :name, :street, :city, :country, presence: true
  validates :age, :numericality => {:greater_than_or_equal_to => 18}

  before_validation :hash_password!
  before_validation :clean_username
  before_validation :clean_email

  def clean_username
    self.username = username.downcase.gsub(/[^a-zA-Z0-9_]/,"")
  end

  def clean_email
    self.email = email.downcase
  end

  def log_history user_old
    fields = ["username", "email", "name", "street", "city", "country","state_code", "age", "encrypted_password", "zip"]
    # Comapre which fields changed
    fields.each do |f|
      if user_old.send(f) != self.send(f)
        # Store them to db
        ::Refinery::UserHistories::UserHistory.create user_id: id, field: f, original_value: user_old.send(f), new_value: self.send(f)
      end
    end
  end

  def free_shipping?
    zero_shipping_price = ['US', 'CA', 'CZ', 'CH', 'NO', 'AT', 'BE', 'BG', 'HR', 'CY', 'DK', 'EE', 'FI', 'FR', 'DE', 'GR', 'HU', 'IE', 'IT', 'LV', 'LT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SE', 'GB']
    zero_shipping_price.include?(country)
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

  def password_valid? entered_password
    Pbkdf2.hash_password(entered_password, salt, 64000, "sha256") == hash_password rescue false
  end

  private

  def hash_password!
    if password
      self.salt = SecureRandom.hex(16)
      self.hash_password = Pbkdf2.hash_password(password, salt, 64000, "sha256")
    end
  end

  def generate_activation_token!
    self.activation_token = SecureRandom.urlsafe_base64
    save!
  end
end
