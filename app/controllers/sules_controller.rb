class SulesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def teamindex
  end
  
  
  def index
    @sules=Sule.where(teamatr: params[:teamatr]).order(:id)
    @newsule=Sule.new(:teamatr =>params[:teamatr])
  end
  
  def show
    @sule=Sule.find(params[:id])
    @commes=Comme.where(sule_id: params[:id])
    @newcomme=Comme.new(:sule_id => params[:id])
  end
  
  def create
    @sule=Sule.new(params[:sule].permit(:name, :teamatr))
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
  
    def ikioi
      (Time.now.to_i)-(@sule.created_at.to_i)/@sule.commes.count
    end
end
