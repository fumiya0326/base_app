require 'rails_helper'

RSpec.feature "Replies", type: :feature do
    scenario "user create reply"do
        pending
        user=create(:user)
        sule=create(:sule)
        sign_in user
        visit sule_show_path_url(sule)
        fill_in "コメント", with: "new comment"
        click_on ".btn btn-prymary"
        
        expect(page).to have_content user.username
        expect(page).to have_content "reply"
        expect{
            fill_in "Reply", with: "new reply"
            click_on "送信", match: :first
        }.to change(user.replies, :count).by(1)
        
        visit users_show_path_url(user)
        expect(page).to have_content "new reply"
    end
end
