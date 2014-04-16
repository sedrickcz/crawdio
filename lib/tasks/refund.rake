namespace :check do
  desc "Delete old files from images"
  task :refund_orders => :environment do
    Refinery::Orders::Order.where(paid: true).each do |order|
      if order.payment_status and order.payment_status.downcase == 'refunded'
        order.paid = false
        order.save
      end
    end
  end
end