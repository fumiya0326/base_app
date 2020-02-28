FactoryBot.define do
  factory :comme do
    sequence(:comment){|n| "TEST_COMMENT#{n}"}
    association :user
    association :sule
    image{"image"}
  end
end
