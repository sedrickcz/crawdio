require 'spec_helper'

module Refinery
  module UserHistories
    describe UserHistory do
      describe "validations" do
        subject do
          FactoryGirl.create(:user_history,
          :field => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:field) { should == "Refinery CMS" }
      end
    end
  end
end
