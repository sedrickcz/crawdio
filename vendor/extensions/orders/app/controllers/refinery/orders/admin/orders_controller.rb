module Refinery
  module Orders
    module Admin
      class OrdersController < ::Refinery::AdminController

        crudify :'refinery/orders/order',
                :title_attribute => 'pay_type',
                :xhr_paging => true

        def show
          @order = Order.find(params[:id])
        end
      end
    end
  end
end
