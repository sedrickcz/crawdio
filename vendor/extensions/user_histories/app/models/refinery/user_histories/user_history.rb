module Refinery
  module UserHistories
    class UserHistory < Refinery::Core::BaseModel
      self.table_name = 'refinery_user_histories'

      attr_accessible :user_id, :field, :original_value, :new_value, :position

      belongs_to :user
    end
  end
end
