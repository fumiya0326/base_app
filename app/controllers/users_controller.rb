class UsersController < ApplicationController
    before_action :authenticate_user!, only:[:update]
    def show
        @user=User.find(params[:id])
        @comment_histories=@user.comment_histories.order(created_at: "DESC")
        @followings=@user.following.all
        @sules=Sule.where(user_id: @user.id).order(created_at: "DESC").limit(5)
        @chart=@user.commes.group("date(created_at)").count
        @today_comment=@user.commes.where("created_at LIKE?", "%#{Time.zone.today}%").count+ @user.replies.where("created_at LIKE?", "%#{Time.zone.today}%").count
        @yesterday_comment=@user.commes.where("created_at LIKE?", "%#{Time.zone.yesterday}%").count+ @user.replies.where("created_at LIKE?", "%#{Time.zone.yesterday}%").count
    end
    
    def following
        @title ="フォロー中の人"
        @user=User.find(params[:id])
        @users=@user.following.page(params[:page]).per(20)
        render 'show_follow'
    end
    
    def followers
        @title ="フォロワー"
        @user=User.find(params[:id])
        @users=@user.followers.page(params[:page]).per(20)
        render 'show_follow'
    end
    
    def update
        @user=User.find_by(id: params[:id])
        @user.update(user_params)
           
            redirect_to users_show_path_url(@user)
    end
    
    private
    def user_params
        params.require(:user).permit(:fav_team)
    end
end
