class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :hash_password, :salt, :badge_title
  
  def badge_title
    if tier = object.highest_tier
      return tier.badge_title
    else
      return ""
    end
  end

end