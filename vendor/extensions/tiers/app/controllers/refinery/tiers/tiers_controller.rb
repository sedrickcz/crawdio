module Refinery
  module Tiers
    class TiersController < ::ApplicationController

      before_filter :find_all_tiers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tier in the line below:
        present(@page)
      end

      def show
        @tier = Tier.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tier in the line below:
        present(@page)
      end

    protected

      def find_all_tiers
        @tiers = Tier.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tiers").first
      end

    end
  end
end
