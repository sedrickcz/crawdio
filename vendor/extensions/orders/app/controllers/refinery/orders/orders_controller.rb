module Refinery
  module Orders
    class OrdersController < ::ApplicationController
      protect_from_forgery :except => [:process_order]
      before_filter :find_all_orders, :except => [:process_order] 
      before_filter :find_page, :except => [:process_order]

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

        if @order.save
          
          redirect_to @order.paypal_url(refinery.root_url, refinery.process_order_orders_orders_url) 
        else
          @tier = @order.tier
          render :new
        end
      end

      def process_order
        if params[:item_number_1] && !params[:item_number_1].empty?
          #paypal sends an IPN even when the transaction is voided.
          if params[:payment_status] != 'Voided'
            @order = Refinery::Order.find(params[:item_number_1].to_i) rescue nil
            unless @order.nil?
              @order.cart_id = params[:invoice]
              @order.payment_status = params[:payment_status]
              @order.transaction_id = params[:txn_id]
              if params[:payment_status] == "Completed"
                @order.paid = true
                @order.paid_at = Time.now
                 # Send email
                # Assign pledge to user
                @order.user.user_pledges.create tier_id: @order.tier_id
              end
              @order.save
            end
          end
        end
        render :nothing => true
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
