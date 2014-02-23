class UsersController < ApplicationController
  def new
    @user = Refinery::User.new
  end

  def create
    @user = Refinery::User.new(params[:user])

    if @user.save 
      @user.add_role(:backer)
      sign_in(@user)
      redirect_to refinery.root_path
    else
      render :new
    end
  end

  def show
    @user = Refinery::User.where(id: params[:id]).first
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def log_in
    @user = Refinery::User.where('username = ? OR email = ?', params[:login], params[:login]).first

    if @user
      if @user.valid_password?(params[:password])
        sign_in(@user)
      else
      end
    else
    end
    redirect_to refinery.root_path
  end
end
