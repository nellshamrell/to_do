FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "foo#{n}" }
  end

  factory :to_do_item do
    sequence(:description) { |n| "bar#{n}" }
    project
  end
end
