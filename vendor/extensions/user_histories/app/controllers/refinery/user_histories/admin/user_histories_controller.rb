module Refinery
  module UserHistories
    module Admin
      class UserHistoriesController < ::Refinery::AdminController

        crudify :'refinery/user_histories/user_history',
                :title_attribute => 'field',
                :xhr_paging => true,
                :order => "created_at DESC"

      end
    end
  end
end
