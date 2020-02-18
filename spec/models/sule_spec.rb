require 'rails_helper'

RSpec.describe Sule, type: :model do
  before do 
      @sule=build(:sule)
  end
  
  describe "validation" do
      subject{@sule.valid?}
      it "correct name and email should be valid" do
          is_expected.to eq(true)
      end
        
      
      it "sule name should not be empty" do
          @sule.name=""
          is_expected.to eq(false)
      end
      
      it "sule name should not too long" do 
         @sule.name="a"*21
         is_expected.to eq(false)
     end
     
     it "content should not be empty" do
         @sule.content=""
         is_expected.to eq(false)
     end
     
     it "content should not be too long" do
         @sule.content="a"*226
         is_expected.to eq(false)
     end
     
     it "teamatr should not too big"do
         @sule.teamatr='7'
         is_expected.to eq(false)
     end
     
     it "teamatr should be exist" do
         @sule.teamatr=""
         is_expected.to eq(false)
     end
         
 end
end
