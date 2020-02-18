require 'rails_helper'

RSpec.describe Comme, type: :model do
    before do
        @comme=build(:comme)
        
    end
    describe "comme validation" do 
        subject{@comme.valid?}
        
        it "comme should be valid" do
            expect(@comme).to be_valid
        end
        
        it "comment should not be empty"do
            @comme.comment=""
            is_expected.to eq(false)
        end
    end
end
