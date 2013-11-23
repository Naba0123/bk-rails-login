class UsersController < ApplicationController

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
end
