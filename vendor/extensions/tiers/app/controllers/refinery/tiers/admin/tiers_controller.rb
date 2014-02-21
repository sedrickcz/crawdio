module Refinery
  module Tiers
    module Admin
      class TiersController < ::Refinery::AdminController

        crudify :'refinery/tiers/tier',
                :xhr_paging => true

      end
    end
  end
end
