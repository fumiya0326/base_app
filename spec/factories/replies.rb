FactoryBot.define do
  factory :reply do
    reply{"sample reply"}
    
    factory :correct_reply do
      association :user
      association :sule
      association :comme 
    end
    
    factory :no_sule_reply do 
      association :user
      association :comme
    end
    
    factory :no_user_reply do
      association :comme
      association  :sule
    end
    
    factory :no_comment_reply do 
      association :user
      association :sule
    end
    
  end
end
