# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "UserHistories" do
    describe "Admin" do
      describe "user_histories" do
        refinery_login_with :refinery_user

        describe "user_histories list" do
          before do
            FactoryGirl.create(:user_history, :field => "UniqueTitleOne")
            FactoryGirl.create(:user_history, :field => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.user_histories_admin_user_histories_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.user_histories_admin_user_histories_path

            click_link "Add New User History"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Field", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::UserHistories::UserHistory.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Field can't be blank")
              Refinery::UserHistories::UserHistory.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:user_history, :field => "UniqueTitle") }

            it "should fail" do
              visit refinery.user_histories_admin_user_histories_path

              click_link "Add New User History"

              fill_in "Field", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::UserHistories::UserHistory.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:user_history, :field => "A field") }

          it "should succeed" do
            visit refinery.user_histories_admin_user_histories_path

            within ".actions" do
              click_link "Edit this user history"
            end

            fill_in "Field", :with => "A different field"
            click_button "Save"

            page.should have_content("'A different field' was successfully updated.")
            page.should have_no_content("A field")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:user_history, :field => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.user_histories_admin_user_histories_path

            click_link "Remove this user history forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::UserHistories::UserHistory.count.should == 0
          end
        end

      end
    end
  end
end
