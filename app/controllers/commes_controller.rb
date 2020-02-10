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
                redirect_to sules_show_path(id: @comme.sule_id), notice: "コメントしました"
            else
                redirect_to sules_show_path(id: @comme.sule_id), notice: "コメントに失敗しました"
            end
         
    end
    
    private
        def comme_params
            params.require(:comme).permit(:comment,:sule_id)
        end
end
