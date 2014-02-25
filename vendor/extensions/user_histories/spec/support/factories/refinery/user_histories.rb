
FactoryGirl.define do
  factory :user_history, :class => Refinery::UserHistories::UserHistory do
    sequence(:field) { |n| "refinery#{n}" }
  end
end

