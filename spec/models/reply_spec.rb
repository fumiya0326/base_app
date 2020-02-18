require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe "validation"do
    before do
        @reply=FactoryBot.create(:correct_reply)
    end
      
    it "is valid  reply with user, comme, and sule"do
      expect(@reply).to be_valid
    end
    
    it "is invalid reply with empty content" do
      @reply.reply=nil
      expect(@reply).not_to be_valid
    end
    
    it "is invalid too long reply"do 
      @reply.reply="a"*201
      expect(@reply).not_to be_valid
    end
    
    context "validation of association"do
      
     it "is invalid reply without user"do 
        reply=build(:no_user_reply)
        expect(reply).not_to be_valid
      end
    
      it "is invalid reply without thread"do
        reply=build(:no_sule_reply)
        expect(reply).not_to be_valid
      end
      
      it "is invalid reply without comme"do
        reply=build(:no_comment_reply)
        expect(reply).not_to be_valid
      end
    end
  end
end
