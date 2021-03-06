class CommesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def new
        @newcomme=Comme.new
        respond_to do |format|
            format.html{}
            format.js{}
        end
    end
    
    def create
        @comme=Comme.new(comme_params)
        @comme.user_id= current_user.id
            if @comme.save
                #sule_ikioi=@comme.sule
                #sule_ikioi.ikioi+=1
                #sule_ikioi.save
                new_ch=@comme.comment_histories.new
                new_ch.user_id=current_user.id
                if new_ch.save
                    redirect_to sules_show_path(id: @comme.sule_id), notice: "コメントしました"
                end
            else
                redirect_to sules_show_path(id: @comme.sule_id), notice: "コメントに失敗しました"
            end
        comment_histories_limit=10
        history=current_user.comment_histories.all
        if history.count > comment_histories_limit
            history[0].destroy
        end
    end
  
    def destroy
        @comme=Comme.find_by(id: params[:id])
        @sule=@comme.sule
        if  @sule.user==current_user 
            @comme.destroy
            redirect_to sule_show_path_url(@sule)
        else
            redirect_to root_path
        end
    end
  
    
    private
        def comme_params
            params.require(:comme).permit(:comment,:sule_id, :image, :user_id)
        end
end
