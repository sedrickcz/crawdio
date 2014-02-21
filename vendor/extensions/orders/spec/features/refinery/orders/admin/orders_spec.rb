# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Orders" do
    describe "Admin" do
      describe "orders" do
        refinery_login_with :refinery_user

        describe "orders list" do
          before do
            FactoryGirl.create(:order, :pay_type => "UniqueTitleOne")
            FactoryGirl.create(:order, :pay_type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.orders_admin_orders_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.orders_admin_orders_path

            click_link "Add New Order"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Pay Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Orders::Order.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Pay Type can't be blank")
              Refinery::Orders::Order.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:order, :pay_type => "UniqueTitle") }

            it "should fail" do
              visit refinery.orders_admin_orders_path

              click_link "Add New Order"

              fill_in "Pay Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Orders::Order.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:order, :pay_type => "A pay_type") }

          it "should succeed" do
            visit refinery.orders_admin_orders_path

            within ".actions" do
              click_link "Edit this order"
            end

            fill_in "Pay Type", :with => "A different pay_type"
            click_button "Save"

            page.should have_content("'A different pay_type' was successfully updated.")
            page.should have_no_content("A pay_type")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:order, :pay_type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.orders_admin_orders_path

            click_link "Remove this order forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Orders::Order.count.should == 0
          end
        end

      end
    end
  end
end
