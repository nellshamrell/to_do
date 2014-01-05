FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "foo#{n}" }
  end
end
