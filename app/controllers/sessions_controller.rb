class SessionsController < ApplicationController

  skip_before_filter :check_logined

  def index
    # セッション残ってるのを心配してセッション切ってます・・・（いいのかな
    session[:user_id] = nil
    render 'new'
  end
  
  def new
  end
  
  def create
    user = User.find_by_account params[:account]
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      redirect_to :controller => 'tops', :action => 'index', :notice => "Logged in!"
    else
      flash.now.alert = "Invalid account or password"
      render 'login_failure'
    end
  end
  
  def destroy
    session[:user_id] = nil
    render "new", :notice => "Logged out!"
  end
  
end
