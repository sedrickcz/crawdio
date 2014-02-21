class UserPledge < ActiveRecord::Base
  attr_accessible :tier_id, :user_id
  belongs_to :user
  belongs_to :tier
end
