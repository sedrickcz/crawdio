class Api::V1::UsersController < Api::V1::ApplicationController
  def import
    Refinery::User.create! username: params[:user_info][:username], email: params[:user_info][:email], activated: true, age: 18, password: SecureRandom.hex(16), hash_password: params[:user_info][:pasword], salt: params[:user_info][:salt], name: "Fill your name", street: "Fill your street", city: "Fill your city", country: "US"
    render json: {}, status: 200
  end
end