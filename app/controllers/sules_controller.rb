class SulesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def teamindex
    if user_signed_in?
      @browsingH=current_user.browsing_histories.all
      @followings=current_user.feed.page(params[:page])
    end
  end
  
  
  def index
    @sules=Sule.where(teamatr: params[:teamatr]).order(:id)
    @newsule=Sule.new(:teamatr =>params[:teamatr])
  end
  
  def show
    @sule=Sule.find(params[:id])
    if current_user
      new_bh=@sule.browsing_histories.new
      new_bh.user_id=current_user.id
    
      if current_user.browsing_histories.exists?(sule_id: "#{params[:id]}")
        old_bh=current_user.browsing_histories.find_by(sule_id: "#{params[:id]}")
        old_bh.destroy
      end
      new_bh.save
    
      bh_limit=6
      history=current_user.browsing_histories.all
      if history.count > bh_limit
        history[0].destroy
      end
    end
    
    @commes=Comme.where(sule_id: params[:id]).page(params[:page]).per(20)
    @newcomme=Comme.new(:sule_id => params[:id])
    @newreply=Reply.new(:sule_id =>params[:id])
  
  end
  
  def create
    @sule=Sule.new(sule_params)
    if @sule.save
      redirect_to sule_show_path_url(id: @sule.id), notice: '成功しました'
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def new
        @newcomme=Comme.new
        respond_to do |format|
            format.html{}
            format.js{}
        end
  end
  
  private
    def sule_params
       params.require(:sule).permit(:name,:teamatr, :content)
    end      
  

end
