module Refinery
  module Orders
    module Admin
      class OrdersController < ::Refinery::AdminController

        crudify :'refinery/orders/order',
                :title_attribute => 'pay_type',
                :xhr_paging => true

      end
    end
  end
end
