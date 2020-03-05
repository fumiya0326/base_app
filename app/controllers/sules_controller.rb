class SulesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def teamindex
    @sules=Sule.all.order(ikioi: "DESC").limit(8)
    @new_sules=Sule.all.order(created_at: "DESC").limit(8)
    if user_signed_in?
      @browsing_histories=current_user.browsing_histories.all.order(created_at: "DESC")
      @followings=current_user.feed.page(params[:page]).per(8)
      @fav_sules=Sule.where(teamatr: current_user.fav_team).order(ikioi: "DESC").limit(8)
    end
    @chart=Sule.group(:teamatr).count
    @user=User.all
  end
  
  
  def index
    @sules=Sule.where(teamatr: params[:teamatr]).order(:id).page(params[:page]).per(20)
    @newsule=Sule.new(teamatr: params[:teamatr])
  end
  
  def itiran
    @sules=Sule.search(params[:search]).page(params[:page])
  end

  
  def show
    @sule=Sule.find(params[:id])
    @sule.ikioi=(@sule.commes.count+@sule.replies.count).to_f*86400/(Time.now.to_f-@sule.created_at.to_f)
    @sule.save
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
    
    @commes=Comme.where(sule_id: params[:id]).page(params[:page]).per(20).limit(1000)
    @newcomme=Comme.new(sule_id: params[:id])
    @newreply=Reply.new(sule_id: params[:id])
  
  end
  
  def create
    @sule=Sule.new(sule_params)
    @sule.user_id=current_user.id
    if @sule.save
      redirect_to sule_show_path_url(id: @sule.id), notice: '成功しました'
    else
      redirect_back(fallback_location: root_path)
    end
  end
  

  

  
  private
    def sule_params
       params.require(:sule).permit(:name,:teamatr, :content, :image, :ikioi)
    end      
  

end
