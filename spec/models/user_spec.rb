require 'rails_helper'

RSpec.describe User, type: :model do

  before do
      @user=build(:user)
      @sule=build(:sule)
  end
  
  describe "validation" do
      subject{@user.valid?}
      it 'is valid with a name, email, and password' do
          is_expected.to eq(true)
      end
      
      it 'is invalid with a empty username' do
        @user.username=" "
        is_expected.to eq(false)
      end
      
      it 'is invalid with empty email' do
          @user.email=" "
          is_expected.to eq(false)
      end
      
      it 'is invalid  too long name' do
          @user.username="a"*21
          is_expected.to eq(false)
      end
      
      it "is invalid with a duplicate email" do
        User.create(
          username: "jhon",
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
          )
        user=User.new(
          username: "jon",
          email: "test@example.com",
          password: "password",
          password_confirmation:"password"
            )
        
        user.valid?
        expect(user.errors[:email]).to include("は既に使用されています。")
      end
      
      it "is invalid with a duplicate username" do
        User.create(
          username: "taro",
          email: "test@example.com",
          password:"password",
          password_confirmation:"password"
          )
        user=User.new(
          username: "taro",
          email: "test1@example.com",
          password: "password",
          password_confirmation:"password")
        user.valid?
        expect(user.errors[:username]).to include("は既に使用されています。")
      end
      context "user create "do
        
      it "allow new comment with authenticate user"do
        new_comment=build(:comme)
        expect(new_comment).to be_valid
      end
      
      it "allow new reply with authenticate user" do
        new_reply=create(:correct_reply)
        expect(new_reply).to be_valid
      end
    end
  end
end
