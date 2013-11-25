class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  skip_before_filter :check_logined

  def new
    # セッション中にユーザー登録しないのでtopページに行く
    if session[:user_id]
      flash.notice = "既にログインしています"
      redirect_to sessions_url
    end
    @user = User.new
  end
  
  def create
    if params[:signup]
      @user = User.new(params[:user])
      if @user.save
        flash.notice = "アカウントが作成されました"
        redirect_to sessions_url
      else
        render "new"
      end
    else
      flash.notice = "アカウント作成がキャンセルされました"
      redirect_to sessions_url
    end
  end
  
  def edit
    render "edit"
  end
  
  def update
    if params[:update]
      if @user.update_attributes(params[:user])
        flash.notice = "アカウントが更新されました"
        redirect_to :controller => 'tops', :action => 'index'
      else
        render "edit"
      end
    else
      flash.notice = "アカウント更新がキャンセルされました"
      redirect_to :controller => 'tops', :action => 'index'
    end
  end
  
  private
    def set_user
      @user = User.find(session[:user_id])
    end
  
end
