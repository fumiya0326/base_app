require 'rails_helper'

RSpec.describe BrowsingHistory, type: :model do
  before do 
      @browsing_history=build(:correct_browsing_history)
  end
  
  it "is valid browsing history with user and thread"do 
    expect(@browsing_history).to be_valid
  end
  
  it "is invalid browsing history without user"do 
      new_bh=build(:no_user_browsing_history)
      expect(new_bh).not_to be_valid
  end
  
  it "is invalid browsing history without thread"do
      new_bh=build(:no_sule_browsing_history)
      expect(new_bh).not_to be_valid
  end
end
