class UsersController < ApplicationController
  before_filter :check_if_authenticated!, only: [:show, :edit, :update, :destroy_order]
  def new
    @user = Refinery::User.new
  end

  def create
    @user = Refinery::User.new(params[:user])

    if @user.save
      @user.add_role(:backer)
      @user.send_activation
      badge = UserBadge.where(email: @user.email, added: false).first
      if badge
        # Assign user badge
        @user.user_pledges.create tier_id: badge.tier_id

        # Mark badge as added
        badge.added = true
        badge.save!
      end
      session[:return_after_activation] = params[:tier]

      redirect_to refinery.root_path, notice: "Activation e-mail sent to #{@user.email}."
    else
      render :new
    end
  end

  def show
    @user = Refinery::User.find(params[:id])
  end

  def edit
    # @user = Refinery::User.where(id: params[:id]).first
    @user = Refinery::User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = Refinery::User.find(params[:id])

    # If password is blank, allow user to skip password check
    params[:user].except!(:password, :password_confirmation) if params[:user][:password].blank?
    # Create duplicate of current state
    user_old = @user.dup
    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.log_history(user_old)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def log_in
    @user = Refinery::User.where('username = ? OR email = ?', params[:login], params[:login]).first

    if @user
      if @user.activated
        if @user.password_valid?(params[:password])
          sign_in(@user)
          if @user.has_role?(:superuser)
            redirect_to refinery.admin_root_path
          else
            redirect_to refinery.root_path
          end
        else
          flash[:error] = "#{@user.username}'s password is not valid!"
          redirect_to refinery.root_path
        end
      else
        flash[:error] = "#{@user.username} is not activated yet! <a href='#{resend_activation_user_url(@user.id)}'>Send it again!</a>"
        redirect_to refinery.root_path
      end
    else
      flash[:error] = "User with login #{params[:login]} does not exist!"
      redirect_to refinery.root_path
    end
  end

  def activate
    @user = Refinery::User.where(activation_token: params[:token]).first
    if @user
      @user.update_attributes({:activated => true, :activation_token => ''})
      sign_in(@user)
      flash[:notice] = "#{@user.username} (#{@user.id}) was successfully activated."
    else
      flash[:error] = "Invalid token or user does not exist!"
    end

    if session[:return_after_activation].present?
      redirect_to refinery.new_orders_order_path(tier: session[:return_after_activation])
    else
      redirect_to refinery.root_path
    end
  end

  def resend_activation
    @user = Refinery::User.where(id: params[:id]).first
    if @user
      @user.send_activation
      flash[:notice] = "Activation e-mail sent to #{@user.email}."
    end
    redirect_to refinery.root_path
  end

  def destroy_order
    order = Refinery::Orders::Order.where(id: params[:order_id]).first
    order.destroy if order

    redirect_to :back, notice: "Order was successfully deleted"
  end

  def reset_users_password
    user = Refinery::User.where(id: params[:id]).first
    if user
      salt = SecureRandom.hex(16)
      new_password = SecureRandom.urlsafe_base64 

      user.update_attribute :salt, salt
      user.update_attribute :hash_password, Pbkdf2.hash_password(new_password, salt, 64000, "sha256")
      
      redirect_to :back, notice: "New password set to: #{new_password}"
    else
      redirect_to :back, notice: "Password does not change! User does not exist!"
    end
  end



  def check_if_authenticated!

    user = Refinery::User.find(params[:id])

    if current_refinery_user
      redirect_to main_app.edit_user_url(current_refinery_user.id) if user.id != current_refinery_user.id
    else
      redirect_to refinery.root_path
    end

  end
end
