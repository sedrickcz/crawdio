module Refinery
  module UserHistories
    class UserHistoriesController < ::ApplicationController

      before_filter :find_all_user_histories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user_history in the line below:
        present(@page)
      end

      def show
        @user_history = UserHistory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user_history in the line below:
        present(@page)
      end

    protected

      def find_all_user_histories
        @user_histories = UserHistory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/user_histories").first
      end

    end
  end
end
