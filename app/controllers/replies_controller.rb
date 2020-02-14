class RepliesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @reply=Reply.new(reply_params)
        @reply.user_id=current_user.id
        if @reply.save
            redirect_to sules_show_path(id: @reply.sule_id), notice: "コメントしました"
        else
            redirect_to sules_show_path(id: @reply.sule_id), notice: "コメントに失敗しました"
        end
    end
    
    private
        def reply_params
            params.require(:reply).permit(:reply, :sule_id, :comme_id, :user_id)
        end
end
