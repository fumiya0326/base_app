require 'rails_helper'

RSpec.feature "Users", type: :feature do
    
    scenario "as user login will redirect back" do
    pending
        user=create(:user)
        sule=create(:sule)
        visit sule_show_path_url(:sule)
        
        expect(page).to have_content sule.name
        
        sign_in user
        
        expect(page).to have_content sule.name
    end
end
