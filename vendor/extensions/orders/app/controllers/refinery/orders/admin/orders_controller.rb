module Refinery
  module Orders
    module Admin
      class OrdersController < ::Refinery::AdminController

        crudify :'refinery/orders/order',
                :title_attribute => 'pay_type',
                :xhr_paging => true,
                :order => "created_at DESC"

        def index
          orders = Refinery::Orders::Order.order("created_at DESC")
          @orders = orders.page(params[:page])
          respond_to do |format|
            format.html # don't forget if you pass html
            format.xls {
              filename = "Orders-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
              send_data(orders.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename, :disposition => 'attachment')
              return
            }
          end
        end

        def show
          @order = Order.find(params[:id])
        end
      end
    end
  end
end
