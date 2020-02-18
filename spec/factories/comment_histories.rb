FactoryBot.define do
  factory :comment_history do
    factory :correct_comment_history do
      association :user
      association :comme
      association :reply
    end
    
    factory :no_user_comment_history do
      association :comme
      association :reply
    end
    
    factory :no_comment_comment_history do
      association :user
      association :reply
    end
    
    factory :no_reply_comment_history do
      association :user
      association :comme
    end
    
    factory :no_content_comment_history do
      association :user
    end
  end
end
