module Refinery
  module Orders
    class OrdersController < ::ApplicationController

      before_filter :find_all_orders
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @order in the line below:
        present(@page)
      end

      def show
        @order = Order.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @order in the line below:
        present(@page)
      end

      def new
        @order = Order.new
        @tier = Refinery::Tiers::Tier.find(params[:tier])
      end

      def create
        @order = Order.new(params[:order])
        @order.prepare(current_refinery_user)

        if @order.valid?
          response = EXPRESS_GATEWAY.setup_purchase(@order.price_in_cent,
            :ip                => request.remote_ip,
            :return_url        => refinery.root_url,
            # :currency          => "USD",
            :cancel_return_url => refinery.process_order_orders_orders_url,
            # :description => @order.tier_name,
            # :amount => 1
          )
          Rails.logger.debug '==========START DEBUG============'
          Rails.logger.debug "#{response.inspect}"
          Rails.logger.debug '===========END DEBUG============='
          redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)

          # Send email
          # Assign pledge to user
          # current_refinery_user.user_pledges.create tier_id: @order.tier_id
          
          # redirect_to '/thank-you'
        else
          @tier = @order.tier
          render :new
        end
      end

      def process_order
        
      end



    protected

      def find_all_orders
        @orders = Order.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/orders").first
      end

    end
  end
end
