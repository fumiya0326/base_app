class RepliesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @reply=Reply.new(reply_params)
        @reply.user_id=current_user.id
        @reply.sule.ikioi+=1
            if @reply.save
                #@reply.sule.ikioi+= 1
                #@reply.sule.save
                redirect_to sules_show_path(id: @reply.sule_id), notice: "コメントに返信しました"
                new_ch=@reply.comment_histories.new
                new_ch.user_id=current_user.id
                new_ch.save
            else
                redirect_to sules_show_path(id: @reply.sule_id), notice: "コメントに失敗しました"
            end
        
        comment_histories_limit=10
        history=current_user.comment_histories.all
        if history.count > comment_histories_limit
            history[0].destroy
        end
    end
    
    private
        def reply_params
            params.require(:reply).permit(:reply, :sule_id, :comme_id, :user_id, :image)
        end
end
