FactoryBot.define do
  factory :browsing_history do
    
    factory :correct_browsing_history do
      association :user
      association :sule
    end
    
    factory :no_user_browsing_history do
      association :sule
    end
    
    factory :no_sule_browsing_history do
      association :user
    end
    
  end
end
