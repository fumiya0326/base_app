require 'rails_helper'

RSpec.feature "Commes", type: :feature do
    
    scenario "user create new comment and comment_histories"do 
        pending
        user=create(:user)
        sule=create(:sule)
        sign_in user
        visit sules_show_path(id: sule.id)
        click_on "コメントする"
        sleep 1
        expect(page).to have_content"こめんと"
        expect(page).to have_content "コメントを送信"
        expect{ 
            fill_in "コメント", with: "new comment",visible: false
            click_button "コメントを送信", visible: false
            
            expect(page).to have_content user.username
            expect(page).to have_content"new comment"
            expect(page).to have_content"コメントしました"
            expect(page).to have_content"reply"
        }.to change(user.commes , :count)
        
        visit users_show_path_url(user)
        expect(page).to have_content "new comment"
        
        
        expect(page).to have_content"ログアウト"
        expect(page).not_to have_content"ユーザー登録"
        click_on"ログアウト"
        expect(page).to have_content"ログアウトしました"
        
        visit sules_show_path(id: sule.id)
        expect(page).not_to have_content"reply"
        
    end
    
    scenario "guest does not create new comment"do
        sule=create(:sule)
        visit sules_show_path(id: sule.id)
        expect(page).to_not have_content"コメントする"
        expect(page).not_to have_content"ログアウト"

    end
end
