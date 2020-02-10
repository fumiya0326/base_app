class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    def create
        @user=User.find(params[:followed_id])
        current_user.follo(@user)
        redirect_to @user
    end
    
    def destroy
        @user=Relationship.find(params[:id]).follow
        current_user.unfollow(@user)
        redirect_to @user
    end
end
