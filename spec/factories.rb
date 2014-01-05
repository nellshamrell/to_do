FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "foo#{n}" }
  end

  factory :to_do_item do
    sequence(:description) { |n| "bar#{n}" }
    project
  end
end

class FactoryGirlHelper
  # When using attributes_for(some_factory). Factory Girl ignores associations.  This allows us to include them when we need them.
  # See http://stackoverflow.com/a/10294322 for more info

  def self.build_attributes(*args)
    FactoryGirl.build(*args).attributes.delete_if do |k, v|
        ["id", "created_at", "updated_at"].member?(k)
    end
  end
end
