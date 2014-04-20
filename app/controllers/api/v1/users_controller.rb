class Api::V1::UsersController < Api::V1::ApplicationController
  def import
    user = Refinery::User.new username: params[:user_info][:username], email: params[:user_info][:email], activated: true, age: 18, password: SecureRandom.hex(16), hash_pasword: params[:user_info][:pasword], salt: params[:user_info][:salt]
    # if user.save
      
    #   user.user_pledges.create tier_id: 
  end
end