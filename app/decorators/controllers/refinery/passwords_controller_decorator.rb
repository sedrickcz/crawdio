Refinery::PasswordsController.class_eval do

  before_filter :store_password_reset_return_to, :only => [:update]
  after_filter :give_notice, :only => [:update]
  def store_password_reset_return_to
    session[:'refinery_user_return_to'] = refinery.root_path
  end
  protected :store_password_reset_return_to

  def give_notice
  end
  protected :give_notice

  # POST /registrations/password
  def create
    if params[:refinery_user].present? and (email = params[:refinery_user][:email]).present? and
      (user = ::Refinery::User.where(:email => email).first).present?

      # Call devise reset function.
      user.send(:generate_reset_password_token!)
      ::Refinery::UserMailer.reset_notification(user, request).deliver
      redirect_to refinery.root_path,
        :notice => t('email_reset_sent', :scope => 'refinery.users.forgot')
    else
      flash.now[:error] = if (email = params[:refinery_user][:email]).blank?
        t('blank_email', :scope => 'refinery.users.forgot')
      else
        t('email_not_associated_with_account_html', :email => ERB::Util.html_escape(email), :scope => 'refinery.users.forgot').html_safe
      end

      @refinery_user = ::Refinery::User.new

      render :new
    end
  end

  # PUT /resource/password
  def update
    user = ::Refinery::User.where(reset_password_token: params[:refinery_user][:reset_password_token]).first

    if user
      if !params[:refinery_user][:password].blank? and params[:refinery_user][:password] == params[:refinery_user][:password_confirmation]
        salt = SecureRandom.hex(16)
        user.update_attribute(:salt, salt)
        user.update_attribute(:hash_password, Pbkdf2.hash_password(params[:refinery_user][:password], salt, 64000, "sha256"))
        user.update_attribute(:reset_password_token, nil)
        sign_in(user)
        redirect_to refinery.root_path, notice: "Your password has been successfully changed"
      else
        flash[:error] = "Password blank or does not match"
        redirect_to :back
      end
    else
      flash[:error] = "Valid reset password token not found"
      redirect_to :back
    end

  end
end
