
FactoryGirl.define do
  factory :tier, :class => Refinery::Tiers::Tier do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

