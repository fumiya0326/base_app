FactoryBot.define do
  factory :sule do
    sequence(:name){|n| "TEST_SULE#{n}"}
    sequence(:content){|n|"TEST_CONTENT#{n}"}
    teamatr{"Tigers"}
  end
end
