class SessionsController < ApplicationController

  skip_before_filter :check_logined

  def index
    render 'new'
  end
  
  def new
    # セッション中ならtopページに行く
    if session[:user_id]
      flash.notice = "既にログインしています"
      redirect_to :controller => 'tops', :action => 'index'
    end
  end
  
  def create
    if params[:login]
      user = User.find_by_account params[:account]
      if user && user.authenticate(params[:pass])
        session[:user_id] = user.id
        flash.notice = "ログインしました"
        redirect_to :controller => 'tops', :action => 'index'
      else
        flash.notice = "アカウント名またはパスワードが間違っています"
        render 'new'
      end
    else
      redirect_to :controller => 'users', :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash.notice = "ログアウトしました。"
    render "new"
  end
  
end
