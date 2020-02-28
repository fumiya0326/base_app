class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
        @comment_histories=@user.comment_histories.order(created_at: "DESC")
        @followings=@user.following.all
        @today_comment=@user.commes.where("created_at LIKE?", "%#{Time.zone.today}%").count+ @user.replies.where("created_at LIKE?", "%#{Time.zone.today}%").count
        @yesterday_comment=@user.commes.where("created_at LIKE?", "%#{Time.zone.yesterday}%").count+ @user.replies.where("created_at LIKE?", "%#{Time.zone.yesterday}%").count
    end
    
    def following
        @title= "フォロー中の人"
        @user=User.find(params[:id])
        @users=@user.following.page(params[:page]).per(20)
        render 'show_follow'
    end
    
    def followers
        @titile=""
        @user=User.find(params[:id])
        @users=@user.followers.page(params[:page]).per(20)
        render 'show_follow'
    end
    
end
