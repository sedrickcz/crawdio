class Api::V1::UsersController < Api::V1::ApplicationController
  def import
    user = Refinery::User.create! username: params[:user_info][:username], email: params[:user_info][:email], activated: true, age: 18, password: SecureRandom.hex(16), hash_password: params[:user_info][:password], salt: params[:user_info][:salt], name: "Fill your name", street: "Fill your street", city: "Fill your city", country: "US"
    user.add_role(:backer)
    render json: {}, status: 200
  end

  def export
    users = Refinery::User.where(is_forum_user: false, activated: true)
      
    render json: users, each_serializer: UserSerializer, status: 200
  end

  def update_user
    user = Refinery::User.where(email: params[:email]).first

    user.hash_password = params[:password]
    user.salt = params[:salt]

    user.save
      
    render json: {}, status: 200
  end
end