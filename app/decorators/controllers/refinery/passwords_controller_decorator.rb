Refinery::PasswordsController.class_eval do

  before_filter :store_password_reset_return_to, :only => [:update]
  def store_password_reset_return_to
    session[:'refinery_user_return_to'] = refinery.root_path
  end
  protected :store_password_reset_return_to
  
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
end
