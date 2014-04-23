class UserBadge < ActiveRecord::Base
  attr_accessible :added, :badge_title, :email, :tier_id
end
