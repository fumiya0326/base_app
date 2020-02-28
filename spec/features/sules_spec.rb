require 'rails_helper'

RSpec.feature "Sules", type: :feature do

    scenario "user create new thread"do
        pending
        user=create(:user)
        sign_in user
        visit sule_index_path_url(teamatr: 1)
        

        expect{
            fill_in "スレッド名", with: "new thread"
            fill_in "スレッドの内容", with: "sample content"
            click_button "Create Sule"
            
            expect(page).to have_content "成功しました"
            expect(page).to have_content "new thread"
            expect(page).to have_content "sample content" 
        }.to change(Sule, :count).by(1)
        
        visit root_path
        expect(page).to have_content"new thread"
        expect(page).to have_content"sample content"
        
        click_on "ログアウト"
        expect(page).not_to have_content"new thread"
    end
    
    scenario "guest does not create thread"do
        visit sule_index_path_url(teamatr: 1)
        
        expect{
            fill_in "スレッド名", with: "new thread"
            fill_in "スレッドの内容", with: "sample content"
            click_button "Create Sule"
            
            expect(page).to have_content "ログインしてください"
        }.not_to change(Sule, :count)
    end
end
