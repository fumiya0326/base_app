require 'rails_helper'

RSpec.feature "Relationships", type: :feature do
    scenario "user create relationships other_user"do
        user=create(:user)
        other_user=create(:user)
        sign_in user
        visit users_show_path_url(user)
        expect(page).to have_content user.username
        expect(page).not_to have_content "フォローする"
        
        visit users_show_path_url(other_user)
        expect(page).to have_content other_user.username
        
        expect{
            click_on "フォローする"
        }.to change(user.active_relationships, :count).by(1)
        click_on"フォロワー数"
        expect(page).to have_content user.username
        
        visit users_show_path_url(other_user)
        expect{
            click_on "フォロー解除"
        }.to change(user.active_relationships, :count).by(-1)
        click_on "フォロワー数"
        expect(page).not_to have_content user.username
        
        click_on "ログアウト"
        visit users_show_path_url(user)
        expect(page).not_to have_content user.username
        expect(page).to have_content"アカウント登録もしくはログイン"
    end
end
