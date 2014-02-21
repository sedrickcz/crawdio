
FactoryGirl.define do
  factory :order, :class => Refinery::Orders::Order do
    sequence(:pay_type) { |n| "refinery#{n}" }
  end
end

