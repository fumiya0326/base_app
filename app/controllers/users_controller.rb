class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
    end
    
    def following
        @title= "フォロー中の人"
        @user=User.find(params[:id])
        @users=@user.following
        render 'show_follow'
    end
    
    def followers
        @titile=""
        @user=User.find(params[:id])
        @users=@user.followers
        render 'show_follow'
    end
    
end
