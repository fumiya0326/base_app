require 'rails_helper'

RSpec.describe CommentHistory, type: :model do
  describe "comment history validation" do 
     
     it "is valid comment history with user, reply, comme "do
         new_ch=build(:correct_browsing_history)
         new_ch.user_id=1
         new_ch.comme_id=1
         expect(new_ch).to be_valid
     end
     
     it "is invalid comment history without user" do
         new_ch=build(:no_user_comment_history)
         expect(new_ch).not_to be_valid
     end
    
    it "is valid comment history with only reply" do
        new_ch=build(:no_comment_comment_history)
        expect(new_ch).to be_valid
    end
    
    it "is valid comment history with only comment"do
        new_ch=build(:no_reply_comment_history)
        new_ch.user_id=1
        new_ch.comme_id=1
        new_ch.reply_id=nil
        expect(new_ch).to be_valid
    end
    
    it "is invalid comment history without content" do
        new_ch=build(:no_content_comment_history)
        expect(new_ch).to be_valid
    end
  end
end
